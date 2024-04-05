<?php

namespace App\Http\Controllers;

use App\Http\Resources\EventsResource;
use App\Models\Event;
use App\Models\User;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EventsController extends Controller
{
    use HttpResponses;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Get User's List of associated-schools and create an array of school ids
        $user = User::where('id', Auth::user()->id)->first();
        $userSchools = $user->schools;
        $userAdmin = $user->isAdmin->pluck('school_id')->toArray();
        $eventsCollection = new Collection();

        // For each user-associated school check if they have permission to view all events 
        // If they do or they are an administrator - get all events for that school
        // Else just get the events assigned to the tutor
        foreach ($userSchools as $school) {
            $hasPermission = $user->hasPermissionForSchool($school->id, 'EVENTS_V');
            $eventsAtSchool = [];

            if ($hasPermission || in_array($school->id, $userAdmin)) {
                $eventsAtSchool = EventsResource::collection(Event::where('school_id', $school->id)->where('archived', false)->get());
            } 
            else {
                $eventsAtSchool = EventsResource::collection(Event::where('user_id', $user->id)->get());
            }
            if($eventsAtSchool != []){
                $eventsCollection = $eventsCollection->concat($eventsAtSchool);
            }
        }



        // return compiled list of events the user has access to
        return $eventsCollection;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $newEvent = Event::create([
            'name' => $request->title,
            'school_id' => $request->school,
            'description' => $request->description,
            'location' => $request->location,
            'date' => $request->date,
            'time' => $request->time,
        ]);

        return response()->json(
            [
                'message' => 'Event Added successfully',
                'event' => new EventsResource(Event::where('id', $newEvent->id)->first())
            ]
        );
    }

    /**
     * Display the specified resource.
     */
    public function show(Event $event)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(String $id, Request $request)
    {
        try {
            $event = Event::findOrFail($id);
    
            $event->fill($request->all());
            $event->save();
            // return new EventsResource(Event::where('id', $event['id'])->first());
    
            return $this->success(
                new EventsResource(Event::where('id', $event['id'])->first()),
                'Event Updated Successfully',
                'Event details have been updated.'
            );
        } catch (ModelNotFoundException $e) {
            return $this->error(
                $e,
                null,
                'Error in updating event details',
                404
            );
        } catch (Exception $e){
            return $this->generalError();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $event_id)
    {
        $deleted = Event::where('id', $event_id)->first()->delete();
        if ($deleted) return 'success';
        else return 'error';
    }
}
