<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCalendarEventRequest;
use App\Http\Resources\CalendarEventsResource;
use App\Models\CalendarEvent;
use App\Traits\HttpResponses;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CalendarEventController extends Controller
{
    use HttpResponses;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();

        if (!$user->isAdmin) {
            return CalendarEventsResource::collection(
                CalendarEvent::where('user_id', $user->id)->get()
            );
        } else {
            $schoolIds = $user->isAdmin->pluck('school_id')->toArray();

            return CalendarEventsResource::collection(
                CalendarEvent::whereIn('school_id', $schoolIds)
                    ->orWhere('user_id', $user->id)
                    ->get()
            );
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCalendarEventRequest $request)
    {
        $request->validated($request->all());

        $event = CalendarEvent::create([
            'school_id' => $request->school_id,
            'user_id' => $request->user_id,
            'title' => $request->title,
            'start' => $request->start ? $request->start : Carbon::now(),
            'end' => $request->end ? $request->end : null,
            'allDay' => $request->allDay ? $request->allDay : null,
            'className' => null,
            'reference_type' => $request->reference_type,
            'reference_type_id' => $request->reference_type_id,
        ]);

        return new CalendarEventsResource($event);
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
        //
    }
}
