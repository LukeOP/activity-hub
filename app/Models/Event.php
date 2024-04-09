<?php

namespace App\Models;

use App\Http\Resources\EventUsersResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Event extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'events';

    public $incrementing = false;
    protected $keyType = 'string';
    protected $fillable = [
        'name',
        'school_id',
        'description',
        'notes',
        'location',
        'date',
        'time',
        'archived'
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
    
    public function school_term(){
        $term = SchoolTerms::where('school_id', $this->school_id)
            ->where('start_date', '<=', $this->date)
            ->where('end_date', '>=', $this->date)
            ->first();
        if($term){
            return $term->description;
        }
        return $term;
    }

    public function users(){
        return $this->hasMany(EventUser::class, 'event_id');
    }

    public function jobs(){
        return $this->hasMany(EventJob::class, 'event_id');
    }
}
