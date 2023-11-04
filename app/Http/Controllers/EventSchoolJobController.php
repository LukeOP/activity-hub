<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\EventJob;
use App\Models\EventSchoolJob;
use DateTime;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class EventSchoolJobController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    public function getSchoolJobs(string $school_id)
    {
        return EventSchoolJob::where('school_id', $school_id)->get();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    public function createEventJobFromSchoolEventIdentifier(string $event_id, string $school_id, string $identifier)
    {
        $event = Event::where('id', $event_id)->first();
        $eventJobs = EventSchoolJob::where('school_id', $school_id)->where('identifier', $identifier)->orderBy('priority')->get();

        $eventJobCollection = new Collection();
        foreach ($eventJobs as $job) {
            $newEvent = EventJob::create([
                'event_id' => $event->id,
                'description' => $job->description,
                'due_date' => $job->calculateDueDateFromPriority($event->date, $job->priority),
                'status' => 0,
            ]);
            $eventJobCollection = $eventJobCollection->concat($newEvent);
        }

        return $eventJobCollection;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(EventSchoolJob $eventSchoolJob)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(EventSchoolJob $eventSchoolJob)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, EventSchoolJob $eventSchoolJob)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(EventSchoolJob $eventSchoolJob)
    {
        //
    }
}
