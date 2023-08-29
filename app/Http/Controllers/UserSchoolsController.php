<?php

namespace App\Http\Controllers;

use App\Models\UserSchool;
use Illuminate\Http\Request;

class UserSchoolsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $userSchoolConnection = UserSchool::create([
            'user_id' => $request->user_id,
            'school_id' => $request->school_id
        ]);
        if ($userSchoolConnection) {
            return ['message' => 'success', 'result' => $userSchoolConnection];
        } else {
            return ['message' => 'error: User School Connection Not Created'];
        }
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
        //
    }
}
