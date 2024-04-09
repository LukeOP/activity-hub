<?php

namespace App\Http\Controllers;

use App\Http\Resources\EventsResource;
use App\Models\Event;
use App\Models\EventUser;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class EventUsersController extends Controller
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
    public function store(Request $request)
    {
        try {
            EventUser::create([
                'event_id' => $request->event_id,
                'user_id' => $request->user_id,
            ]);

            return $this->success(
                new EventsResource(Event::find($request->event_id)),
                'User Linked',
                'User linked to event successfully',
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
            $user_record = EventUser::findOrFail($id);
            $event_id = $user_record->event_id;
            $result = $user_record->delete();

            if($result){
                return $this->success(
                    new EventsResource(Event::find($event_id)),
                    'Unlink Successful',
                    'The user has been successfully unlinked.',
                );
            }

        } catch (ModelNotFoundException $e){
            return $this->error(
                $e,
                'Error Unlinking User.',
                'The Event User could not be unlinked as the record was not found.',
                404
            );
        } catch (Exception){
            return $this->generalError();
        }
    }
}
