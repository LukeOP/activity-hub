<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserSchoolInvitationsResource;
use App\Models\UserSchoolInvitation;
use Illuminate\Http\Request;

class UserSchoolInvitationsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return UserSchoolInvitation::all();
    }

    public function getInvitesForSchool($school)
    {
        $invites = UserSchoolInvitationsResource::collection(UserSchoolInvitation::where('school_id', $school)->get());
        return $invites;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $invitation = UserSchoolInvitation::create([
            'school_id' => $request->school_id,
            'reference' => $request->reference,
            'email' => $request->email,
            'code' => bin2hex(random_bytes(3))
        ]);

        return new UserSchoolInvitationsResource($invitation);
    }

    /**
     * Display the specified resource.
     */
    public function show($code)
    {
        //
    }

    public function getInviteByCode($code)
    {

        $invitation = UserSchoolInvitation::where('code', $code)->first();
        if ($invitation) return new UserSchoolInvitationsResource($invitation);
        else throw 'Invalid invitation code';
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, UserSchoolInvitation $userSchoolInvitation)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $invitation = UserSchoolInvitation::where('id', $id)->first();
        return $invitation->delete() ? [
            'message' => 'successfully deleted',
            'permission' => new UserSchoolInvitationsResource($invitation)
        ] : 'deletion failed';
    }
}
