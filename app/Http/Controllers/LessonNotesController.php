<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreLessonNoteRequest;
use App\Http\Resources\LessonNotesResource;
use App\Http\Resources\LessonsResource;
use App\Models\Lesson;
use App\Models\LessonAttendance;
use App\Models\LessonNotes;
use App\Traits\HttpResponses;
use App\Traits\LessonTraits;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonNotesController extends Controller
{
    use HttpResponses;
    use LessonTraits;

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return LessonNotesResource::collection(
            LessonNotes::all()
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreLessonNoteRequest $request)
    {
        try {
            // Check for existing LessonAttendance record for this date and lesson_id
            $attendanceRecord = LessonAttendance::where('lesson_id', $request->lesson_id)->where('date', $request->date)->first();
            
            // If no record exists, create one with the attendance value 'pending'
            if(!$attendanceRecord){
                $attendanceRecord = $this->createLessonAttendance([
                    'lesson_id' => $request->lesson_id,
                    'attendance' => 'pending',
                    'date' => $request->date,
                    'time' => $request->time,
                    'tutor_id' => $request->tutor_id
                ]);
            }
    
            // If an attendance record now exists create or update notes for that lesson attendance.
            if ($attendanceRecord !== null) {
                LessonNotes::updateOrCreate(
                    ['attendance_id' => $attendanceRecord->id],
                    [
                    'lesson_id' => $request->lesson_id,
                    'user_id' => $request->user_id,
                    'planning_comment' => $request->planning_comment,
                    'progress_comment' => $request->progress_comment,
                    'next_steps_comment' => $request->next_steps_comment,
                    'general_comment' => $request->general_comment,
                    ]
                );
    
                return $this->success(
                    new LessonsResource(Lesson::findOrFail($request->lesson_id)),
                    'Lesson notes added successfully'
                );
            } else {
                return $this->error(
                    '',
                    null,
                    'Error creating attendance record',
                    500
                );
            }
        } catch (ModelNotFoundException $e) {
            return $this->error(
                '',
                null,
                'An attendance id was provided but a record was not found.',
                404
            );
        } catch (Exception $e) {
            return $this->generalError();
        }
    }

    public function storeGeneralNote(Request $request){
        try {
            LessonNotes::create([
            'lesson_id' => $request->lesson_id,
            'user_id' => $request->user_id,
            'general_comment' => $request->general_comment,
        ]);

        return $this->success(
            new LessonsResource(Lesson::findOrFail($request->lesson_id)),
            'Comment Created',
            'Lesson comment added successfully'
        );
    } catch (Exception $e) {
        return $this->error(
            $e,
            null,
            'Error creating general comment',
            500
        );
    }
    }
    

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        return 'Hello Patch';
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        LessonNotes::where('id', $id)->first()->delete();
        return 'note deleted';
        // return $this->isNotAuthorized($note) ? $this->isNotAuthorized($note) : $note->delete();
    }

    private function isNotAuthorized(LessonNotes $note)
    {
        if (false) {
            return $this->authenticationError();
        }
    }
}
