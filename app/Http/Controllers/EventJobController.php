<?php

namespace App\Http\Controllers;

use App\Http\Resources\EventJobResource;
use App\Models\EventJob;
use Illuminate\Http\Request;

class EventJobController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return EventJobResource::collection(EventJob::all());
    }

    /**
     * Display Collection of Jobs based on job_id
     */
    public function getJobsForEvent(string $event_id)
    {
        return EventJob::where('event_id', $event_id)->orderBy('due_date')->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'event_id' => 'required',
            'description' => 'required',
            'due_date' => 'required'
        ]);

        $job = EventJob::create($validatedData);

        return new EventJobResource($job);
    }

    /**
     * Display the specified resource.
     */
    public function show(EventJob $eventJob)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $job = EventJob::findOrFail($id);

        $job->fill($request->all());
        $job->save();

        return ['success', 'EventJob updated'];
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(EventJob $eventJob)
    {
        //
    }
}
