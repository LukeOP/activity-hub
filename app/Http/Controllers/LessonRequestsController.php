<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonRequestResource;
use App\Models\LessonRequest;
use Illuminate\Http\Request;

class LessonRequestsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return LessonRequestResource::collection(
            LessonRequest::get()
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $lessonRequest = LessonRequest::create([
            'student_name' => $request->student_name,
            'student_year' => $request->student_year,
            'parent_name' => $request->parent_name,
            'parent_phone' => $request->parent_phone,
            'parent_email' => $request->parent_email,
            'requested_instrument' => $request->requested_instrument,
            'experience' => $request->experience,
            'requested_tutor' => $request->requested_tutor,
            'funding_type' => $request->funding_type,
            'option_music' => $request->option_music,
            'school_id' => $request->school_id
        ]);

        return new LessonRequestResource($lessonRequest);
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
    public function destroy(string $id)
    {
        //
    }
}
