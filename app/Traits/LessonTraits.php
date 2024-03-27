<?php

namespace App\Traits;

use App\Http\Resources\LessonAttendanceResource;
use App\Http\Resources\LessonsResource;
use App\Models\Lesson;
use App\Models\LessonAttendance;
use Exception;
use Illuminate\Support\Facades\Log;

trait LessonTraits {

    /**
     * Create a new LessonAttendance record.
     *
     * @param object $data An associative array containing the following keys:
     *                    - 'lesson_id': The ID of the lesson.
     *                    - 'attendance': The attendance status (e.g., 'present', 'absent').
     *                    - 'date': The date of the lesson (in YYYY-MM-DD format).
     *                    - 'time': The time of the lesson (in HH:MM:SS format).
     *                    - 'tutor_id': The ID of the tutor associated with the lesson.
     * @return LessonAttendance|Exception The created LessonAttendance object, or null if an error occurred.
     */
    protected function createLessonAttendance($data)
    {
        try {
            $newAttendance = LessonAttendance::create([
                'lesson_id' => $data['lesson_id'],
                'attendance' => $data['attendance'],
                'date' => $data['date'],
                'time' => $data['time'],
                'user_id' => $data['tutor_id']
            ]);
            // return new LessonsResource(Lesson::where('id', $data['lesson_id'])->first());
            return $newAttendance;

        } catch (Exception $e) {
            Log::error('Error creating LessonAttendance: ' . $e->getMessage(), [
                'data' => $data,
                'exception' => $e
            ]);
            return null;
        }
    }
}