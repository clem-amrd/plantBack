<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CatController;
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
        // Route::get('/', [UserController::class, 'index'])->name('users');
    });

    Route::prefix('cat')->group(function () {
        Route::post('/search', [CatController::class, 'search']);
        Route::post('/filters', [CatController::class, 'filters']);  
        Route::get('/', [CatController::class, 'index']);
        Route::get('/displayCats', [CatController::class, 'displayCats']);
        Route::get('/urgent', [CatController::class, 'catAvailableUrgent']);
        Route::get('/allCats', [CatController::class, 'catAvailable']);
        Route::get('/new', [CatController::class, 'catAvailableNew']);
        Route::get('/allDepartement', [CatController::class, 'allDepartement']);
        Route::get('/departement/{id}', [CatController::class, 'departementbyId']);
        Route::get('/addFavoris/{cat}', [CatController::class, 'addFavoris']);
        Route::get('/allfavoris', [CatController::class, 'displayFavoris']);
        Route::get('/favoris/{id}', [CatController::class, 'favorisById']);
        Route::post('/count', [CatController::class, 'countFavoritedCats']);
        Route::get('/deleteFavoris/{cat}', [CatController::class, 'deleteFavoris']);
        Route::get('/{cat}', [CatController::class, 'indexbyid']);
        Route::post('/store', [CatController::class, 'store']);
        Route::put('/update/{cat}', [CatController::class, 'update']);
        Route::delete('/delete/{cat}', [CatController::class, 'destroy']);
    });

    Route::prefix('adoption')->group(function () {
        Route::post('/currentAdoption', [AdoptionController::class, 'currentAdoption']);
        Route::post('/store', [AdoptionController::class, 'store']);
        Route::get('/userAdoption', [AdoptionController::class, 'userAdoption']);
        Route::get('/ownerAdoption', [AdoptionController::class, 'userAdoptionMyCat']);
        Route::put('/update', [AdoptionController::class, 'update']);
        Route::get('/destroy/{adoption}', [AdoptionController::class, 'destroy']);
        Route::get('/', [AdoptionController::class, 'index']);
        Route::get('/{id}', [AdoptionController::class, 'indexbyid']);
    });
    Route::prefix('photo')->group(function () {
        Route::post('/store', [PhotoController::class, 'storeImage']);
        Route::get('/loadImage/{catId}', [PhotoController::class, 'loadImage']);
        Route::get('/destroy/{photoId}', [PhotoController::class, 'destroy']);
    });
});

//Route::apiResource('posts', PostController::class)->middleware('auth:sanctum');