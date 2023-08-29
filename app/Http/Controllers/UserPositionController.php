<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserPositionResource;
use App\Models\UserPosition;
use Illuminate\Http\Request;

class UserPositionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new UserPositionResource(UserPosition::first());
    }
    /**
     * Display a listing of the resource for a user in a school.
     */
    public function getUserPositionAtSchool($user, $school)
    {
        return new UserPositionResource(
            UserPosition::where('user_id', $user)
                ->where('school_id', $school)
                ->first()
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $position = UserPosition::create([
            'user_id' => $request->user_id,
            'school_id' => $request->school_id,
            'position' => 'Basic User'
        ]);
        if ($position) {
            return ['message' => 'success', 'result' => $position];
        } else {
            return ['message' => 'error: User Position not created'];
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(UserPosition $userPosition)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update($id, Request $request)
    {
        $userPosition = UserPosition::findOrFail($id);
        $userPosition->update($request->all());
        return $userPosition;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(UserPosition $userPosition)
    {
        //
    }
}
