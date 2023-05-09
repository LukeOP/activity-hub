<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Http\Resources\SchoolsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        // 'name',
        'first_name',
        'last_name',
        'email',
        'password',
        'school_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function schools()
    {
        return $this->belongsToMany(School::class, 'user_schools', 'user_id', 'school_id');
    }

    public function userSchools()
    {
        $schools = $this->belongsToMany(School::class, 'user_schools', 'user_id', 'school_id')->get();
        return SchoolsResource::collection($schools);
    }

    public function isAdmin()
    {
        return $this->belongsToMany(School::class, 'school_administrators', 'user_id', 'school_id');
    }

    public function adminSchools()
    {
        $schools = $this->belongsToMany(School::class, 'school_administrators', 'user_id', 'school_id')->get();
        return SchoolsResource::collection($schools);
    }
}
