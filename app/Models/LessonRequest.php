<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class LessonRequest extends Model
{
    use HasFactory;
    use SoftDeletes;

    public $incrementing = false;
    protected $keyType = 'string';

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $model->{$model->getKeyName()} = Str::uuid()->toString();
        });
    }

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
        'form_id'
    ];

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function form()
    {
        return $this->belongsTo(LessonRequestForm::class);
    }
}
