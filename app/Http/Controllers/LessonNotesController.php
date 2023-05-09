<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreLessonNoteRequest;
use App\Http\Resources\LessonNotesResource;
use App\Models\LessonNotes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonNotesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return LessonNotesResource::collection(
            LessonNotes::get()
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreLessonNoteRequest $request)
    {
        $request->validated($request->all());

        $note = LessonNotes::create([
            'lesson_id' => $request->lesson_id,
            'comment' => $request->comment,
        ]);

        return new LessonNotesResource($note);
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
        //
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
