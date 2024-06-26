<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;


class Notifications extends Model
{
    use HasFactory;

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
        'user_id',
        'icon',
        'header',
        'details',
        'route',
        'dataType',
        'dataId',
        'seenStatus'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}