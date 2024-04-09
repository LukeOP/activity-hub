<?php

namespace App\Http\Controllers;

use App\Http\Resources\EventTemplateResource;
use App\Models\Event;
use App\Models\EventJob;
use App\Models\EventSchoolJob;
use App\Models\EventSchoolJobTemplate;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class EventSchoolJobController extends Controller
{
    use HttpResponses;
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
        try {
            $job = EventSchoolJobTemplate::findOrFail($template_id);
    
            $job->fill($request->all());
            $job->save();

            return $this->success(
                $job,
                'Template Updated',
                'Template details have been successfully updated.'
            );
        } catch (ModelNotFoundException $e){
            return $this->error(
                $e,
                'Error in Updating Template.',
                'The template was not updated as the model cannot be found.',
                404
            );
        } catch (Exception){
            return $this->generalError();
        }
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
        try {
            $template = EventSchoolJobTemplate::create([
                'school_id' => $request->school_id,
                'heading' => $request->heading,
            ]);
    
            return $this->success(
                new EventTemplateResource($template),
                'Event Template Created',
                'A new template has been created.',
                201
            );
        } catch (Exception) {
            return $this->generalError();
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $job = EventSchoolJob::create([
                'template_id' => $request->template_id,
                'description' => $request->description,
                'priority' => $request->priority,
            ]);
    
            return $this->success(
                $job,
                'Template Job Created',
                'A new job has been added to your template.',
                201
            );
        } catch (Exception){
            $this->generalError();
        }
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
        try {
            $job = EventSchoolJob::findOrFail($id);
            $job->fill($request->all());
            $job->save();
    
            return $this->success(
                $job,
                'Template Job Updated',
                'The template job has been successfully updated.',
                201
            );
        } catch (ModelNotFoundException $e){
            $this->error(
                $e,
                'Error Updating Job',
                'There was an error locating the job model requested',
                404
            );
        } catch (Exception){
            $this->generalError();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $itemDeleted = EventSchoolJob::where('id', $id)->first()->delete();
            if ($itemDeleted) {
                return $this->success(
                    null,
                    'Job Deleted',
                    'The template job has been deleted.'
                );
            } else {
                return $this->error(
                    null,
                    'Error Deleting Job',
                    'The selected job has not been deleted.',
                    500
                );
            }
        } catch (Exception $e){
            return $this->generalError();
        }
    }

    public function deleteEventTemplate(string $template_id)
    {
        try {
            $itemDeleted = EventSchoolJobTemplate::where('id', $template_id)->first()->delete();
            if ($itemDeleted) {
                return $this->success(
                    null,
                    'Event Template Deleted',
                    'The template has been deleted.'
                );
            } else {
                return $this->error(
                    null,
                    'Error Deleting Event Template',
                    'The selected template has not been deleted.',
                    500
                );
            }
        } catch (Exception $e){
            return $this->generalError();
        }
    }

}
