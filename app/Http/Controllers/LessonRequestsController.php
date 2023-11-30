<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonRequestFormResource;
use App\Http\Resources\LessonRequestResource;
use App\Models\LessonRequest;
use App\Models\LessonRequestForm;
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
     * Display a listing of Request Forms
     */
    public function indexOfRequestFormsForSchool(string $school_id)
    {
        return LessonRequestFormResource::collection(LessonRequestForm::where('school_id', $school_id)->get());
    }

    /**
     * Display a specific form resource from id
     */
    public function getFormById(string $form_id)
    {
        return new LessonRequestFormResource(LessonRequestForm::where('id', $form_id)->first());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function createFromPublicForm(Request $request)
    {
        $lessonRequest = LessonRequest::create([
            'student_name' => $request->student_name,
            'student_email' => $request->student_email,
            'student_phone' => $request->student_phone,
            'student_age' => $request->student_age,
            'student_year' => $request->student_year,
            'parent_name' => $request->parent_name,
            'parent_phone' => $request->parent_phone,
            'parent_email' => $request->parent_email,
            'requested_instrument' => $request->instrument,
            'experience' => $request->experience,
            'requested_tutor' => $request->tutor,
            'funding_type' => $request->funding_type,
            'school_id' => $request->school_id
        ]);

        return new LessonRequestResource($lessonRequest);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $lessonRequest = LessonRequest::create([
            'student_name' => $request->student_name,
            'student_email' => $request->student_email,
            'student_phone' => $request->student_phone,
            'student_age' => $request->student_age,
            'student_year' => $request->student_year,
            'parent_name' => $request->parent_name,
            'parent_phone' => $request->parent_phone,
            'parent_email' => $request->parent_email,
            'requested_instrument' => $request->requested_instrument,
            'experience' => $request->experience,
            'requested_tutor' => $request->requested_tutor,
            'funding_type' => $request->funding_type,
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
        LessonRequest::where('id', $id)->first()->delete();
        return ['success', 'Lesson Request Deleted', 'The Lesson Request has been Deleted'];
    }
}
