<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserPermission extends Model
{
    use HasFactory;
    // use SoftDeletes;

    protected $fillable = [
        'school_id',
        'user_id',
        'permission_type'
    ];

    public function school()
    {
        return $this->belongsTo(School::class);
    }
}
