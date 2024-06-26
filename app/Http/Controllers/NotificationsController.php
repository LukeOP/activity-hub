<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreNotificationRequest;
use App\Models\Notifications;
use App\Models\User;
use App\Traits\HttpResponses;
use Doctrine\DBAL\Query\QueryException;
use Exception;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use PhpParser\Node\Stmt\TryCatch;
use Throwable;

class NotificationsController extends Controller
{
    use HttpResponses;

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Display a listing of the resource.
     */
    public function newNotifications($timeStamp)
    {
        $user = User::where('id', Auth::user()->id)->first();
        $newNotifications = Notifications::where('user_id', $user->id)->where('created_at', '>', $timeStamp)->get();

        return $this->success(
            $newNotifications
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreNotificationRequest $request)
    {
        //
    }

    /**
     * Public endpoint for setting a notification (like new lesson request)
     */
    public function setNotification(StoreNotificationRequest $request)
    {
        try {
            // Extract validated data from the request
            $data = $request->validated();
            $data['seenStatus'] = 0;

            $recipients = $this->getRecipients($data);

            foreach ($recipients as $recipient) {
                $data['user_id'] = $recipient->id;
                Notifications::create($data);
              }


            return $this->success(
                null,
                'Notification Created',
                '',
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
    public function show(Notifications $notifications)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update($id, Request $request)
    {
        try {
            $notification = Notifications::findOrFail($id);

            $notification->update($request->all());

            return $this->success(
                $notification,
                'Notification Updated'
            );
        }
        catch (ModelNotFoundException $e){
            return $this->modelNotFound();
        }
        catch (Exception $e) {
            return $this->generalError();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Notifications $notifications)
    {
        //
    }

    protected function getRecipients($data) {
        if ($data['recipient'] != 'individual') {
            return User::whereHas('userPermissions', function ($query) use ($data) {
                $query->where('permission_type', $data['recipient'])->where('school_id', $data['school_id']);
            })->get();
        }
    
        // Optionally handle the case where $data->recipient is 'individual'
        return [(User::findOrFail($data['user_id']))];
    }
    
}
