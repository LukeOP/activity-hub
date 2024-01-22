<?php

namespace App\Http\Controllers;

use App\Http\Resources\EventsResource;
use App\Models\Event;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EventsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Get User's List of associated-schools and create an array of school ids
        $user = User::where('id', Auth::user()->id)->first();
        $userSchools = $user->schools;
        $userAdmin = $user->isAdmin->pluck('school_id')->toArray();
        $lessonCollection = new Collection();

        // For each user-associated school check if they have permission to view all lessons 
        // If they do or they are an administrator - get all student lessons for that school
        // Else just get the lessons assigned to the tutor
        foreach ($userSchools as $school) {
            $hasPermission = $user->hasPermissionForSchool($school->id, 'EVENTS_V');

            if ($hasPermission || in_array($school->id, $userAdmin)) {
                $eventsAtSchool = EventsResource::collection(Event::where('school_id', $school->id)->get());
            } 
            // else {
            //     $eventsAtSchool = EventsResource::collection(Event::where('user_id', $user->id)->get());
            // }
            $lessonCollection = $lessonCollection->concat($eventsAtSchool);
        }

        // return compiled list of lessons the user has access to
        return $lessonCollection;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
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
     * Show the form for editing the specified resource.
     */
    public function edit(Event $event)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Event $event)
    {
        //
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
