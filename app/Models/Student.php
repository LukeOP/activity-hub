<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Contacts;
use Illuminate\Support\Str;

class Student extends Model
{
    use HasFactory;

    public $incrementing = false;
    protected $fillable = [
        'first_name',
        'last_name',
        'tutor_group',
        'year_level',
        'gender',
        'date_of_birth',
        'enrolled_status',
        'identifier',
        'school_id',
    ];
    protected $keyType = 'string';

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $model->{$model->getKeyName()} = Str::uuid()->toString();
        });
    }

    public function contacts()
    {
        return $this->hasOne(StudentContacts::class);
    }

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function lessons()
    {
        return $this->hasMany(Lesson::class);
    }
    
    public function getAge(?string $dob): ?int
    {
        if ($dob === null) return null;
        $year = (date('Y') - date('Y', strtotime($dob)));
        return $year;
    }
}
