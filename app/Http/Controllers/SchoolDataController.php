<?php

namespace App\Http\Controllers;

use App\Models\SchoolData;
use Illuminate\Http\Request;

class SchoolDataController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }


    public function store(Request $request)
    {
        $data = SchoolData::create([
            'school_id' => $request->school_id,
            'type' => $request->type,
            'value' => $request->value,
        ]);

        return $data;
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
        return SchoolData::where('id', $id)->first()->delete();
    }
}
