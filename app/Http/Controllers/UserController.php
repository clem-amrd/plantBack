<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
//use App\Http\Controllers\Redirect;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    //récuperer tous les utilisateurs
    public function index()
    {
        return User::all();
    }

    public function userAuth()
    {
        $user = Auth::User();
        return $user;
    }
    //récuperer un nom de l'user connecté
    public function showinfo(User $user)
    {
        $user = Auth::user();
        $https = "https://";
        if(strpos($user->avatar, $https) === false){
            $url = Storage::url('Image/' . $user->avatar);
        }else{
            $url = $user->avatar;
        }
        $response = [
            'user' => $user,
            'avatarUrl' => $url,
        ];
        return response()->json($response);
    }
    
    //récuperer un nom d'un user
    public function showinfoById($id)
    {
        $user = User::where("id", $id)->first();
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }
        $https = "https://";
        if($user->avatar == null){
            $url = Storage::url('Image/inconnu.jpg');
        }
        else if(strpos($user->avatar, $https) === false){
            $url = Storage::url('Image/' . $user->avatar);
        }else{
            $url = $user->avatar;
        }
        $response = [
            'user' => $user,
            'avatarUrl' => $url
        ];
        return response()->json($response);
    }

    //modifier les infos de l'utilisateur
    public function update(Request $request)
    {
        $user = Auth::User();
            $data = $request->validate([
                'name' => 'required|string|max:255',
                'avatar' => 'sometimes|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]);
        if($request->hasFile('avatar')){
            $image = $request->file('avatar');
            $imageName = time() . '.' . $image->extension();
            $image->storeAs('Image', $imageName, 'public');
            $data['avatar'] = $imageName;
            $user->update($data);
        }else{
            $user->update(['name' => $data['name']]);
        }
        return $user;
    }

    public function haveNoPswd(Request $request){
        $user = Auth::User();
        $pswdNotExist = is_null($user->password);
        return $pswdNotExist;
    }

    public function UpdatePswd(Request $request){
        $user = Auth::User();

            $data = $request->validate([
                'current_password' => 'required|string|max:255',
                'new_password' => 'required|string|max:255',
                'confirmation_password' => 'required|string|max:255',
            ]);

            if (Hash::check($request->current_password, $user->password)) {
                if($request->new_password == $request->confirmation_password){
                    $user->update([
                        'password' => Hash::make($request->password)
                    ]);
                    return response()->json(['reponse' => 'Mot de passe modifié']);
                }else{
                    return response()->json(['reponse' => 'les deux mots de passe ne correspondent pas']);
                }
            }else{
                return response()->json(['reponse' => 'mot de passe actuel incorrect']);
            }
    }

    //supprimer un utilisateur
    public function destroy(User $user)
    {
        $user = Auth::user();
        $user->delete();
        return response()->json(['message' => 'suppr']);
    }

    public function conditionUser(Request $request)
    {
        $user = Auth::user();
        $data = $request->validate([
            'experience' => 'sometimes|integer',
            'habitat' => 'sometimes|integer',
            'region' => 'sometimes|integer',
            'dimension' => 'sometimes|integer'
        ]);
    
        // Affecter les valeurs validées à l'utilisateur
        if (isset($data['experience'])) {
            $user->experience = $data['experience'];
        }
        if (isset($data['habitat'])) {
            $user->habitat_id = $data['habitat'];
        }
        if (isset($data['region'])) {
            $user->localisation_id = $data['region'];
        }
        if (isset($data['dimension'])) {
            $user->vegetable_garden_size = $data['dimension'];
        }
    
        // Enregistrer les modifications dans la base de données
        $user->save();
    
        return $user;
    }

}
