<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Http\Resources\SchoolsResource;
use App\Http\Resources\SubjectResource;
use App\Http\Resources\UserPermissionsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Str;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    public $incrementing = false;
    protected $keyType = 'string';

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $model->{$model->getKeyName()} = Str::uuid()->toString();
        });
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        // 'name',
        'first_name',
        'last_name',
        'image',
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
        $schools = $this->belongsToMany(School::class, 'user_schools', 'user_id', 'school_id')->orderBy('name')->get();
        return SchoolsResource::collection($schools);
    }

    public function isAdmin()
    {
        return $this->userPermissions()->where('permission_type', 'administrator');
    }

    public function userPermissions()
    {
        return $this->hasMany(UserPermissions::class, 'user_id');
    }

    public function permissionsForSchool($schoolId)
    {
        $permissions = $this->userPermissions()->where('school_id', $schoolId)->get();
        return UserPermissionsResource::collection($permissions);
    }

    public function getSubjects()
    {
        $subjects = $this->hasMany(UserSubject::class, 'user_id')->get();
        return SubjectResource::collection($subjects);
    }

    public function getSubjectsForSchool($schoolId)
    {
        $subjects = $this->hasMany(UserSubject::class, 'user_id')->where('school_id', $schoolId)->get();
        return SubjectResource::collection($subjects);
    }
}
