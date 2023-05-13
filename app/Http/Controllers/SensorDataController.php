<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SensorDataController extends Controller
{
    public function displayData(){
        return view('index/dashboard');
    }

    public function save(Request $request){

    }
//mando i dati a video
    public function ViewData(Request $request){
        return view('index.dashboard');

    }
    // richiedo i dati
    public function index(){
        $user_id = Auth::User()->id;
        $data = DB::select(`us.id as Us_ID,
        us.name as US_name,
        h.Name as HomeName,
        r.Type,S.Id as Sensor_ID,SD.Value_Sensor,
        Sd.Mesured FROM user as us JOIN user_house as us_ho on (us.id=us_ho.id)join House as H on (us_ho.ID_House = h.Id)
        join Rooms as R on(r.Id_House = h.id) join Sensor as S on(s.Id_Room = R.Id) join sensor_data as SD on(SD.Id_Sensor = S.Id)
        where us.Id = $user_id;`);
        return view('index.dashboard',['data'=>$data]);
    }
}
