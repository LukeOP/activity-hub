<?php

namespace App\Http\Controllers;

use App\Http\Resources\InstrumentResource;
use App\Models\Instrument;
use App\Models\InstrumentState;
use Illuminate\Http\Request;

class InstrumentsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return InstrumentResource::collection(Instrument::all());
    }

    public function getInstrumentStates()
    {
        return InstrumentState::all();
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
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update($id, Request $request)
    {
        $instrument = Instrument::findOrFail($id);

        $instrument->update($request->all());

        return response()->json(['message' => 'instrument updated successfully', 'instrument' => new InstrumentResource(Instrument::where('id', $instrument['id'])->first())]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Instrument $instrument)
    {
        //
    }
}
