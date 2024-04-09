<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreEventJobRequest;
use App\Http\Resources\EventJobResource;
use App\Models\EventJob;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class EventJobController extends Controller
{
    use HttpResponses;
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
        return EventJobResource::collection(EventJob::where('event_id', $event_id)->orderBy('due_date')->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreEventJobRequest $request)
    {
        try {
            $job = EventJob::create($request->all());
            $newJob = EventJob::where('id', $job->id)->first();
    
            return $this->success(
                new EventJobResource($newJob),
                'Job Created Successfully',
                'your new job has been added to the event.'
            );
        } catch (Exception $e){
            return $this->generalError();
        }
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
        try {
            $job = EventJob::findOrFail($id);
    
            $job->fill($request->all());
            $job->save();
    
            return $this->success(
                new EventJobResource($job),
                'Job Updated',
                'The event job has been successfully updated.',
            );
        } catch (ModelNotFoundException $e) {
            return $this->error(
                $e,
                'Error Updating Event Job.',
                'The event job model could not be found.',
                404
            );
        } catch (Exception $e) {
            return $this->generalError();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $event_job = EventJob::findOrFail($id);
            $event_job->delete();

            return $this->success(
                null,
                'Event Job Deleted',
                'The event job has been successfully deleted.',
                200
            );
        } catch (ModelNotFoundException $e) {
            return $this->error(
                $e,
                'Error Removing Event Job.',
                'The event job could not be deleted as the record was not found.',
                404
            );
        } catch (Exception $e) {
            return $this->generalError();
        }
    }
}
