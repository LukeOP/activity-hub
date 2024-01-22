<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Mail\NewLessonRequestReceivedEmail;
use App\Mail\TestEmail;
use App\Mail\UserLinkedEmail;
use App\Models\School;
use App\Models\User;
use App\Models\UserPermission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller
{
    public function test(){
        $user = User::first();
        Mail::to('luke.noble91@hotmail.com')->send(new TestEmail($user));
        return 'Email Sent... maybe?';
    }

    public function UserLinkedToSchool(Request $request){
        // TODO send email to administrator to indicate user has joined school
        $adminUsers = UserPermission::where('school_id', $request->school_id)
            ->where('permission_type', 'Administrator')
            ->with('user')
            ->get();
        
            $users = $adminUsers->pluck('user');
            $usersArray = $users->toArray();

            $linkedUser = User::where('id', $request->user_id)->first();
            $school = School::where('id', $request->school_id)->first();
        
            foreach ($usersArray as $admin) {
                Mail::to($admin->email)->send(new UserLinkedEmail($admin, $school, $linkedUser, $request->invitation));
            }
        
            return $adminUsers;

    }

    public function newLessonRequestReceived(string $form_title){
        // TODO send email to administrator of new lesson requests
        $user = User::first();
        try {
            Mail::to('luke.noble91@hotmail.com')->send(new NewLessonRequestReceivedEmail($form_title, $user));
            return ["response" => "success", "message" => "Email sent successfully"];
        } catch (\Throwable $th) {
            return ["response" => "error", "message" => "error in sending email: $th"];
        }
    }
    public function newLessonRequestConfirmation(){
        // TODO send email to user who sent request to confirm it has been received
    }
    public function newLessonAssignedTutor(){
        // TODO send email to tutor to let them know they have been assigned a new lesson
    }
    public function newLessonAssignedStudent(){
        //TODO send email to student to let them know their lesson has been reviewed and sent to a tutor for follow-up
    }
}
