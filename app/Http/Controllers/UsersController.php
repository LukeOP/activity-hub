<?php

namespace App\Http\Controllers;

use App\Http\Resources\StaffResource;
use App\Http\Resources\UserPermissionsResource;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Str;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();
        $schoolIds = $user->schools->pluck('id')->toArray();

        return UserResource::collection(
            User::whereIn()
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

        $userArray = [];
        foreach ($users as $user) {
            $user->permissions = $user->permissionsForSchool($schoolId);
            $user->subjects = $user->getSubjectsForSchool($schoolId);
            $user->position = $user->getPositionAtSchool($schoolId);
            array_push($userArray, $user);
        }


        return StaffResource::collection($userArray)->resolve();
    }

    public function getUserOfToken($localToken)
    {
        $token = \Laravel\Sanctum\PersonalAccessToken::findToken($localToken);

        if (!$token) {
            return 'Token does not exist';
            return null;
        }

        $user = $token->tokenable;

        if (!$user) {
            return 'User does not exist';
            return null;
        }

        $permissions = UserPermissionsResource::collection($user->userPermissions);

        return ['user' => new UserResource($user), 'permissions' => $permissions];
    }

    public function searchForUser($search)
    {
        $users = User::where('first_name', 'LIKE', '%' . $search . '%')
            ->orWhere('last_name', 'LIKE', '%' . $search . '%')
            ->get(['first_name', 'last_name', 'id', 'email', 'image',]);
        return $users;
    }

    // Sends forgot password link to users
    public function forgotPassword(Request $request) {
        $request->validate(['email' => 'required|email']);

        $status = Password::sendResetLink(
            $request->only('email')
        );

        // return $status;
        return $status === Password::RESET_LINK_SENT
        ? 'success' : 'error';
    }
    public function resetPassword(Request $request){
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function (User $user, string $password) {
                $user->forceFill([
                    'password' => Hash::make($password)
                ])->setRememberToken(Str::random(60));

                $user->save();

                event(new PasswordReset($user));
            }
        );
        
        return $status === Password::PASSWORD_RESET 
        ? 'success' : 'error';
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
