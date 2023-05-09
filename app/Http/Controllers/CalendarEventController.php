<?php

namespace App\Http\Controllers;

use App\Http\Resources\CalendarEventsResource;
use App\Models\CalendarEvent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CalendarEventController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return CalendarEventsResource::collection(
            CalendarEvent::where('user_id', Auth::user()->id)->get()
        );
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
