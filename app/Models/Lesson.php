<?php

namespace App\Models;

use App\Http\Resources\StudentsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    use HasFactory;

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

    // public function contacts()
    // {
    //     return $this->hasOne(Contacts::class);
    // }

    public function school()
    {
        return $this->belongsTo(School::class);
    }
}
