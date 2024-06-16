<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginUserRequest;
use App\Http\Requests\StoreUserRequest;
use App\Http\Resources\UserNotificationsResource;
use App\Http\Resources\UserPermissionsResource;
use App\Models\School;
use App\Models\User;
use App\Models\UserSchool;
use App\Traits\HttpResponses;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    use HttpResponses;

    public function login(LoginUserRequest $request)
    {
        try {
            $request->validated($request->all());
    
            if (!Auth::attempt($request->only('email', 'password'))) {
                return $this->error('', null, 'Your password or email address was incorrect, please try again', 401);
            }
    
            $user = User::where('email', $request->email)->first();
            
            if($user->email_verified_at == null) {
                return $this->error('', null, 'Your email has not yet been verified. Please click the link in the email sent on registration. Or request a new email.', 403);
            }
            
            $user->schools = $user->userSchools();
            $user->permissions = UserPermissionsResource::collection($user->userPermissions);
            $user->notifications = UserNotificationsResource::collection($user->userNotifications);
    
            return $this->success([
                'user' => $user,
                'token' => $user->createToken('API Token of ' . $user->first_name . ' ' . $user->last_name)->plainTextToken
            ]);
        } catch (\Throwable $e){
            return $this->generalError($e);
        }
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

        event(new Registered($user));

        return $this->success([
            'user' => $user,
            'token' => $user->createToken('API Token of ' . $user->first_name . ' ' . $user->last_name)->plainTextToken
        ]);
    }

    public function logout()
    {
        Auth::user()->currentAccessToken()->delete();

        return $this->success(
            null,
            'Successfully Logged Out',
            'You have been successfully logged out and your token has been deleted',
        );
    }

    public function sendEmailVerificationEmail(Request $request){
        $user = User::where('email', $request->email)->first();
        event(new Registered($user));
        return $this->success('','Email sent');
    }
    public function checkEmailVerificationToken(Request $request){
        $user = User::where('email', $request->email)->first();
        $result = Hash::check($user->email, $request->token);
        if($result) {
            $user->markEmailAsVerified();
            return $this->success('', 'Email validated');
        }
        else return $this->error('', 'Validation Error', 'Error in validating email', 401);
    }
}
