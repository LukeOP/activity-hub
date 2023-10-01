<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LessonsResource extends JsonResource
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
            'attributes' => [
                'instrument' => $this->instrument,
                'start' => $this->start,
                'end' => $this->end,
                'day' => $this->day,
                'status' => $this->status,
                'funding_type' => $this->funding_type,
                'fee' => $this->fee,
                'startDate' => $this->start_date,
                'endDate' => $this->end_date,
                'created_at' => $this->created_at,
                'updated_at' => $this->updated_at,
                'deleted_at' => $this->deleted_at,
            ],
            'attendance' => $this->attendance,
            'notes' => LessonNotesResource::collection($this->notes),
            'school' => [
                'id' => $this->student->school->id,
                'name' => $this->student->school->name,
                'room' => 'K114'
            ],
            'student' => new StudentsResource($this->student),
            'tutor' => [
                'id' => $this->user->id,
                'first_name' => $this->user->first_name,
                'last_name' => $this->user->last_name,
                'full_name' => $this->user->first_name . " " . $this->user->last_name,
            ]
        ];
    }
}
