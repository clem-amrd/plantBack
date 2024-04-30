<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PlantController extends Controller
{
    //ajouter un chat aux favoris
    public function addFavoris(cat $cat)
    {
        $user = Auth::user();
        $fav = $user->favoris()->wherePivot('cat_id', $cat->id)->exists();
        $ownCat = Cat::Where('id', $cat->id)->where('user_id', $user->id)->exists();
        $adoptedCat = Adoption::Where('cat_id', $cat->id)->where('statut_id', 2)->exists();
        if(!$fav && !$ownCat && !$adoptedCat){
            $user->favoris()->attach($cat->id);
            CatFavoritedEvent::dispatch($cat);
            return $user;
        }else{
            return response()->json(['message' => 'ce chat est à vous ou est déjà dans vos favoris'], 200);
        }
    }

       //tout les favoris de l'user
       public function displayFavoris()
       {
           // dd("start");
           $user = Auth::user();
           $fav = $user->favoris()->exists();
           if (!$fav) {
               return response()->json(['message' => 'Vous n avez pas de chat à vos favoris'], 200);
           }else{
           $data = $user->favoris()->get();
           $response = $data->map(function ($cat) {
               $catData = $cat->toArray();
               $catData['localisation'] = $cat->localisation ? $cat->localisation->departement : null;
               $photoName = $cat->photos->first() ? $cat->photos->first()->name : null;
               $catData['photo'] = Storage::url('Image/' . $photoName);
               return $catData;
           });
           return response()->json($response);
           }
       }

       public function deleteFavoris(cat $cat)
       {
           $user = Auth::user();
           $fav = $user->favoris()->where('cats_users.cat_id', $cat->id)->first();
           if (!$fav) {
               return response()->json(['message' => 'ce chat n\'est pas dans vos favoris'], 200);
           }else{
           $user->favoris()->detach($cat->id);
           CatFavoritedEvent::dispatch($cat);
           return response()->json(['message' => 'suppr'], 200);
           }
       }

       public function allDepartement()
       {
           return Localisation::all();
       }

       public function departementbyId($id)
       {
           $res = Localisation::find($id);
           if (!$res) {
               return response()->json(['message' => 'aucun departement ne correspond'], 200);
           }
           return $res;
       }
   
       public function search(Request $request)
       {
           $key = trim($request->get('search'));
           $catAvailable = $this->catAvailable();
   
           $filteredCats = $catAvailable->filter(function ($cat) use ($key) {
               return stripos($cat->name, $key) !== false;
           })->values(); 
   
           return response()->json(['chats' => $filteredCats]);
       }
   
       public function searchWithFilters($cats, $key)
       {
           $filteredCats = $cats->filter(function ($cat) use ($key) {
               return stripos($cat->name, $key) !== false;
           })->values(); 
           return $filteredCats;
       }
   
       public function filters(Request $request)
       {
           $data = $request->validate([
               'ageMin' => 'sometimes|integer|between:0,25',
               'ageMax' => 'sometimes|integer|between:0,25',
               'sex' => 'sometimes|string|max:255',
               'localisation_id' => 'sometimes|integer',
               'urgence' => 'sometimes|boolean',
               'search' => 'nullable|string|max:255'
           ]);
   
           $userId = Auth::user()->id;   
           $catNotAvailable = Adoption::where('statut_id', 2)->pluck('cat_id')->toArray();
           $ownCat = Cat::where('user_id', $userId)->pluck('id')->toArray();
   
           $arrayId = array_merge($catNotAvailable, $ownCat);
   
           $query = Cat::whereNotIn('id', $arrayId);
           
   
               if (isset($data['ageMin'])) {
                   $query->where('age', '>=', $data['ageMin']);
               }
               if (isset($data['ageMax'])) {
                   $query->where('age', '<=', $data['ageMax']);
               }
               if (isset($data['sex'])) {
                   $query->where('sex', $data['sex']);
               }
               if (isset($data['localisation_id'])) {
                   $query->where('localisation_id', $data['localisation_id']);
               }
               if (isset($data['urgence'])) {
                   $query->where('urgent', $data['urgence']);
               }
               $catAvailable = $query->get();
   
               if (isset($data['search'])) {
               $searchTerm = trim($request->get('search'));
               $catAvailable = $this->searchWithFilters($catAvailable, $searchTerm);
               
           }
   
           if ($catAvailable->isEmpty()) {
               return response()->json(['message' => 'Il n\'y a aucun chat disponible'], 200);
           }
           $response = $catAvailable->map(function ($cat) use ($userId){
               $catData = $cat->toArray();
               $catData['localisation'] = $cat->localisation ? $cat->localisation->departement : null;
               $photoName = $cat->photos->first() ? $cat->photos->first()->name : null;
               $catData['photo'] = Storage::url('Image/' . $photoName);
               $catData['fav'] = $cat->favoris()->where('user_id', $userId)->exists();
               return $catData;
           });
           return $response;
       }
   
       // voir un chat specifique
       public function indexbyid(cat $cat)
       {
           $userId = Auth::user()->id;
           if (!$cat) {
               return response()->json(['message' => 'aucun chat ne correspond'], 200);
           }
           $cat->localisation = $cat->localisation ? $cat->localisation->departement : null;
           $cat->favoris = $cat->favoris()->where('user_id', $userId)->exists();
       
           return $cat;
       }
   
}
