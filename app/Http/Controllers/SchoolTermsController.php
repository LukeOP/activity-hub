<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreSchoolTermsRequest;
use App\Http\Resources\SchoolsResource;
use App\Models\School;
use App\Models\SchoolTerms;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Http\Request;

class SchoolTermsController extends Controller
{
    use HttpResponses;
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
    public function store(StoreSchoolTermsRequest $request)
    {  
        $newTerms = [];
        $created = 0;
        try {
            foreach ($request->terms as $index => $term) {
                $existing = SchoolTerms::where('description', "Term " . ($index + 1))->where('year', $request->year)->first();
                if($existing != NULL){
                    $existing->update([
                        'start_date' => $term["start_date"],
                        'end_date' => $term["end_date"]
                    ]);
                    $newTerm = $existing;
                } else {
                    $newTerm = SchoolTerms::create([
                        'school_id' => $request->school_id,
                        'year' => $request->year,
                        'description' => "Term " . ($index + 1),
                        'start_date' => $term["start_date"],
                        'end_date' => $term["end_date"]
                    ]);
                    $created++;
                }
                $newTerms = [...$newTerms, $newTerm];
            }
            $school = new SchoolsResource(School::where('id', $newTerms[0]->school_id)->first());
            $status = $created == 0 ? 200 : 201;
            return $this->success(
                $school,
                'Terms Updated',
                'Term dates updated for ' . $request->year . ".",
                $status
            );
        } catch (Exception $e){
            return $this->error(
                $e->getMessage(),
                null,
                'Error encounted while adding term dates.',
                500
            );
        }
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
