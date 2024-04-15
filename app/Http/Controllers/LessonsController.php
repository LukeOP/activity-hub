<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonsResource;
use App\Models\Lesson;
use App\Models\User;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonsController extends Controller
{
    use HttpResponses;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Get User's List of associated-schools and create an array of school ids
        $user = User::where('id', Auth::user()->id)->first();
        $userSchools = $user->schools;
        $userAdmin = $user->isAdmin->pluck('school_id')->toArray();
        $lessonCollection = new Collection();

        // For each user-associated school check if they have permission to view all lessons 
        // If they do or they are an administrator - get all student lessons for that school
        // Else just get the lessons assigned to the tutor
        foreach ($userSchools as $school) {
            $hasPermission = $user->hasPermissionForSchool($school->id, 'LESSONS_V');

            if ($hasPermission || in_array($school->id, $userAdmin)) {
                $lessonsAtSchool = LessonsResource::collection(Lesson::whereHas('student', function ($query) use ($school) {
                    $query->where('school_id', $school->id);
                })->get());
            } else {
                $lessonsAtSchool = LessonsResource::collection(Lesson::where('user_id', $user->id)->get());
            }
            $lessonCollection = $lessonCollection->concat($lessonsAtSchool);
        }

        // return compiled list of lessons the user has access to
        return $lessonCollection;
    }

    public function getStudentLessons(string $student_id)
    {
        $lessons = Lesson::where('student_id', $student_id)->get();
        return LessonsResource::collection($lessons);
    }

    public function getStudentPastLessons($student_id)
    {
        $lessons = Lesson::onlyTrashed()->where('student_id', $student_id)->get();
        return LessonsResource::collection($lessons);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $lesson = Lesson::create([
                'user_id' => $request->user_id,
                'student_id' => $request->student_id,
                'instrument' => $request->instrument,
                'experience' => $request->experience,
                'funding_type' => $request->funding_type
            ]);
            
            return $this->success(
                new LessonsResource(Lesson::find($lesson->id)),
                'Lesson Assigned',
                'The lesson has been assigned to a tutor.'
            );
        // } catch (Exception) {
        //     return $this->generalError();
        } catch (Exception $e){
            return $this->error($e);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Lesson $lesson)
    {
        // return (count(Auth::user()->isAdmin) < 1 && Auth::user()->isAdmin[0]->id != $lesson->school_id);
        return $this->isNotAuthorized($lesson) ? $this->isNotAuthorized($lesson) : new LessonsResource($lesson);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update($id, Request $request)
    {
        try {
            $lesson = Lesson::findOrFail($id);
    
            $lesson->fill($request->all());
            $lesson->save();
    
            return $this->success(
                new LessonsResource(Lesson::where('id', $lesson['id'])->first()),
                'Lesson Updated Successfully',
                'Lesson details for ' . $lesson->student->first_name . ' have been updated.'
            );
        } catch (ModelNotFoundException $e) {
            return $this->error(
                $e,
                null,
                'Error in updating lesson details',
                404
            );
        } catch (Exception $e){
            return $this->generalError();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Lesson::where('id', $id)->first()->delete();
        return 'Lesson Deleted';
    }

    private function isNotAuthorized(Lesson $lesson)
    {
        if (count(Auth::user()->isAdmin) < 1) {
            if (Auth::user()->id != $lesson->user_id) {
                return $this->authenticationError();
            }
        }
    }
}
