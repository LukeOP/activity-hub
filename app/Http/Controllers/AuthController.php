<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginUserRequest;
use App\Http\Requests\StoreUserRequest;
use App\Models\School;
use App\Models\User;
use App\Models\UserSchool;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    use HttpResponses;

    public function login(LoginUserRequest $request)
    {
        $request->validated($request->all());

        if (!Auth::attempt($request->only('email', 'password'))) {
            return $this->error('', 'Your password or email address was incorrect, please try again', 401);
        }

        $user = User::where('email', $request->email)->first();

        $user->is_admin = $user->adminSchools();
        $user->schools = $user->userSchools();

        return $this->success([
            'user' => $user,
            'token' => $user->createToken('API Token of ' . $user->first_name . ' ' . $user->last_name)->plainTextToken
        ]);
    }

    public function register(StoreUserRequest $request)
    {
        $request->validated($request->all());

        $user = User::create([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            // 'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return $this->success([
            'user' => $user,
            'token' => $user->createToken('API Token of ' . $user->first_name . ' ' . $user->last_name)->plainTextToken
        ]);
    }

    public function logout()
    {
        Auth::user()->currentAccessToken()->delete();

        return $this->success([
            'message' => 'You have been successfully logged out and your token has been deleted'
        ]);
    }
}
