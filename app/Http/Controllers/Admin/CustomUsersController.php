<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CustomUsersController extends Controller
{
    public function index(){
        return view('index/dashboard');
    }
}
