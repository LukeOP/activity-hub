<?php

use App\Http\Controllers\DocumentController;
use Illuminate\Support\Facades\Auth;
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
    return view('app');
});

Route::get('download', [DocumentController::class, 'download']);

Auth::routes(['verify' => true]);

Route::get('/{any}', function () {
    return view('app');
})->where('any', '.*');

// Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
