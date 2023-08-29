<?php

namespace App\Models;

use App\Http\Resources\SchoolsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserSchoolInvitation extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id',
        'reference',
        'email',
        'code'
    ];

    public function school($school_id)
    {
        return new SchoolsResource(School::where('id', $school_id)->first());
    }
}
