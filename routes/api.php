<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CalendarEventController;
use App\Http\Controllers\ContactsController;
use App\Http\Controllers\LessonNotesController;
use App\Http\Controllers\LessonsController;
use App\Http\Controllers\SchoolsController;
use App\Http\Controllers\StudentsController;
use App\Http\Controllers\TasksController;
use App\Http\Controllers\UsersController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// Public Routes
Route::post('/login', [AuthController::class, 'login']);
Route::post('/login-admin', [AuthController::class, 'loginAdmin']);
Route::post('/register', [AuthController::class, 'register']);



// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::resource('/users', UsersController::class);
    Route::resource('/tasks', TasksController::class);
    Route::resource('/students', StudentsController::class);
    Route::resource('/student-contacts', ContactsController::class);
    Route::resource('/schools', SchoolsController::class);
    Route::resource('/lessons', LessonsController::class);
    Route::resource('/lesson-notes', LessonNotesController::class);
    Route::resource('/calendar-events', CalendarEventController::class);
});
