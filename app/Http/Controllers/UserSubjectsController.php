<?php

namespace App\Http\Controllers;

use App\Http\Resources\AvailableSubjectsResource;
use App\Http\Resources\SubjectResource;
use App\Models\UserSubject;
use Illuminate\Http\Request;

class UserSubjectsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return UserSubject::all();
    }

    public function getAvailableTutorsAndSubjects(string $school_id)
    {
        return AvailableSubjectsResource::collection(UserSubject::where('school_id', $school_id)->where('signup_enabled', 1)->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $subject = UserSubject::create([
            'user_id' => $request->user_id,
            'school_id' => $request->school_id,
            'subject' => $request->subject
        ]);
        return new SubjectResource($subject);
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
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return UserSubject::where('id', $id)->first()->delete();
    }
}
