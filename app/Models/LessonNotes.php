<?php

namespace App\Models;

use App\Http\Resources\LessonNotesResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LessonNotes extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'lesson_notes';
    protected $fillable = [
        'lesson_id', 'comment'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
