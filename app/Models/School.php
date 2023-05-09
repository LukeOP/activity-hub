<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class School extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'name', 'subscription', 'number', 'address'
    ];

    public function users()
    {
        return $this->belongsToMany(User::class, 'User_Schools', 'school_id', 'user_id');
    }
}
