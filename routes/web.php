<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Models\User;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test', function () {
    return "test";
});

Route::prefix('google')->group(function () {

    Route::get('/auth/redirect', function () {
        return Socialite::driver('google')->redirect();
    });

    Route::get('/auth/callback', function () {
        $googleUser = Socialite::driver('google')->stateless()->user();

        //dd($googleUser);
    
        $user = User::where('google_id', $googleUser->id)->first();

        if ($user) {
            $user->update([
                'facebook_id' => $googleUser->id,
                'email' => $googleUser->email
            ]);

            $user->tokens->each(function ($token, $key) {
                $token->delete();
            });

        } else {
            $user = User::create([
                'google_id' => $googleUser->id,
                'name' => $googleUser->name,
                'email' => $googleUser->email,
                'avatar' => $googleUser->avatar,
            ]);
        }
        Auth::login($user);
        // dd($user);
    
        return response()->json([
            'status' => true,
            'message' => 'User Created or logged Successfully',
            'token' => $user->createToken("API TOKEN")->plainTextToken
        ], 200);
    });
});

Route::prefix('facebook')->group(function () {

    Route::get('/auth/redirect', function () {
        return Socialite::driver('facebook')->redirect();
    });

    Route::get('/auth/callback', function () {
        $facebookUser = Socialite::driver('facebook')->stateless()->user();

        dd($facebookUser);
    
        $user = User::updateOrCreate([
            'facebook_id' => $facebookUser->id,
        ], [
            'name' => $facebookUser->name,
            'email' => $facebookUser->email,
            'avatar' => $facebookUser->avatar,
        ]);
    
        Auth::login($user);
    
        return response()->json([
            'status' => true,
            'message' => 'User Created or logged Successfully',
            'token' => $user->createToken("API TOKEN")->plainTextToken
        ], 200);
    });
});