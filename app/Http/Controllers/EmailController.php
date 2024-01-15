<?php

namespace App\Http\Controllers;

use App\Mail\NewLessonRequestReceivedEmail;
use App\Mail\TestEmail;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller
{
    public function test(){
        $user = User::first();
        Mail::to('luke.noble91@hotmail.com')->send(new TestEmail($user));
        return 'Email Sent... maybe?';
    }
    public function linkUserToSchool(){
        // TODO send email to user with code to link them to the school
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
