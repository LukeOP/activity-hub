<?php

namespace App\Http\Controllers;

use App\Http\Resources\EventJobResource;
use App\Http\Resources\EventTemplateResource;
use App\Models\Event;
use App\Models\EventJob;
use App\Models\EventSchoolJob;
use App\Models\EventSchoolJobTemplate;
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

    public function getSchoolEventJobTemplates(string $school_id)
    {
        return EventTemplateResource::collection(EventSchoolJobTemplate::where('school_id', $school_id)->get());
    }

    public function updateSchoolEventJobTemplate(Request $request, string $template_id)
    {
        $job = EventSchoolJobTemplate::findOrFail($template_id);

        $job->fill($request->all());
        $job->save();

        return ['success', 'Template updated', 'Details updated on template.'];
    }

    public function getTemplateJobs(string $template_id)
    {
        return EventSchoolJob::where('template_id', $template_id)->orderBy('priority')->get();
    }

    public function createEventJobFromSchoolEventIdentifier(string $event_id, string $template)
    {
        // Fetch Event Data
        $event = Event::where('id', $event_id)->first();

        // Get the event job template that matches the school and template
        $eventJobs = EventSchoolJob::where('template_id', $template)->orderBy('priority')->get();

        // Iterate through the template of jobs and create a job for the fetched event
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

        // Return the collection of event Jobs created
        return $eventJobCollection;
    }

    public function createEventTemplate(Request $request)
    {
        $template = EventSchoolJobTemplate::create([
            'school_id' => $request->school_id,
            'heading' => $request->heading,
        ]);

        return new EventTemplateResource($template);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $job = EventSchoolJob::create([
            'template_id' => $request->template_id,
            'description' => $request->description,
            'priority' => $request->priority,
        ]);

        return $job;
    }

    /**
     * Display the specified resource.
     */
    public function show(EventSchoolJob $eventSchoolJob)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $job = EventSchoolJob::findOrFail($id);

        $job->fill($request->all());
        $job->save();

        return $job;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $itemDeleted = EventSchoolJob::where('id', $id)->first()->delete();
        if ($itemDeleted) return 'Item Deleted';
        else return 'Error deleting item';
    }
}
