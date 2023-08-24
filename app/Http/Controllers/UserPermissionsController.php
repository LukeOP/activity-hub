<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserPermissionsResource;
use App\Models\UserPermission;
use Illuminate\Http\Request;

class UserPermissionsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return UserPermission::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (UserPermission::where([
            ['school_id', $request->school_id],
            ['user_id', $request->user_id],
            ['permission_type', $request->permission_type],
        ])->first()) {
            return 'Permission already exists';
        }

        $permission = UserPermission::create([
            'school_id' => $request->school_id,
            'user_id' => $request->user_id,
            'permission_type' => $request->permission_type
        ]);

        return new UserPermissionsResource($permission);
    }

    /**
     * Display the specified resource.
     */
    public function show(UserPermission $userPermission)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(UserPermission $userPermission)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, UserPermission $userPermission)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $permission = UserPermission::where('id', $id)->first();
        return $permission->delete() ? [
            'message' => 'successfully deleted',
            'permission' => new UserPermissionsResource($permission)
        ] : 'deletion failed';
    }
}
