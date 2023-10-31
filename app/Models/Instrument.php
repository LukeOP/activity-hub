<?php

namespace App\Models;

use App\Http\Resources\SchoolsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Instrument extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'name',
        'type',
        'family',
        'notes',
        'state_id',
        'school_id',
        'fee'
    ];

    public function state($state_id)
    {
        return InstrumentState::where('id', $state_id)->first();
    }

    public function school($school_id)
    {
        return new SchoolsResource(School::where('id', $school_id)->first());
    }
}
