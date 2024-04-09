<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreEventJobUserRequest;
use App\Http\Resources\EventJobResource;
use App\Http\Resources\EventsResource;
use App\Models\Event;
use App\Models\EventJob;
use App\Models\EventJobUser;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class EventJobUsersController extends Controller
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
     * Store a newly created resource in storage.
     */
    public function store(StoreEventJobUserRequest $request)
    {
        try {
            EventJobUser::create([
                'event_job_id' => $request->event_job_id,
                'user_id' => $request->user_id,
            ]);

            return $this->success(
                new EventJobResource(EventJob::where('id', $request->event_job_id)->first()),
                'User Assigned',
                'User has been assigned to the event job.',
                201
            );
        } catch (Exception $e) {
            return $this->generalError();
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
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
        try {
            $event_job_user = EventJobUser::findOrFail($id);
            $event_job_user->delete();

            return $this->success(
                null,
                'Assigned User Removed',
                'The user is no longer assigned to the event job.',
                200
            );
        } catch (ModelNotFoundException $e) {
            return $this->error(
                $e,
                'Error Removing Assigned User.',
                'The Assigned User could not be removed as the record was not found.',
                404
            );
        } catch (Exception $e) {
            return $this->generalError();
        }
    }
}
