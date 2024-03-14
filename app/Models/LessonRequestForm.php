<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class LessonRequestForm extends Model
{
    use HasFactory;

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
        'school_id',
        'description',
        'year',
        'logo_cb',
        'logo',
        'school_name_cb',
        'school_name',
        'heading_cb',
        'heading',
        'header_content_cb',
        'header_content',
        'contact_content_cb',
        'contact_content',
        'student_name_cb',
        'student_name',
        'student_email_cb',
        'student_email',
        'student_phone_cb',
        'student_phone',
        'student_age_cb',
        'student_age',
        'student_year_cb',
        'student_year',
        'pc_name_cb',
        'pc_name',
        'pc_phone_cb',
        'pc_phone',
        'pc_email_cb',
        'pc_email',
        'lesson_content_cb',
        'lesson_content',
        'instrument_cb',
        'instrument',
        'tutor_cb',
        'tutor',
        'funding_type_cb',
        'funding_type',
        'experience_cb',
        'experience',
        'footer_content_cb',
        'footer_content'
    ];

    public function school()
    {
        return $this->belongsTo(School::class);
    }
    public function instruments(){
        return $this->hasMany(LessonRequestFormData::class, 'lesson_request_form_id')->where('type', 'instrument')->where('available', '!=', 0)->pluck('value');
    }
    public function funding(){
        return $this->hasMany(LessonRequestFormData::class, 'lesson_request_form_id')->where('type', 'funding')->where('available', '!=', 0)->pluck('value');
    }
}
