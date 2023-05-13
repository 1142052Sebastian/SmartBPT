<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DataModel;

class DataController extends Controller
{
    public function index(){
        $data = DataModel::join('User_house as uh', 'uh.userId', '=', 'users.ID')
        ->join('House', 'House.id', '=', 'uh.houseId')
        ->join('Rooms', 'Rooms.houseId', '=', 'House.id')
        ->join('Sensor', 'Sensor.roomid', '=', 'Rooms.ID')
        ->join('sensor_data', 'sensor_data.sensorId', '=', 'Sensor.id')
        ->get(['users.id', 'users.name', 'house.name', 'Sensor.id', 'Sensor_data.value', 'Sensor_data.measured_at']);

        return view('layouts.yourDashboard', compact('data'));
    }

    // public function Cose(){
    //     $user_id = Auth::User()->id;
    //     $data = DB::select(`us.id as Us_ID,
    //     us.name as US_name,
    //     h.Name as HomeName,
    //     r.Type,S.Id as Sensor_ID,SD.Value_Sensor,
    //     Sd.Mesured FROM
    //      user as us 
    //     JOIN user_house as us_ho on (us.id=us_ho.id)
    //     join House as H on (us_ho.ID_House = h.Id)
    //     join Rooms as R on(r.Id_House = h.id)    \
    //     Join Sensor as S on(s.Id_Room = R.Id) 
    //     join sensor_data as SD on(SD.Id_Sensor = S.Id)
    //     where us.Id = $user_id;`);
    //     return view('index.dashboard',['data'=>$data]);
    // }


}
