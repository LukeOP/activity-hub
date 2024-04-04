<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Lesson;
use App\Models\StudentContacts;
use App\Models\Student;
use App\Models\User;

class DataProcessingController extends Controller
{
    public function convertLessonData(Request $request)
    {
        $lessons = $request->all();
        $responseData = [];
        $errors = [];

        foreach ($lessons as $lesson) {
            if ($this->onlyOneStudent(['first_name' => $lesson['first_name'], 'last_name' => $lesson['last_name']])) {
                $existingStudentId = $this->getStudent(['first_name' => $lesson['first_name'], 'last_name' => $lesson['last_name']]);
                if ($existingStudentId !== null) {
                    $existingLesson = Lesson::where('user_id', $this->getTutor($lesson['email']))
                        ->where('student_id', $existingStudentId)
                        ->get();
                    if (count($existingLesson) < 1) {
                        Lesson::create([
                            'user_id' => $this->getTutor($lesson['email']),
                            'student_id' => $existingStudentId,
                            'instrument' => $lesson['instrument'],
                            'start' => $lesson['lesson_time'] != 'Not Set' ? $lesson['lesson_time'] : null,
                            'end' => $lesson['lesson_time'] != 'Not Set' ? date('H:i', strtotime($lesson['lesson_time'] . ' +20 minutes')) : null,
                            'day' => $lesson['lesson_day'] != 'Not Set' ? $lesson['lesson_day'] : null,
                            'start_date' => '2024-02-24',
                            'funding_type' => $lesson['funding'],
                            'status' => $lesson['status'],
                            'experience' => $lesson['experience']
                        ]);

                        StudentContacts::create([
                            'student_id' => $existingStudentId,
                            'pc_name' => $lesson['parent_name'],
                            'pc_mobile' => $lesson['parent_phone'],
                            'pc_email' => $lesson['parent_email']
                        ]);
                    }
                } else {
                    array_push($errors, ['Student not found' => [$lesson['first_name'], $lesson['last_name']]]);
                }
            } else {
                array_push($errors, ['Duplicate Student' => [$lesson['first_name'], $lesson['last_name']]]);
            }
        }

        return $responseData;
    }

    public function onlyOneStudent($studentData)
    {
        $existingStudents = Student::where('first_name', $studentData['first_name'])
                                   ->where('last_name', $studentData['last_name'])
                                   ->get();

        return count($existingStudents) <= 1;
    }

    public function getTutor($tutorEmail)
    {
        $tutor = User::where('email', $tutorEmail)->first();
        return $tutor->id;
    }

    public function getStudent($studentData)
    {
        $existingStudent = Student::where('first_name', $studentData['first_name'])
                                  ->where('last_name', $studentData['last_name'])
                                  ->first();

        if ($existingStudent) {
            return $existingStudent->id;
        } else {
            return null; // or you can return any default value that suits your logic
        }
    }
}
