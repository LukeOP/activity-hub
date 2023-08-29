<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserSchool extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = "user_schools";
    protected $fillable = [
        'user_id',
        'school_id'
    ];

    public function school()
    {
        return $this->belongsTo(School::class, 'id', 'school_id');
    }
}
