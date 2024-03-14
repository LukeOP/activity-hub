<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LessonRequest extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'student_name',
        'student_email',
        'students_phone',
        'student_age',
        'student_year',
        'parent_name',
        'parent_phone',
        'parent_email',
        'requested_instrument',
        'experience',
        'requested_tutor',
        'funding_type',
        'option_music',
        'school_id',
        'form_description'
    ];

    public function school()
    {
        return $this->belongsTo(School::class);
    }
}
