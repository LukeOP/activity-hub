<?php

namespace App\Models;

use App\Http\Resources\LessonsResource;
use App\Models\Lesson;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CalendarEvent extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id',
        'user_id',
        'title',
        'start',
        'end',
        'allDay',
        'className',
        'reference_type',
        'reference_type_id',
    ];

    public function lesson($id)
    {
        return new LessonsResource(Lesson::where('id', $id)->first());

        // return LessonsResource::collection(
        //     Lesson::where('id', $id)->get()
        // );
    }
}
