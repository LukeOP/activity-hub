<?php

namespace App\Models;

use App\Http\Resources\SchoolsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Instrument extends Model
{
    use HasFactory;
    use SoftDeletes;

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
