<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LessonAttendanceResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'lesson' => [
                'date' => $this->date,
                'time' => $this->time,
                'instrument' => $this->lesson->instrument,
                'attendance' => $this->attendance,
            ],
            'student' => [
                'id' => $this->lesson->student->id,
                'first_name' => $this->lesson->student->first_name,
                'last_name' => $this->lesson->student->last_name,
            ],
            'tutor' => [
                'id' => $this->lesson->user->id,
                'first_name' => $this->lesson->user->first_name,
                'last_name' => $this->lesson->user->last_name,
            ],
            'school' => [
                'id' => $this->lesson->student->school->id,
                'name' => $this->lesson->student->school->name,
            ],
        ];
    }
}
