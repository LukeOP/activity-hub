<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonsResource;
use App\Models\Lesson;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // User is not an admin
        if (count(Auth::user()->isAdmin) < 1) {
            return LessonsResource::collection(
                Lesson::where('user_id', Auth::user()->id)->get()
            );
        } else {
            return LessonsResource::collection(
                // Lesson::whereHas('student', fn ($query) => $query->where('school_id', Auth::user()->isAdmin[0]->id))->get()
                Lesson::whereHas('student', fn ($query) =>
                $query->where('school_id', Auth::user()->isAdmin[0]->id)
                    ->orWhere('user_id', Auth::user()->id))
                    ->get()
            );
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
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
    public function update(Request $request, string $id)
    {
        //
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
