<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class School extends Model
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
        'name', 'subscription', 'number', 'address'
    ];

    public function users()
    {
        return $this->belongsToMany(User::class, 'User_Schools', 'school_id', 'user_id');
    }
    public function students()
    {
        return $this->HasMany(Students::class);
    }
}
