<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Plant;
use App\Models\User;
use App\Models\Localisation;
use App\Models\MyPlant;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class PlantController extends Controller
{

    //FONCTIONNE
    public function index()
    {
        return Plant::all();
    }

    //FONCTIONNE
    //ajouter une plante aux favoris
    public function addFavoris(plant $plant)
    {
        $user = Auth::user();
        $fav = $user->favoris()->wherePivot('plant_id', $plant->id)->exists();
        if(!$fav){
            $user->favoris()->attach($plant->id);
            return $user;
        }else{
            return response()->json(['message' => 'Cette plante est déjà dans vos favoris'], 200);
        }
    }

    // FONCTIONNE
    //ajouter une plante au potager/modifier le nombre
    public function store(Request $request)
    {
        $data = $request->validate([
            'plant_id' => 'required|integer',
            'number' => 'required|integer'
        ]);
        // dd("start");
        $userId = Auth::user()->id;
        $plantExist = MyPlant::where('plant_id', $data['plant_id'])->where('user_id', $userId)->exists();
            if(!$plantExist){
                $addPlant = new MyPlant();
                $addPlant->plant_id = $data['plant_id'];
                $addPlant->number = $data['number'];
                $addPlant->user_id = $userId;
                $addPlant->save();
                return $addPlant;
            }else{
                $addPlant = $plantExist = MyPlant::where('plant_id', $data['plant_id'])->where('user_id', $userId)->first();
                $addPlant->number = $data['number'];
                $addPlant->save();
                return $addPlant;
            } 
    }

    //FONCTIONNE
    //suppr une plante d'un potager
    public function deletePlant(plant $plant)
    {
        $user = Auth::user();
        $plantToDelete = MyPlant::where('plant_id', $plant->id)->where('user_id', $user->id)->first();
        if (!$plantToDelete) {
            return response()->json(['message' => 'cette plante n\'est pas dans votre potager'], 200);
        }else{
        $plantToDelete->delete();
        return response()->json(['message' => 'suppr'], 200);
        }
    }

    //FONCTIONNE
    //tout les favoris de l'user
    public function displayFavoris()
    {
        // dd("start");
        $user = Auth::user();
        $fav = $user->favoris()->exists();
        if (!$fav) {
            return response()->json(['message' => 'Vous n avez pas de plante à vos favoris'], 200);
        }else{
        $data = $user->favoris()->get();
        $response = $data->map(function ($plant) {
            $plantData = $plant->toArray();
            return $plantData;
        });
        return response()->json($response);
        }
    }

    //FONCTIONNE
    public function deleteFavoris(plant $plant)
    {
        $user = Auth::user();
        $fav = $user->favoris()->where('plants_users.plant_id', $plant->id)->first();
        if (!$fav) {
            return response()->json(['message' => 'cette plante n\'est pas dans vos favoris'], 200);
        }else{
        $user->favoris()->detach($plant->id);
        return response()->json(['message' => 'suppr'], 200);
        }
    }

    //FONCTIONNE PAS
    public function recommendation()
    {
        $user = Auth::user();
        $conditionOfUser = User::where('id', $user->id)->first();
        $currentMonth = Carbon::now()->format('m');
        $experience = $conditionOfUser->experience;
        $habitat = $conditionOfUser->habitat_id;
        $localisation = $conditionOfUser->localisation_id;
        $average_temperature = Localisation::where('id', $localisation)->value('average_temperature');
        // dd($average_temperature, $experience, $habitat, $currentMonth);
        $recommendation = Plant::where('temperature_min', '<', $average_temperature)
                                ->where('temperature_max', '>', $average_temperature)
                                ->where('difficulty', $experience)
                                // ->whereJsonContains('compatibility->habitat', $habitat)
                                ->whereJsonContains('seed_months->months', $currentMonth)
                                ->get()->toArray();
        
        if (empty($recommendation)) {
            return response()->json(['message' => 'aucune plante ne correspond à votre situation pour le moment'], 200);
        }else{
            return $recommendation;
        }
    }

    //FONCTIONNE PAS
    // public function seedCalcul()
    // {
    //     $user = Auth::user();
    //     $gardenPlants = MyPlant::where('user_id', $user->id)->value('id')->toArray();
    //     $gardenSize = User::where('id', $user->id)->value('vegetable_garden_size');
    //     for($i = 0; $i<$gardenPlants.length; $i++){
    //         $space = Plant::where('id', $gardenPlants[$i])->value('row_spacing');
            
    //     }
    //     if (!$fav) {
    //         return response()->json(['message' => 'cette plante n\'est pas dans vos favoris'], 200);
    //     }else{
    //     $user->favoris()->detach($plant->id);
    //     return response()->json(['message' => 'suppr'], 200);
    //     }
    // }

    //FONCTIONNE
    public function allRegion()
    {
        return Localisation::all();
    }

    //FONCTIONNE
    public function regionbyId($id)
    {
        $res = Localisation::find($id);
        if (!$res) {
            return response()->json(['message' => 'aucune région ne correspond'], 200);
        }
        return $res;
    }

    //FONCTIONNE
    public function search(Request $request)
    {
        $key = trim($request->get('search'));
        $plantAvailable = Plant::get();
        $filteredPlants = $plantAvailable->filter(function ($plant) use ($key) {
            return stripos($plant->name, $key) !== false;
        })->values(); 

        return response()->json(['plantes' => $filteredPlants]);
    }

    public function searchWithFilters($plants, $key)
    {
        $filteredPlants = $plants->filter(function ($plant) use ($key) {
            return stripos($plant->name, $key) !== false;
        })->values(); 
        return $filteredPlants;
    }

    //FONCTIONNE
    public function filters(Request $request)
    {
        $data = $request->validate([
            'seedMonth' => 'sometimes|string',
            'fruitMonth' => 'sometimes|string',
            'difficulty' => 'sometimes|integer|between:0,2',
            'fruit' => 'sometimes|integer|between:0,1',
            'compatibilty' => 'sometimes|integer|between:0,3',
            'search' => 'nullable|string|max:255'
        ]);

        $userId = Auth::user()->id;
        $query = Plant::query();
        
            if (isset($data['seedMonth'])) {
                $query->whereJsonContains('seed_months->months', $data['seedMonth']);
            }
            if (isset($data['fruitMonth'])) {
                $query->whereJsonContains('fruit_months->months', $data['fruitMonth']);
            }
            if (isset($data['difficulty'])) {
                $query->where('difficulty', $data['difficulty']);
            }
            if (isset($data['fruit'])) {
                $query->where('fruit', $data['fruit']);
            }
            if (isset($data['compatibilty'])) {
                $query->where('compatibilty', $data['compatibilty']);
            }
            $plantAvailable = $query->get();

            if (isset($data['search'])) {
            $searchTerm = trim($request->get('search'));
            $plantAvailable = $this->searchWithFilters($plantAvailable, $searchTerm);
        }

        if ($plantAvailable->isEmpty()) {
            return response()->json(['message' => 'aucun fruits ou légume ne correspond à votre recherche'], 200);
        }
        $response = $plantAvailable->map(function ($plant) use ($userId){
            $plantData = $plant->toArray();
            $plantData['fav'] = $plant->favoris()->where('user_id', $userId)->exists();
            return $plantData;
        });
        return $response;
    }

    // FONCTIIONNE
    public function indexbyid(plant $plant)
    {
        $userId = Auth::user()->id;
        if (!$plant) {
            return response()->json(['message' => 'aucune plante ne correspond'], 200);
        }
        $plant->favoris = $plant->favoris()->where('user_id', $userId)->exists();
        return $plant;
    }
}
