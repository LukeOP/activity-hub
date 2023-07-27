<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Contacts;

class Student extends Model
{
    use HasFactory;

    public function contacts()
    {
        return $this->hasOne(Contacts::class);
    }

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function lessons()
    {
        return $this->hasMany(Lesson::class);
    }
}
