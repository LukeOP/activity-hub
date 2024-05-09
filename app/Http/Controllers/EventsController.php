<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreEventRequest;
use App\Http\Requests\UpdateEventRequest;
use App\Http\Resources\EventsResource;
use App\Models\Event;
use App\Models\EventUser;
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
        try {
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
                    $eventsAtSchool = EventsResource::collection(
                        Event::where('school_id', $school->id)
                            ->where('archived', false)
                            ->get());
                } 
                $eventsCollection = $eventsCollection->concat($eventsAtSchool);
            }
            $associatedEvents = EventsResource::collection(
                Event::whereHas('users', function($query) use ($user) {
                $query->where('user_id', $user->id);
            })->get());
        
            $eventsCollection = $eventsCollection->concat($associatedEvents);

            // return compiled list of events the user has access to
            return $this->success(
                $eventsCollection,
                'Upcoming Events'
            );
        } catch (ModelNotFoundException $e){
            return $this->error($e);
        } catch (Exception $e){
            return $this->generalError($e);
        }
    }

    public function getArchivedEvents()
    {   
        try {
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
                    $eventsAtSchool = EventsResource::collection(
                        Event::where('school_id', $school->id)
                             ->where('archived', true)
                             ->get());
                } 
                $eventsCollection = $eventsCollection->concat($eventsAtSchool);
            }
            $associatedEvents = EventsResource::collection(
                Event::whereHas('users', function($query) use ($user) {
                $query->where('user_id', $user->id);
            })->get());
    
            $eventsCollection = $eventsCollection->concat($associatedEvents);
    
            // return compiled list of events the user has access to
            return $this->success(
                $eventsCollection,
                'Archived Events'
            );
        } catch (ModelNotFoundException $e){
            return $this->error($e);
        } catch (Exception $e){
            return $this->generalError($e);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreEventRequest $request)
    {
        try {
            $newEvent = Event::create([
                'name' => $request->name,
                'school_id' => $request->school_id,
                'description' => $request->description,
                'location' => $request->location,
                'date' => $request->date,
                'time' => $request->time,
            ]);

            return $this->success(
                new EventsResource(Event::where('id', $newEvent->id)->first()),
                'Event Added Successfully',
                null,
                201
            );
        } catch (Exception $e){
            return $this->generalError($e);
        }
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
    public function update(String $id, UpdateEventRequest $request)
    {
        try {
            $event = Event::findOrFail($id);
    
            $event->fill($request->only('name', 'description', 'location', 'date', 'time'));
            $event->save();
    
            return $this->success(
                new EventsResource(Event::where('id', $event['id'])->first()),
                'Event Updated Successfully',
                'Event details have been updated.'
            );
        } catch (ModelNotFoundException) {
            return $this->modelNotFound();
        } catch (Exception){
            return $this->generalError();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $event_id)
    {
        try {
            Event::where('id', $event_id)->first()->delete();
            return $this->success(null, 'Event Deleted', null, 204);
        } catch (ModelNotFoundException $e){
            return $this->modelNotFound();
        } catch (Exception){
            return $this->generalError();
        }
    }
}
