<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Plant extends Model
{
    use HasFactory;

    protected $fillable = [

    ];

    public function favoris(){
        return $this->belongsToMany(User::class, 'plants_users');
    }

    public function myPlant(){
        return $this->belongsToMany(MyPlant::class, 'my_plants');
    }

}
