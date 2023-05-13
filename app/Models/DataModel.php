<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DataModel extends Model
{
    use HasFactory;
    protected $table = 'users';
    protected $fillable = ['User_ID','User_name','Home_Name','Sensor_ID','Value_Sensor','Mesured'];
}
