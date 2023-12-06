<?php

namespace App\Http\Controllers;

use App\Http\Resources\StudentsResource;
use App\Models\Student;
use App\Models\StudentContacts;
use Illuminate\Http\Request;

class StudentContactsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
    public function show(StudentContacts $studentContacts)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $student_id)
    {
        // Find existing contact records
        $contacts = StudentContacts::where('student_id', $student_id)->first();

        // If exists, update values
        if ($contacts != null) {
            $contacts->fill($request->all());
            $contacts->save();
        }
        // If no record exists, create new record 
        else {
            StudentContacts::create([
                'student_id' => $student_id,
                'student_mobile' => $request->student_mobile,
                'student_email' => $request->student_email,
                'pc_name' => $request->pc_name,
                'pc_relationship' => $request->pc_relationship,
                'pc_mobile' => $request->pc_mobile,
                'pc_email' => $request->pc_email,
                'sc_name' => $request->sc_name,
                'sc_relationship' => $request->sc_relationship,
                'sc_mobile' => $request->sc_mobile,
                'sc_email' => $request->sc_email,
            ]);
        };
        // return $request->all();
        $student = new StudentsResource(Student::where('id', $student_id)->first());
        return ['message' => 'contacts updated', 'student' => $student];
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(StudentContacts $studentContacts)
    {
        //
    }
}
