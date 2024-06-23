<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserNotificationPreferenceRequest;
use App\Http\Resources\UserNotificationsResource;
use App\Models\User;
use App\Models\UserNotificationOptions;
use App\Models\UserNotificationPreference;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserNotificationPreferenceController extends Controller
{
    use HttpResponses;

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $user = User::where('id', Auth::user()->id)->first();
            return UserNotificationPreference::where('user_id', $user->id)->get();
        }
        catch (Exception $e){
            return $this->generalError($e);
        }
    }

    public function getNotificationOptions(){
        return UserNotificationOptions::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(UserNotificationPreferenceRequest $request)
    {
        try {
            // Extract validated data from the request
            $data = $request->validated();
    
            // Set default values for optional fields if they are not provided
            $data['app'] = $data['app'] ?? false;
            $data['email'] = $data['email'] ?? false;

            $notificationPreference = UserNotificationPreference::create($data);

            return $this->success(
                new UserNotificationsResource($notificationPreference),
                'Notification Preference Created',
                'Notification Preference Updated',
                201
            );
        } 
        catch (QueryException $e){
            return $this->error(
                $e,
                'Query Exception',
                'Not all required fields passed validation.'
            );
        }
        catch (Exception $e) {
            return $this->generalError($e);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(UserNotificationPreference $userNotificationPreference)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update($id, Request $request)
    {
        try {
            $preferenceRecord = UserNotificationPreference::findOrFail($id);

            $preferenceRecord->update($request->all());

            return $this->success(
                new UserNotificationsResource($preferenceRecord),
                'Notification Preference Updated'
            );
        }
        catch (ModelNotFoundException $e){
            return $this->modelNotFound();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(UserNotificationPreference $userNotificationPreference)
    {
        //
    }
}
