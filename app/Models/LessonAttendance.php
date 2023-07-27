<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LessonAttendance extends Model
{
    use HasFactory;

    protected $table = 'lesson_attendance';

    protected $fillable = [
        'lesson_id',
        'attendance',
        'date',
        'time',
        'user_id'
    ];
}
