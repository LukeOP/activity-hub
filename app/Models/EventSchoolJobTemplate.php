<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class EventSchoolJobTemplate extends Model
{
    use HasFactory;

    protected $table = 'events_school_jobs_templates';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'heading', 'description', 'notes', 'school_id'
    ];


    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $model->{$model->getKeyName()} = Str::uuid()->toString();
        });
    }

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function jobs()
    {
        return $this->hasMany(EventSchoolJob::class, 'template_id');
    }
}
