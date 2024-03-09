<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LessonRequestFormResource extends JsonResource
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
                'year' => $this->year,
                'description' => $this->description
            ],
            'content' => [
                'heading' => $this->heading,
                'header_content' => $this->header_content,
                'contact_content' => $this->contact_content,
                'lesson_content' => $this->lesson_content,
                'footer_content' => $this->footer_content,
            ],
            'field_labels' => [
                'student_name' => $this->student_name,
                'student_email' => $this->student_email,
                'student_phone' => $this->student_phone,
                'student_year' => $this->student_year,
                'student_age' => $this->student_age,
                'pc_name' => $this->pc_name,
                'pc_phone' => $this->pc_phone,
                'pc_email' => $this->pc_email,
                'instrument' => $this->instrument,
                'tutor' => $this->tutor,
                'funding_type' => $this->funding_type,
                'experience' => $this->experience,
            ],
            'inputs' => [
                'logo' => $this->logo_cb,
                'school_name' => $this->school_name_cb,
                'header_content' => $this->header_content_cb,
                'heading' => $this->heading_cb,
                'contact_content' => $this->contact_content_cb,
                'student_name' => $this->student_name_cb,
                'student_email' => $this->student_email_cb,
                'student_phone' => $this->student_phone_cb,
                'student_year' => $this->student_year_cb,
                'student_age' => $this->student_age_cb,
                'pc_name' => $this->pc_name_cb,
                'pc_phone' => $this->pc_phone_cb,
                'pc_email' => $this->pc_email_cb,
                'lesson_content' => $this->lesson_content_cb,
                'instrument' => $this->instrument_cb,
                'tutor' => $this->tutor_cb,
                'funding_type' => $this->funding_type_cb,
                'experience' => $this->experience_cb,
                'footer_content' => $this->footer_content_cb,
            ],
            'school' => new SchoolsResource($this->school),
            'available_instruments' => $this->instruments(),
            'timestamp' => [
                'created' => $this->created_at,
                'updated' => $this->updated_at,
                'deleted' => $this->deleted_at,
            ]
        ];
    }
}
