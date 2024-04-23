<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Mail\NewLessonAssignedCaregiverEmail;
use App\Mail\NewLessonAssignedStudentEmail;
use App\Mail\NewLessonAssignedTutorEmail;
use App\Mail\NewLessonRequestReceivedEmail;
use App\Mail\NewLessonRequestSubmittedEmail;
use App\Mail\TestEmail;
use App\Mail\UserLinkedEmail;
use App\Models\LessonRequestForm;
use App\Models\School;
use App\Models\User;
use App\Models\UserPermission;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller
{
    use HttpResponses;

    public function test(){
        try {
            $user = User::where('id', Auth::user()->id)->first();
            Mail::to()->send(new TestEmail($user));
            return 'Email Sent... maybe?';
        } catch (Exception $e){
            return $e;
        }
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

    public function newLessonRequestReceived(string $form_id, Request $request){
        try {
            // Fetch the lesson request form
            $lessonRequestForm = LessonRequestForm::findOrFail($form_id);
    
            // Send emails for both administration and confirmation
            $adminResult = $this->newLessonRequestAdministrator($lessonRequestForm);
            // return $this->newLessonRequestAdministrator($lessonRequestForm);
            $confirmationResult = $this->newLessonRequestConfirmationCaregiver($request);
    
            // Check if both emails were sent successfully
            if ($adminResult['status'] === 'success' && $confirmationResult['status'] === 'success') {
                return $this->success(null, 'success', 'Emails sent successfully');
            } else {
                return $this->error([$adminResult, $confirmationResult], 'error', 'Error in sending emails');
            }
    
        } catch (ModelNotFoundException $e) {
            return $this->error(null, 'error', 'Lesson request form not found', 404);
        } catch (\Throwable $th) {
            return $this->error(null, 'error', 'Error in sending email: ' . $th->getMessage());
        }
    }
    
    public function newLessonRequestAdministrator($lessonRequestForm){
        // send email to the school administrator
        try {            
            // Fetch admin users of the school
            $admin_users_of_school = User::whereHas('userPermissions', function($query) use ($lessonRequestForm) {
                $query->where('school_id', $lessonRequestForm->school_id)->where('permission_type', 'Administrator');
            })->get(['id', 'first_name', 'last_name', 'email']);
    
            // Send email to each administrator
            foreach ($admin_users_of_school as $administrator) {
                Mail::to($administrator->email)->send(new NewLessonRequestReceivedEmail($lessonRequestForm->description, $administrator));
            }
            return [
                'status' => 'success',
                'message' => 'Admin emails sent successfully'
            ];
        } catch (\Throwable $th) {
            return [
                'status' => 'error',
                'message' => 'Error in sending admin emails: ' . $th->getMessage()
            ];
        }
    }
    
    public function newLessonRequestConfirmationCaregiver($request){
        // send email to user who sent request to confirm it has been received
        $lessonRequest = $request->all();
        try {
            if(isset($request['parent']['email'])){
                Mail::to($request['parent']['email'])->send(new NewLessonRequestSubmittedEmail($lessonRequest));
            }
            return [
                'status' => 'success',
                'message' => 'User confirmation email sent successfully'
            ];
        } catch (\Throwable $th) {
            return [
                'status' => 'error',
                'message' => 'Error in sending user confirmation email: ' . $th->getMessage()
            ];
        }
    }    
    

    // EMAIL TUTOR REGARDING NEWLY ASSIGNED LESSON
    public function newLessonAssignedTutor(Request $request){
        try {
            $lesson = $request->all();
            $tutor = User::findOrFail($lesson['tutor']['id']);
            Mail::to($tutor->email)->send(new NewLessonAssignedTutorEmail($lesson));
            return $this->success(null, 'success', 'Tutor email sent successfully');
        } 
        catch (ModelNotFoundException $e){
            return $this->error( $e, 'Tutor Not Found', 'There was an error in locating the associated tutor model.', 404);
        } 
        catch (\Throwable $th) {
            return $this->error(null, 'error', 'Error in sending tutor notification email: ' . $th->getMessage());
        }
    }   
    
    // EMAIL STUDENT REGARDING NEWLY ASSIGNED LESSON
    public function newLessonAssignedStudent(Request $request){
        try {
            $lesson = $request->all();
            Mail::to($lesson['student']['contacts']['student']['email'])->send(new NewLessonAssignedStudentEmail($lesson));
            return $this->success(null, 'success', 'Caregiver email sent successfully');
        } 
        catch (\Throwable $th) {
            return $this->error(null, 'error', 'Error in sending tutor notification email: ' . $th->getMessage());
        }
    } 
    // EMAIL CAREGIVER(S) REGARDING NEWLY ASSIGNED LESSON
    public function newLessonAssignedCaregiver(Request $request, string $parent){
        try {
            $lesson = $request->all();
            Mail::to($lesson['student']['contacts'][$parent]['email'])->send(new NewLessonAssignedCaregiverEmail($lesson, $parent));
            return $this->success(null, 'success', 'Caregiver email sent successfully');
        } 
        catch (\Throwable $th) {
            return $this->error(null, 'error', 'Error in sending tutor notification email: ' . $th->getMessage());
        }
    }

}
