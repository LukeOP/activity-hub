<?php

namespace App\Http\Controllers;

use App\Http\Resources\StudentsResource;
use App\Models\Student;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use League\Csv\Reader;

class StudentsController extends Controller
{
    use HttpResponses;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();
        $schoolIds = $user->schools->pluck('id')->toArray();

        return StudentsResource::collection(
            Student::whereIn('school_id', $schoolIds)->where('enrolled_status', true)->orderBy('last_name')->get()
        );
    }


    /**
     * Display a list of students from a particular school
     */
    public function getStudentsInSchool($schoolId)
    {
        $students = Student::where('school_id', $schoolId)->where('enrolled_status', true)->orderBy('last_name')->get();
        // $students = Student::whereHas('school', function ($query) use ($schoolId) {
        //     $query->where('schools_id', $schoolId)->where('enrolled_status', true)->orderBy('last_name');
        // })->get();

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
            'date_of_birth' => $request->date_of_birth,
            'gender' => $request->gender,
            'identifier' => $request->identifier,
            'school_id' => $request->school_id,
        ]);

        return new StudentsResource($student);
    }

    /**
     * Store multiple student records from CSV File
     */
    public function storeFromCSV(Request $request, string $school_id)
    {
        $request->validate([
            'csv_file' => 'required|mimes:csv,text|max:2048'
        ]);

        $file = $request->file('csv_file');
        $csvFilePath = $file->getRealPath();

        $csv = Reader::createFromPath($csvFilePath, 'r');
        $csv->setHeaderOffset(0);

        if ($request->has('unenroll') && $request->unenroll === "true") {
            Student::where('school_id', $school_id)->update(['enrolled_status' => false]);
        }

        foreach ($csv->getRecords() as $record) {

            $validator = validator($record, [
                'First Name' => 'required|string|max:255',
                'Last Name' => 'required|string|max:255',
                'Tutor' => 'sometimes|string|max:255',
                'Level' => 'sometimes|integer',
                'Date Of Birth' => 'sometimes|date',
                'Gender' => 'sometimes|in:M,F',
                'Student ID' => [
                    'required',
                    'string',
                    'max:50',
                ],
            ]);

            if ($validator->fails()) {
                // Handle validation failure, e.g., log errors or return a response
                return response()->json(['error' => $validator->errors()], 422);
            }
            $existingStudent = Student::where('identifier', $record['Student ID'])->first();

            if ($existingStudent) {
                // If the student already exists, update the record
                $existingStudent->update([
                    'first_name' => $record['First Name'],
                    'last_name' => $record['Last Name'],
                    'tutor_group' => $record['Tutor'] ?? null,
                    'year_level' => $record['Level'] ?? null,
                    'date_of_birth' => $record['Date Of Birth'] ?? null,
                    'gender' => $record['Gender'] ?? null,
                    'enrolled_status' => true,
                    'school_id' => $school_id,
                ]);
            } else {
                // If the student does not exist, create a new record
                Student::create([
                    'first_name' => $record['First Name'],
                    'last_name' => $record['Last Name'],
                    'tutor_group' => $record['Tutor'] ?? null,
                    'year_level' => $record['Year'] ?? null,
                    'date_of_birth' => $record['Date Of Birth'] ?? null,
                    'gender' => $record['Gender'] ?? null,
                    'identifier' => $record['Student ID'],
                    'enrolled_status' => true,
                    'school_id' => $school_id,
                ]);
            }
        }

        return response()->json([
            'message' => 'CSV data sucessfully imported to the database',
            'students' => $this->index()
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $student = Student::where('id', $id)->first();
        return new StudentsResource($student);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $student = Student::findOrFail($id);

        $student->fill($request->all());
        $student->save();

        return ['success', 'Student updated', 'student' => $student];
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
