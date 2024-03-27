<?php

namespace App\Models;

use App\Http\Resources\LessonNotesResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class LessonNotes extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'lesson_notes';

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
        'lesson_id', 
        'user_id', 
        'attendance_id',
        'planning_comment',
        'progress_comment',
        'next_steps_comment',
        'general_comment'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
