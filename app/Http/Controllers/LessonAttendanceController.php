<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonAttendanceResource;
use App\Models\LessonAttendance;
use Illuminate\Http\Request;

class LessonAttendanceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $attendance = LessonAttendanceResource::collection(LessonAttendance::all());
        return $attendance;
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

        return new LessonAttendanceResource($lessonRecord);
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
    public function update($id, Request $request)
    {
        $attendance = LessonAttendance::findOrFail($id);

        $attendance->fill($request->all());
        $attendance->save();

        return response()->json(
            [
                'message' => 'lesson updated successfully',
                'lesson' => new LessonAttendanceResource(
                    LessonAttendance::where('id', $attendance['id'])->first()
                )
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
