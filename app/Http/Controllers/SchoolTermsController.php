<?php

namespace App\Http\Controllers;

use App\Models\SchoolTerms;
use Illuminate\Http\Request;

class SchoolTermsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return SchoolTerms::get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $newTerms = [];
        foreach ($request->terms as $index => $term) {
            $newTerm = SchoolTerms::create([
                'school_id' => $request->school_id,
                'year' => $request->year,
                'description' => "Term " . ($index + 1),
                'start_date' => $term["startDate"],
                'end_date' => $term["endDate"]
            ]);
            $newTerms = [...$newTerms, $newTerm];
        }
        return $newTerms;
    }

    /**
     * Display the specified resource.
     */
    public function show(SchoolTerms $schoolTerms)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, SchoolTerms $schoolTerms)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SchoolTerms $schoolTerms)
    {
        //
    }
}
