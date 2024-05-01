<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable 
{
    use HasApiTokens, HasFactory, Notifiable;
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
    'google_id',
    'name', 
    'email',
    'password',
    'avatar',
    'vegetable_garden_size' ,
    'habitat_id' ,
    'localisation_id' 
    ];

    public function favoris(){
        return $this->belongsToMany(Plant::class, 'plants_users');
    }
}
