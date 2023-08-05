<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Illuminate\Support\Str;

class AvatarController extends Controller
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
        // Validate and process the request here...
        $request->validate([
            'avatar' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // Store the avatar image in the private avatars storage
        $avatarPath = $request->file('avatar')->store('avatars');

        // Save the $avatarPath in the user's record in the database
        // $user = User::user();

        // Return a response or redirect as needed
        return response()->json(['path' => $avatarPath], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $userId)
    {
        // Retrieve the avatar path from the user's record in the database
        $user = User::findOrFail($userId);
        $avatarPath = $user->image;

        // Generate a full path to the avatar file in the private storage
        $relativePath = Str::after($avatarPath, 'avatars/');
        $fullPath = Storage::disk('avatars')->path($relativePath);

        return $fullPath;
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
