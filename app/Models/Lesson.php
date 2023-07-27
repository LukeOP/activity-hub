<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'student_id',
        'instrument',
        'status',
        'start',
        'end',
        'day',
        'start_date',
        'end_date',
        'funding_type',
        'fee'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function notes()
    {
        return $this->hasMany(LessonNotes::class)->orderBy('id', 'desc');
    }

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function attendance()
    {
        return $this->hasMany(LessonAttendance::class);
    }
}
