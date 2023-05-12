<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomUser extends Model
{
    use HasFactory;

    protected $tbl  ='CustomUser';
    protected $fillable = ['User_id','User_name','House_name','Room_type','Sensor_Id','Data_value','Data_pickTime'];

    
    SELECT us.id as User_id,
us.name User_name,
h.Name as House_name,
r.Type as Room_type,
S.Id as Sensor_Id,
SD.Value_Sensor as Data_value,
Sd.Mesured as Data_pickTime
FROM `CustomUser` as us JOIN user_house as us_ho on (us.id=us_ho.id)join House as H on (us_ho.ID_House = h.Id) join Rooms as R on(r.Id_House = h.id) join Sensor as S on(s.Id_Room = R.Id) join sensor_data as SD on(SD.Id_Sensor = S.Id) where us.Id = 3;
}
