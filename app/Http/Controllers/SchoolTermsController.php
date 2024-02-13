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
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
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
    public function show(SchoolTerms $schoolTerms)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(SchoolTerms $schoolTerms)
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
