<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\AvatarController;
use App\Http\Controllers\CalendarEventController;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\EventJobController;
use App\Http\Controllers\EventSchoolJobController;
use App\Http\Controllers\EventsController;
use App\Http\Controllers\HiresController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\InstrumentsController;
use App\Http\Controllers\LessonAttendanceController;
use App\Http\Controllers\LessonNotesController;
use App\Http\Controllers\LessonRequestsController;
use App\Http\Controllers\LessonRequestsFormsController;
use App\Http\Controllers\LessonsController;
use App\Http\Controllers\SchoolsController;
use App\Http\Controllers\StudentContactsController;
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

Route::get('lesson-request-form/{form_id}', [LessonRequestsController::class, 'getFormById']);
Route::post('lesson-request-form/create-public-request', [LessonRequestsController::class, 'createFromPublicForm']);
Route::get('user-subjects-available/{school_id}', [UserSubjectsController::class, 'getAvailableTutorsAndSubjects']);
Route::post('user-forgot-password', [UsersController::class, 'forgotPassword']);
Route::post('user-reset-password', [UsersController::class, 'resetPassword']);
Route::post('user-email-verify', [AuthController::class, 'sendEmailVerificationEmail']);
Route::post('user-email-verify-check', [AuthController::class, 'checkEmailVerificationToken']);

// Emails
Route::post('email-lesson-request-received/{form_title}', [EmailController::class, 'newLessonRequestReceived']);





// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {

    // AUTH
    Route::post('/logout', [AuthController::class, 'logout']);

    // CALENDAR
    Route::resource('/calendar-events', CalendarEventController::class);

    // IMAGES
    Route::get('/image/{path}/{filename}', [ImageController::class, 'getImage']);
    Route::post('/image', [ImageController::class, 'storeImage']);

    // EVENTS
    Route::resource('events', EventsController::class);

    // jobs
    Route::resource('event-jobs', EventJobController::class);
    Route::get('event-jobs-list/{event_id}', [EventJobController::class, 'getJobsForEvent']);
    // School Jobs
    Route::resource('event-school-jobs', EventSchoolJobController::class);
    Route::get('event-school-jobs/all/{school_id}', [EventSchoolJobController::class, 'getSchoolJobs']);
    Route::post('event-school-jobs/add-to-event/{event_id}/{identifier}', [EventSchoolJobController::class, 'createEventJobFromSchoolEventIdentifier']);
    // Event Templates
    Route::post('event-school-jobs/templates', [EventSchoolJobController::class, 'createEventTemplate']);
    Route::get('event-school-jobs/templates/{school_id}', [EventSchoolJobController::class, 'getSchoolEventJobTemplates']);
    Route::get('event-school-jobs/template/{template_id}', [EventSchoolJobController::class, 'getTemplateJobs']);
    Route::patch('event-school-jobs/template/edit/{template_id}', [EventSchoolJobController::class, 'updateSchoolEventJobTemplate']);

    // INSTRUMENTS
    Route::resource('instruments', InstrumentsController::class);
    Route::get('instrument-states', [InstrumentsController::class, 'getInstrumentStates']);

    // HIRES
    Route::resource('hires', HiresController::class);

    // Student Hires
    Route::get('/student-hires/{student_id}', [HiresController::class, 'getStudentHires']);
    Route::get('/student-hires/past/{student_id}', [HiresController::class, 'getStudentPastHires']);
    // Instrument Hires
    Route::get('/instrument-hires/{instrument_id}', [HiresController::class, 'getInstrumentHires']);

    //LESSONS
    Route::resource('/lessons', LessonsController::class);
    Route::resource('/lesson-notes', LessonNotesController::class);
    Route::resource('/lesson-requests', LessonRequestsController::class);
    Route::get('school-lesson-request-forms/{school_id}', [LessonRequestsFormsController::class, 'indexOfRequestFormsForSchool']);
    Route::resource('lesson-request-forms', LessonRequestsFormsController::class);

    // Student Lessons
    Route::get('/student-lessons/{student_id}', [LessonsController::class, 'getStudentLessons']);
    Route::get('/student-lessons/past/{student_id}', [LessonsController::class, 'getStudentPastLessons']);

    // LESSON ATTENDANCE
    Route::resource('/lesson-attendance', LessonAttendanceController::class);
    Route::get('lesson-attendance/{id}/{date}', [LessonAttendanceController::class, 'getAttendanceRecordByIdAndDate']);

    // SCHOOLS
    Route::resource('/schools', SchoolsController::class);

    // SCHOOL INVITATIONS
    Route::get('/school-invitations/{school}', [UserSchoolInvitationsController::class, 'getInvitesForSchool']);
    Route::get('/school-invitation/{code}', [UserSchoolInvitationsController::class, 'getInviteByCode']);
    Route::resource('school-invitations', UserSchoolInvitationsController::class);

    // STUDENTS
    Route::resource('/students', StudentsController::class);
    Route::get('school-students/{schoolId}', [StudentsController::class, 'getStudentsInSchool']);
    Route::post('update-students-bulk/{school_id}', [StudentsController::class, 'storeFromCSV']);

    // Student Contacts
    Route::resource('/student-contacts', StudentContactsController::class);

    // USERS
    Route::resource('/users', UsersController::class);
    Route::get('school-users/{schoolId}', [UsersController::class, 'getUsersInSchool']);
    Route::get('user/search/{search}', [UsersController::class, 'searchForUser']);
    Route::resource('/user-subjects', UserSubjectsController::class);
    Route::resource('/user-permissions', UserPermissionsController::class);
    Route::resource('/user-position', UserPositionController::class);
    Route::get('/user-position/{user}/{school}', [UserPositionController::class, 'getUserPositionAtSchool']);
    Route::resource('user-school', UserSchoolsController::class);
    Route::resource('/avatar', AvatarController::class);

    // TASKS
    Route::resource('/tasks', TasksController::class);

    // EMAILS
    Route::post('email-test', [EmailController::class, 'test']);
});
