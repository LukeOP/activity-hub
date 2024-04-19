<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonRequestFormResource;
use App\Http\Resources\LessonRequestResource;
use App\Models\LessonRequest;
use App\Models\LessonRequestForm;
use App\Models\User;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonRequestsController extends Controller
{
    use HttpResponses;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            // Get User's List of associated-schools and create an array of school ids
            $user = User::where('id', Auth::user()->id)->first();
            $userSchools = $user->schools;
            $userAdmin = $user->isAdmin->pluck('school_id')->toArray();
            $requestCollection = new Collection();
    
            // For each user-associated school check if they have permission to view all lesson requests 
            // If they do or they are an administrator - get all student lesson requests for that school
            foreach ($userSchools as $school) {
                $hasPermission = $user->hasPermissionForSchool($school->id, 'LESSON_REQ_V');
    
                if ($hasPermission || in_array($school->id, $userAdmin)) {
                    $requestsForSchool = LessonRequestResource::collection(
                        LessonRequest::where('school_id', $school->id)
                               ->orderBy('created_at')
                               ->get());
                }
                $requestCollection = $requestCollection->concat($requestsForSchool);
            }
            // return compiled list of lesson requests the user has access to
            return $this->success($requestCollection, 'Lesson requests Found');
        }
        catch (Exception $e){
            return $this->generalError($e);
        }
    }

    /**
     * Display a listing of Request Forms
     */
    public function indexOfRequestFormsForSchool(string $school_id)
    {
        return LessonRequestFormResource::collection(LessonRequestForm::where('school_id', $school_id)->get());
    }

    /**
     * Display a specific form resource from id
     */
    public function getFormById(string $form_id)
    {
        return new LessonRequestFormResource(LessonRequestForm::where('id', $form_id)->first());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function createFromPublicForm(Request $request)
    {
        try {
            $lessonRequest = LessonRequest::create([
                'student_name' => $request->student_name,
                'student_email' => $request->student_email,
                'student_phone' => $request->student_phone,
                'student_age' => $request->student_age,
                'student_year' => $request->student_year,
                'parent_name' => $request->parent_name,
                'parent_email' => $request->parent_email,
                'parent_phone' => $request->parent_phone,
                'requested_instrument' => $request->instrument,
                'experience' => $request->experience,
                'requested_tutor' => $request->tutor,
                'funding_type' => $request->funding_type,
                'school_id' => $request->school_id,
                'form_id' => $request->form_id
            ]);

            return $this->success(
                new LessonRequestResource($lessonRequest),
                'Request Submitted',
                'Your lesson request has been submitted.'
            );
        } catch (Exception $e) {
            return $this->error($e);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $lessonRequest = LessonRequest::create([
            'student_name' => $request->student_name,
            'student_email' => $request->student_email,
            'student_phone' => $request->student_phone,
            'student_age' => $request->student_age,
            'student_year' => $request->student_year,
            'parent_name' => $request->parent_name,
            'parent_phone' => $request->parent_phone,
            'parent_email' => $request->parent_email,
            'requested_instrument' => $request->requested_instrument,
            'experience' => $request->experience,
            'requested_tutor' => $request->requested_tutor,
            'funding_type' => $request->funding_type,
            'school_id' => $request->school_id,
        ]);

        return new LessonRequestResource($lessonRequest);
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
        LessonRequest::where('id', $id)->first()->delete();
        return ['success', 'Lesson Request Deleted', 'The Lesson Request has been Deleted'];
    }
}
