<?php

namespace App\Models;

use App\Http\Resources\SchoolsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Lesson extends Model
{
    use HasFactory;
    use SoftDeletes;

    // public $incrementing = false;
    // protected $keyType = 'string';

    // protected static function boot()
    // {
    //     parent::boot();

    //     static::creating(function ($model) {
    //         $model->{$model->getKeyName()} = Str::uuid()->toString();
    //     });
    // }

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
        'fee',
        'experience'
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
