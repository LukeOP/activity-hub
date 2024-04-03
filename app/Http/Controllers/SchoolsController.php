<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreSchoolRequest;
use App\Http\Resources\SchoolsResource;
use App\Models\School;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SchoolsController extends Controller
{
    use HttpResponses;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $user = Auth::user();
        $schoolIds = $user->schools->pluck('id')->toArray();

        return SchoolsResource::collection(
            School::whereIn('id', $schoolIds)->orderBy('name')->get()
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreSchoolRequest $request)
    {
        $request->validated($request->all());

        $school = School::create([
            'name' => $request->name,
            'subscription' => $request->subscription,
            'number' => $request->number,
            'address' => $request->address
        ]);

        return new SchoolsResource($school);
    }

    /**
     * Display the specified resource.
     */
    public function show(School $school)
    {
        return $this->isNotAuthorized($school) ? $this->isNotAuthorized($school) : new SchoolsResource($school);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, School $school)
    {
        if (Auth::user()->school_id != $school->id) {
            return $this->authenticationError();
        }

        $school->update($request->all());

        return new SchoolsResource($school);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(School $school)
    {
        return $this->isNotAuthorized($school) ? $this->isNotAuthorized($school) : $school->delete();
    }

    private function isNotAuthorized(School $school)
    {
        // if (Auth::user()->school_id != $school->id) {
        //     return $this->authenticationError();
        // }
    }
}
