<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\AvatarController;
use App\Http\Controllers\CalendarEventController;
use App\Http\Controllers\ContactsController;
use App\Http\Controllers\EventJobController;
use App\Http\Controllers\EventSchoolJobController;
use App\Http\Controllers\EventsController;
use App\Http\Controllers\HiresController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\InstrumentsController;
use App\Http\Controllers\LessonAttendanceController;
use App\Http\Controllers\LessonNoteController;
use App\Http\Controllers\LessonNotesController;
use App\Http\Controllers\LessonRequestsController;
use App\Http\Controllers\LessonsController;
use App\Http\Controllers\SchoolsController;
use App\Http\Controllers\StudentsController;
use App\Http\Controllers\TasksController;
use App\Http\Controllers\UserPermissionsController;
use App\Http\Controllers\UserPositionController;
use App\Http\Controllers\UserSchoolInvitationsController;
use App\Http\Controllers\UserSchoolsController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\UserSubjectsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// Public Routes
Route::post('/login', [AuthController::class, 'login']);
Route::post('/login-admin', [AuthController::class, 'loginAdmin']);
Route::post('/register', [AuthController::class, 'register']);
Route::get('token-user/{localToken}', [UsersController::class, 'getUserOfToken']);



// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::resource('/avatar', AvatarController::class);

    Route::resource('/calendar-events', CalendarEventController::class);

    Route::get('/image/{path}/{filename}', [ImageController::class, 'getImage']);
    Route::post('/image', [ImageController::class, 'storeImage']);
    Route::resource('instruments', InstrumentsController::class);
    Route::get('instrument-states', [InstrumentsController::class, 'getInstrumentStates']);

    Route::resource('hires', HiresController::class);

    Route::resource('/lesson-attendance', LessonAttendanceController::class);
    Route::resource('/lesson-notes', LessonNotesController::class);
    Route::resource('/lesson-requests', LessonRequestsController::class);
    Route::resource('/lessons', LessonsController::class);
    Route::get('lesson-attendance/{id}/{date}', [LessonAttendanceController::class, 'getAttendanceRecordByIdAndDate']);

    Route::post('/logout', [AuthController::class, 'logout']);

    Route::resource('events', EventsController::class);
    Route::resource('event-jobs', EventJobController::class);
    Route::resource('event-school-jobs', EventSchoolJobController::class);
    Route::get('event-school-jobs/all/{school_id}', [EventSchoolJobController::class, 'getSchoolJobs']);
    Route::post('event-school-jobs/add-to-event/{event_id}/{school_id}/{identifier}', [EventSchoolJobController::class, 'createEventJobFromSchoolEventIdentifier']);


    Route::resource('/schools', SchoolsController::class);

    Route::resource('/students', StudentsController::class);
    Route::get('/student-lessons/{student_id}', [LessonsController::class, 'getStudentLessons']);
    Route::get('/student-lessons/past/{student_id}', [LessonsController::class, 'getStudentPastLessons']);

    Route::get('/student-hires/{student_id}', [HiresController::class, 'getStudentHires']);
    Route::get('/student-hires/past/{student_id}', [HiresController::class, 'getStudentPastHires']);

    Route::get('/instrument-hires/{instrument_id}', [HiresController::class, 'getInstrumentHires']);

    Route::get('school-students/{schoolId}', [StudentsController::class, 'getStudentsInSchool']);
    Route::resource('/student-contacts', ContactsController::class);

    Route::get('school-users/{schoolId}', [UsersController::class, 'getUsersInSchool']);

    Route::resource('/tasks', TasksController::class);

    Route::resource('/users', UsersController::class);
    Route::get('user/search/{search}', [UsersController::class, 'searchForUser']);
    Route::resource('/user-subjects', UserSubjectsController::class);
    Route::resource('/user-permissions', UserPermissionsController::class);
    Route::resource('/user-position', UserPositionController::class);
    Route::get('/user-position/{user}/{school}', [UserPositionController::class, 'getUserPositionAtSchool']);

    Route::get('/school-invitations/{school}', [UserSchoolInvitationsController::class, 'getInvitesForSchool']);
    Route::get('/school-invitation/{code}', [UserSchoolInvitationsController::class, 'getInviteByCode']);
    Route::resource('school-invitations', UserSchoolInvitationsController::class);

    Route::resource('user-school', UserSchoolsController::class);
});
