<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonsResource;
use App\Http\Resources\SchoolsResource;
use App\Models\Lesson;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();
        $userSchools = $user->schools;
        $userAdmin = $user->isAdmin->pluck('school_id')->toArray();
        $lessonCollection = new Collection();

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

        return $lessonCollection;


        // User is not an admin
        // if (!$user->isAdmin) {
        //     return LessonsResource::collection(
        //         Lesson::where('user_id', $user->id)->get()
        //     );
        // } else {
        //     $schoolIds = $user->isAdmin->pluck('school_id')->toArray();

        //     return LessonsResource::collection(
        //         Lesson::where(function ($query) use ($schoolIds, $user) {
        //             $query->whereHas('student', function ($query) use ($schoolIds) {
        //                 $query->whereIn('school_id', $schoolIds);
        //             })->orWhere('user_id', $user->id);
        //         })->get()
        //     );
        // }
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
        //
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
