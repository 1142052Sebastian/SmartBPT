<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class AllHouse extends Model
{
    use HasFactory;

    protected $table = 'user_houses';

    public function getData()
    {
        $data = ExampleModel::all();
        return view('dashboard')->with('data', $data);
    }
}
