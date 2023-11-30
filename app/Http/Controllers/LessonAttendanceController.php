<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonAttendanceResource;
use App\Http\Resources\LessonsResource;
use App\Models\Lesson;
use App\Models\LessonAttendance;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonAttendanceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Get User's List of associated-schools and create an array of school ids
        $user = Auth::user();
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
        $lessonRecord = LessonAttendance::create([
            'lesson_id' => $request->lesson_id,
            'attendance' => $request->attendance,
            'date' => $request->date,
            'time' => $request->time,
            'user_id' => $request->tutor_id
        ]);

        return response()->json(
            [
                'message' => 'lesson Attendance Added successfully',
                'lesson' => new LessonsResource(Lesson::where('id', $request->lesson_id)->first())
            ]
        );
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
    public function update(int $id, Request $request)
    {
        $attendance = LessonAttendance::findOrFail($id);

        $attendance->fill($request->all());
        $attendance->save();

        return response()->json(
            [
                'message' => 'lesson updated successfully',
                'lesson' => $attendance
            ]
        );
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(LessonAttendance $lessonAttendance)
    {
        //
    }
}
