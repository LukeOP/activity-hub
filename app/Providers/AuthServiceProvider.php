<?php

namespace App\Providers;

// use Illuminate\Support\Facades\Gate;

use App\Models\User;
use Illuminate\Auth\Notifications\ResetPassword;
use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Hash;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        ResetPassword::createUrlUsing(function (User $user, string $token){
            return env("APP_URL", "https://activityhub.co.nz").'/password?token='.$token.'&email='.$user->email;
        });

        VerifyEmail::createUrlUsing(function (User $user){
            $token = Hash::make($user->email);
            return env("APP_URL", "https://activityhub.co.nz").'/email-verified?token='.$token . '&email='.$user->email;
        });
    }
}
