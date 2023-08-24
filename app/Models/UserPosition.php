<?php

namespace App\Models;

use App\Http\Resources\SchoolsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserPosition extends Model
{
    use HasFactory;

    protected $table = 'user_positions';

    public function School($schoolId)
    {
        return new SchoolsResource(School::where('id', $schoolId)->first());
    }
}
