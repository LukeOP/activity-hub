<?php

namespace App\Http\Controllers;

use App\Http\Resources\HireResource;
use App\Http\Resources\HiresResource;
use App\Models\Hire;
use App\Models\Instrument;
use App\Models\User;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HiresController extends Controller
{
    use HttpResponses;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = User::where('id', Auth::user()->id)->first();
        $userSchools = $user->schools;
        $userAdmin = $user->isAdmin->pluck('school_id')->toArray();
        $hireCollection = new Collection();

        // Iterate through each school to check permissions and hires
        foreach ($userSchools as $school) {

            // Check if user has permission to access hire data for this school
            $hasPermission = $user->hasPermissionForSchool($school->id, 'HIRES_V');

            // If permission is valid, get hires from that school
            if ($hasPermission || in_array($school->id, $userAdmin)) {
                $hiresAtSchool = HiresResource::collection(
                    Hire::whereHas('student', function ($query) use ($school) {
                        $query->where('school_id', $school->id);
                    })->get()
                );
            }

            $hireCollection = $hireCollection->concat($hiresAtSchool);
        }

        return $hireCollection;
    }

    public function getStudentHires(string $student_id)
    {
        $hires = Hire::where('student_id', $student_id)->get();
        return HiresResource::collection($hires);
    }

    public function getStudentPastHires(string $student_id)
    {
        $hires = Hire::onlyTrashed()->where('student_id', $student_id)->get();
        return HiresResource::collection($hires);
    }

    public function getInstrumentHires(int $instrument_id)
    {
        $hires = Hire::where('instrument_id', $instrument_id)->get();
        return HiresResource::collection($hires);
    }

    public function getInstrumentPastHires(int $instrument_id)
    {
        $hires = Hire::onlyTrashed()->where('instrument_id', $instrument_id)->get();
        return HiresResource::collection($hires);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $hire = Hire::create([
                'instrument_id' => $request->instrument,
                'student_id' => $request->student,
                'start_date' => $request->start,
                'return_date' => $request->end,
                'notes' => $request->notes,
            ]);
    
            Instrument::where('id', $request->instrument)->first()->update(['state_id' => 4]);
            return $this->success(
                new HiresResource($hire),
                'Instrument Hire Created',
                'The instrument has been successfully hired out'
            );
        }
        catch (ModelNotFoundException $e){
            return $this->error($e, 'Error During Hire Creation', 'The instrument record could not be found', 404);
        } 
        catch (Exception $e){
            return $this->generalError($e);
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
        $hire = Hire::findOrFail($id);

        $hire->update($request->all());

        return response()->json([
            'message' => 'hire updated successfully',
            'hire' => new HiresResource(Hire::where('id', $hire['id'])->first())
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Hire::where('id', $id)->first()->delete();
        return 'Hire completed';
    }
}
