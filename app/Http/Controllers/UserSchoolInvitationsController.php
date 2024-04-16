<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserSchoolInvitationsResource;
use App\Mail\SchoolInviteEmail;
use App\Models\School;
use App\Models\UserSchoolInvitation;
use App\Traits\HttpResponses;
use ArgumentCountError;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class UserSchoolInvitationsController extends Controller
{
    use HttpResponses;
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

        $school = School::where('id', $request->school_id)->first();

        Mail::to($request->email)->send(new SchoolInviteEmail($school, $invitation->code));

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
    public function destroy(string $id)
    {
        try {
            $invitation = UserSchoolInvitation::where('id', $id)->first();
            $school = $invitation->school_id;
            $invitation->delete();
            
            return $this->success(
                UserSchoolInvitationsResource::collection(UserSchoolInvitation::where('school_id', $school)->get()), 
                'Invitation Deleted', null, 
                200);
        } 
        catch (ModelNotFoundException $e){
            return $this->error($e, 'Error: Invitation Not found', 'Failed to delete the school invitation model.', 404);
        } 
        catch (Exception $e){
            return $this->generalError($e);
        }
    }
}
