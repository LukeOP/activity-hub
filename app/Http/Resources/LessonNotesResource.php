<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LessonNotesResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // return parent::toArray($request);
        return [
            'id' => $this->id,
            'lesson_id' => $this->lesson_id,
            'attendance_id' => $this->attendance_id,
            'created_by' => [
                'id' => $this->user->id,
                'first_name' => $this->user->first_name,
                'last_name' => $this->user->last_name,
                'full_name' => $this->user->first_name . ' ' .$this->user->last_name,
            ],
            'comments' => [
                'planning' => $this->planning_comment,
                'progress' => $this->progress_comment,
                'next_steps' => $this->next_steps_comment,
                'general' => $this->general_comment,
            ],
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
