<?php

namespace App\Http\Controllers;

use App\Http\Resources\StudentsResource;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StudentsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();
        $schoolIds = $user->schools->pluck('id')->toArray();

        return StudentsResource::collection(
            Student::whereIn('school_id', $schoolIds)->orderBy('last_name')->get()
        );
    }


    /**
     * Display a list of students from a particular school
     */
    public function getStudentsInSchool($schoolId)
    {
        $students = Student::whereHas('school', function ($query) use ($schoolId) {
            $query->where('schools.id', $schoolId)->orderBy('last_name');
        })->get();

        return StudentsResource::collection($students);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $student = Student::create([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'tutor_group' => $request->tutor_group,
            'year_level' => $request->year_level,
            'gender' => $request->gender,
            'identifier' => $request->identifier,
            'school_id' => $request->school_id,
        ]);

        return new StudentsResource($student);
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
