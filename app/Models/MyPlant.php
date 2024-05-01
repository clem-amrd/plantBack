<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MyPlant extends Model
{
    use HasFactory;

    public function myPlant(){
        return $this->belongsToMany(Plant::class, 'my_plants');
    }
}
