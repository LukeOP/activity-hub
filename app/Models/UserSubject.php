<?php

namespace App\Models;

use App\Http\Resources\SchoolsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserSubject extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = "user_subjects";

    public function School($schoolId)
    {
        return new SchoolsResource(School::where('id', $schoolId)->first());
    }
}
