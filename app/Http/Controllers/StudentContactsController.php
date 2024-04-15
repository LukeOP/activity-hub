<?php

namespace App\Http\Controllers;

use App\Http\Resources\StudentsResource;
use App\Models\Student;
use App\Models\StudentContacts;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class StudentContactsController extends Controller
{
    use HttpResponses;
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
        try {
            // Find existing contact records
            $contacts = StudentContacts::where('student_id', $student_id)->first();
    
            // If exists, update values
            if ($contacts != null) {
                $contacts->fill($request->all());
                $contacts->save();
            }
            // If no record exists, create new record 
            else {
                $studentContactData = [
                    'student_id' => $student_id,
                    'student_mobile' => $request->input('student_mobile'),
                    'student_email' => $request->input('student_email'),
                    'pc_name' => $request->input('pc_name'),
                    'pc_relationship' => $request->input('pc_relationship'),
                    'pc_mobile' => $request->input('pc_mobile'),
                    'pc_email' => $request->input('pc_email'),
                    'sc_name' => $request->input('sc_name'),
                    'sc_relationship' => $request->input('sc_relationship'),
                    'sc_mobile' => $request->input('sc_mobile'),
                    'sc_email' => $request->input('sc_email'),
                ];
                
                // Filter out null values from the data array
                $studentContactData = array_filter($studentContactData, function($value) {
                    return !is_null($value);
                });
                
                // Create StudentContacts instance with the filtered data
                StudentContacts::create($studentContactData);
            };
            return $this->success(
                new StudentsResource(Student::where('id', $student_id)->first()),
                'Contact Details Updated'
            );
        } catch (Exception){
            return $this->generalError();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(StudentContacts $studentContacts)
    {
        //
    }
}
