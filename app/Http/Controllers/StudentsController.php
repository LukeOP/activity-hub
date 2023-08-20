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
            $query->where('schools.id', $schoolId);
        })->get();

        // Return the students or pass them to a resource for transformation.

        return $students;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
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
        //
    }
}
