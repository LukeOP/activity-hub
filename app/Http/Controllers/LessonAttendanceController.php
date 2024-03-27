<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonAttendanceResource;
use App\Http\Resources\LessonsResource;
use App\Models\Lesson;
use App\Models\LessonAttendance;
use App\Models\User;
use App\Traits\HttpResponses;
use App\Traits\LessonTraits;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonAttendanceController extends Controller
{
    use HttpResponses;
    use LessonTraits;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Get User's List of associated-schools and create an array of school ids
        $user = User::where('id', Auth::user()->id)->first();
        $userSchools = $user->schools;
        $userAdmin = $user->isAdmin->pluck('school_id')->toArray();
        $lessonCollection = new Collection();

        // For each user-associated school check if they have permission to view all lessons 
        // If they do or they are an administrator - get all student lessons for that school
        // Else just get the lessons assigned to the tutor
        foreach ($userSchools as $school) {
            $hasPermission = $user->hasPermissionForSchool($school->id, 'ATTENDANCE_V');

            if ($hasPermission || in_array($school->id, $userAdmin)) {
                $attendanceAtSchool = LessonAttendanceResource::collection(LessonAttendance::whereHas('lesson', function ($query1) use ($school) {
                    $query1->whereHas('student', function ($query2) use ($school) {
                        $query2->where('school_id', $school->id);
                    });
                })->get());
            } else {
                $attendanceAtSchool = LessonAttendanceResource::collection(LessonAttendance::whereHas('lesson', function ($query) use ($user) {
                    $query->where('user_id', $user->id);
                })->get());
            }
            $lessonCollection = $lessonCollection->concat($attendanceAtSchool);
        }

        // return compiled list of lessons the user has access to
        return $lessonCollection;

        // Lesson::where('user_id', $user->id)->get()


        // $attendance = LessonAttendanceResource::collection(LessonAttendance::all());
        // return $attendance;
    }

    /**
     * Find Lesson Attendance Record by lesson Id and date
     */
    public function getAttendanceRecordByIdAndDate($id, $date)
    {
        return LessonAttendance::where('lesson_id', $id)->where('date', $date)->first();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $attendance = $this->createLessonAttendance($request->all());

        if ($attendance){
            return $this->success(
                new LessonsResource(Lesson::where('id', $request->lesson_id)->first()),
                'Lesson attendance added successfully'
            );
        } else {
            return $this->error(
                '',
                'Error creating attendance record',
                500
            );
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(LessonAttendance $lessonAttendance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(string $id, Request $request)
    {
        try{
            $attendance = LessonAttendance::findOrFail($id);
    
            $attendance->fill($request->all());
            $attendance->save();

            return $this->success(
                new LessonsResource(Lesson::where('id', $attendance->lesson_id)->first()),
                'Lesson attendance successfully updated'
            );

        } catch (ModelNotFoundException $e) {
            return $this->error(
                $e,
                'Existing lesson attendance was not found',
                404
            );
        } catch (Exception $e) {
            return $this->error(
                $e,
                'An unknown error has occured',
                404
            );
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(LessonAttendance $lessonAttendance)
    {
        //
    }
}
