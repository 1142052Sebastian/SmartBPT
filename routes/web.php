<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('index/index');
});
// Route::get('/dashboard', function () {
//     return view('index/Dashboard');
// });

Route::get('/test', function () {
    return view('master_user');
});

Auth::routes();

Route::get('/test','HomceController@index')->name('test');

Route::group(['middleware' => ['auth','admin']],function(){
    Route::get('/home',function(){
        return view('admin.dashboard');
    });
});

Route::get('/index/Dashboard', [App\Http\Controllers\HomeController::class, 'index'])->middleware('auth');


Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::get('/dashboard','Admin\CustomUsersController@index')


