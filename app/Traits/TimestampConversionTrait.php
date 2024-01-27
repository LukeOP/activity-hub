<?php
namespace App\Traits;

use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

trait TimestampConversionTrait
{
    protected function convertToUserTimezone($timestamp)
    {
        if(Auth::user()){
            $userTimezone = Auth::user()->timezone;
        } else $userTimezone = 'Pacific/Auckland';

        return Carbon::parse($timestamp)->timezone($userTimezone)->toDateTimeString();
    }
}
