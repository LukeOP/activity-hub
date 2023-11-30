<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonsResource;
use App\Http\Resources\SchoolsResource;
use App\Models\Lesson;
use App\Models\LessonNotes;
use App\Models\User;
use App\Traits\HttpResponses;
use Illuminate\Database\Eloquent\Collection;
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
        $user = Auth::user();
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

        $lesson = Lesson::create([
            'user_id' => $request->tutor,
            'student_id' => $request->student,
            'instrument' => $request->instrument,
            'experience' => $request->experience,
        ]);

        return new LessonsResource($lesson);
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
        $lesson = Lesson::findOrFail($id);

        $lesson->fill($request->all());
        $lesson->save();

        return response()->json(['message' => 'lesson updated successfully', 'lesson' => new LessonsResource(Lesson::where('id', $lesson['id'])->first())]);
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
                return $this->error('', 'You are not authorized to make this request', 403);
            }
        }
    }
}
