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
            $attendanceRecord = $request->attendance_id
                ? LessonAttendance::findOrFail($request->attendance_id)
                : $this->createLessonAttendance([
                    'lesson_id' => $request->lesson_id,
                    'attendance' => 'pending',
                    'date' => $request->date,
                    'time' => $request->time,
                    'tutor_id' => $request->tutor_id
                ]);
    
            if ($attendanceRecord !== null) {
                LessonNotes::create([
                    'lesson_id' => $request->lesson_id,
                    'user_id' => $request->user_id,
                    'attendance_id' => $attendanceRecord->id,
                    'planning_comment' => $request->planning_comment,
                    'progress_comment' => $request->progress_comment,
                    'next_steps_comment' => $request->next_steps_comment,
                    'general_comment' => $request->general_comment,
                ]);
    
                return $this->success(
                    new LessonsResource(Lesson::findOrFail($request->lesson_id)),
                    'Lesson notes added successfully'
                );
            } else {
                return $this->error(
                    '',
                    'Error creating attendance record',
                    500
                );
            }
        } catch (ModelNotFoundException $e) {
            return $this->error(
                '',
                'An attendance id was provided but a record was not found.',
                404
            );
        } catch (Exception $e) {
            return $this->generalError();
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
            return $this->error('', 'You are not authorized to make this request', 403);
        }
    }
}
