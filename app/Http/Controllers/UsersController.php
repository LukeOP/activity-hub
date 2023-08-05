<?php

namespace App\Http\Controllers;

use App\Http\Resources\TutorResource;
use App\Http\Resources\UserPermissionsResource;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return UserResource::collection(
            User::get()
        );
    }

    /**
     * Display a list of users from a particular school
     */
    public function getUsersInSchool($schoolId)
    {
        $users = User::whereHas('schools', function ($query) use ($schoolId) {
            $query->where('schools.id', $schoolId);
        })->get();

        return TutorResource::collection($users)->resolve();
    }

    public function getUserOfToken($localToken)
    {
        $token = \Laravel\Sanctum\PersonalAccessToken::findToken($localToken);

        if (!$token) {
            return null;
        }

        $user = $token->tokenable;

        if (!$user) {
            return null;
        }

        $permissions = UserPermissionsResource::collection($user->userPermissions);

        return ['user' => new UserResource($user), 'permissions' => $permissions];
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
