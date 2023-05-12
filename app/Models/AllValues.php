<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;


class AllValues extends Model
{
    use HasFactory;

    use Illuminate\Support\Facades\DB;
    
    protected $table = 'user_houses';

    public function getAllData($id) {
        $data = User::customQuery($id);
        return view('index/Dashboard', compact('data'));
    }

    public static function customQuery($id) {
        return DB::select('');
    }

}
