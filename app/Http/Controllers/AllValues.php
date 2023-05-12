<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AllValues extends Controller
{
    public function index() {

        return view('index.dashboard');
    }
    public function alldata(Request request)
        $user_id = Auth::user()->id; // Ottiene l'id dell'utente autenticato
        $query = "(SELECT us.id,us.name,h.Name,r.Type,S.Id,SD.Value_Sensor,Sd.Mesured 
                  FROM `user` as us 
                  JOIN user_house as us_ho on (us.id=us_ho.id)
                  join House as H on (us_ho.ID_House = h.Id) 
                  join Rooms as R on(r.Id_House = h.id) 
                  join Sensor as S on(s.Id_Room = R.Id) 
                  join sensor_data as SD on(SD.Id_Sensor = S.Id) 
                  where us.Id = $user_id)";
     
        $results = DB::select($query); // Esegue la query e ottiene i risultati
     
        return view('index.dashboard', compact('results')); // Passa i risultati alla vista home.blade.php
     }
     
}
