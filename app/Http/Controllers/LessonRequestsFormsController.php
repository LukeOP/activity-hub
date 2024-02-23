<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonRequestFormResource;
use App\Models\LessonRequestForm;
use Illuminate\Http\Request;

class LessonRequestsFormsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Display a listing of Request Forms
     */
    public function indexOfRequestFormsForSchool(string $school_id)
    {
        return LessonRequestFormResource::collection(LessonRequestForm::where('school_id', $school_id)->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $form = LessonRequestForm::create([
            'school_id' => $request->school_id,
            'description' => $request->description,
        ]);

        $newForm = LessonRequestForm::where('id', $form->id)->first();

        return new LessonRequestFormResource($newForm);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $requestForm = LessonRequestForm::findOrFail($id);

        // $requestForm->update([
        //     'description' => $request->description
        // ]);

        // return $requestForm;

        $requestForm->update([
            'description' => $request->description,
            'year' => $request->year,
            'logo_cb' => $request->logo_cb,
            'logo' => $request->logo,
            'school_name_cb' => $request->school_name_cb,
            'heading_cb' => $request->heading_cb,
            'heading' => $request->heading,
            'header_content_cb' => $request->header_content_cb,
            'header_content' => $request->header_content,
            'contact_content_cb' => $request->contact_content_cb,
            'contact_content' => $request->contact_content,
            'student_name_cb' => $request->student_name_cb,
            'student_name' => $request->student_name,
            'student_email_cb' => $request->student_email_cb,
            'student_email' => $request->student_email,
            'student_phone_cb' => $request->student_phone_cb,
            'student_phone' => $request->student_phone,
            'student_age_cb' => $request->student_age_cb,
            'student_year_cb' => $request->student_year_cb,
            'student_year' => $request->student_year,
            'student_age' => $request->student_age,
            'pc_name_cb' => $request->pc_name_cb,
            'pc_name' => $request->pc_name,
            'pc_phone_cb' => $request->pc_phone_cb,
            'pc_phone' => $request->pc_phone,
            'pc_email_cb' => $request->pc_email_cb,
            'pc_email' => $request->pc_email,
            'lesson_content_cb' => $request->lesson_content_cb,
            'lesson_content' => $request->lesson_content,
            'instrument_cb' => $request->instrument_cb,
            'instrument' => $request->instrument,
            'tutor_cb' => $request->tutor_cb,
            'tutor' => $request->tutor,
            'funding_type_cb' => $request->funding_type_cb,
            'funding_type' => $request->funding_type,
            'experience_cb' => $request->experience_cb,
            'experience' => $request->experience,
            'footer_content_cb' => $request->footer_content_cb,
            'footer_content' => $request->footer_content,
        ]);

        return response()->json(['message' => 'lesson updated successfully', 'form' => $requestForm]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return LessonRequestForm::where('id', $id)->first()->delete();
    }
}
