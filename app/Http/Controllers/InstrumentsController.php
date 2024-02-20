<?php

namespace App\Http\Controllers;

use App\Http\Resources\InstrumentResource;
use App\Models\Instrument;
use App\Models\InstrumentState;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class InstrumentsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = User::where('id', Auth::user()->id)->first();
        // $user = Auth::user();
        $userSchools = $user->schools;
        $userAdmin = $user->isAdmin->pluck('school_id')->toArray();
        $instrumentCollection = new Collection();

        foreach ($userSchools as $school) {
            $hasPermission = $user->hasPermissionForSchool($school->id, 'INSTRUMENTS_V');

            if ($hasPermission || in_array($school->id, $userAdmin)) {
                $instrumentsAtSchool = InstrumentResource::collection(Instrument::where('school_id', $school->id)->get());
                $instrumentCollection = $instrumentCollection->concat($instrumentsAtSchool);
            }
        }

        return $instrumentCollection;
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
        $instrument = Instrument::create([
            'name' => $request->name,
            'type' => $request->type,
            'family' => $request->family,
            'school_id' => $request->school,
            'state_id' => $request->state_id,
            'fee' => $request->fee
        ]);

        return new InstrumentResource($instrument);
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

        return response()->json([
            'message' => 'instrument updated successfully',
            'instrument' => new InstrumentResource(Instrument::where('id', $instrument['id'])->first())
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Instrument $instrument)
    {
        //
    }
}
