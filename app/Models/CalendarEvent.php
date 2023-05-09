<?php

namespace App\Models;

use App\Http\Resources\LessonsResource;
use App\Models\Lesson;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CalendarEvent extends Model
{
    use HasFactory;

    public function lesson($id)
    {
        return LessonsResource::collection(
            Lesson::where('id', $id)->get()
        );
    }
}
