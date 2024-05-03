<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PlantController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AdoptionController;
use App\Http\Controllers\PhotoController;

use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/auth/register', [AuthController::class, 'createUser']);
Route::post('/auth/login', [AuthController::class, 'loginUser']);

Route::group(['middleware' => 'auth:sanctum'], function(){

    Route::prefix('auth')->group(function () {
        Route::get('/logoff', [AuthController::class, 'logoffUser']);
    });

    Route::prefix('user')->group(function () {
        Route::get('/userAuth', [UserController::class, 'userAuth']);
        Route::post('/update', [UserController::class, 'update']);
        Route::put('/UpdatePswd', [UserController::class, 'UpdatePswd']);
        Route::get('/haveNoPswd', [UserController::class, 'haveNoPswd']);
        Route::get('/showInfo', [UserController::class, 'showInfo'])->name('showInfo');
        Route::delete('/delete', [UserController::class, 'destroy']);
        Route::get('/{id}', [UserController::class, 'showinfoById']);
        Route::post('/conditionUser', [UserController::class, 'conditionUser']);
        // Route::get('/', [UserController::class, 'index'])->name('users');
    });

    Route::prefix('plant')->group(function () {
        Route::post('/filters', [PlantController::class, 'filters']);  
        Route::post('/search', [PlantController::class, 'search']);
        Route::get('/allMyPlant', [PlantController::class, 'allMyPlant']);
        Route::get('/recommendation', [PlantController::class, 'recommendation']);  
        Route::get('/', [PlantController::class, 'index']);
        Route::get('/allRegion', [PlantController::class, 'allRegion']);
        Route::get('/region/{id}', [PlantController::class, 'regionbyId']);
        Route::get('/addPlant/{plant}', [PlantController::class, 'store']);
        Route::get('/deletePlant/{plant}', [PlantController::class, 'deletePlant']);
        Route::get('/addFavoris/{plant}', [PlantController::class, 'addFavoris']);
        Route::get('/allfavoris', [PlantController::class, 'displayFavoris']);
        Route::get('/favoris/{id}', [PlantController::class, 'favorisById']);
        Route::get('/deleteFavoris/{plant}', [PlantController::class, 'deleteFavoris']);
        Route::get('/{plant}', [PlantController::class, 'indexbyid']);
        Route::get('/watering/{plant}', [PlantController::class, 'watering']);
        Route::get('/wateringPlant/{plant}', [PlantController::class, 'wateringPlant']);
    });

    // Route::prefix('adoption')->group(function () {
    //     Route::post('/currentAdoption', [AdoptionController::class, 'currentAdoption']);
    //     Route::post('/store', [AdoptionController::class, 'store']);
    //     Route::get('/userAdoption', [AdoptionController::class, 'userAdoption']);
    //     Route::get('/ownerAdoption', [AdoptionController::class, 'userAdoptionMyCat']);
    //     Route::put('/update', [AdoptionController::class, 'update']);
    //     Route::get('/destroy/{adoption}', [AdoptionController::class, 'destroy']);
    //     Route::get('/', [AdoptionController::class, 'index']);
    //     Route::get('/{id}', [AdoptionController::class, 'indexbyid']);
    // });
    // Route::prefix('photo')->group(function () {
    //     Route::post('/store', [PhotoController::class, 'storeImage']);
    //     Route::get('/loadImage/{catId}', [PhotoController::class, 'loadImage']);
    //     Route::get('/destroy/{photoId}', [PhotoController::class, 'destroy']);
    // });
});

//Route::apiResource('posts', PostController::class)->middleware('auth:sanctum');