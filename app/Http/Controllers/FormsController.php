<?php

namespace App\Http\Controllers;

use App\Http\Resources\HireAgreementResource;
use App\Models\HireAgreementTemplate;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FormsController extends Controller
{
    /* -------------------------------------------------
    HIRE AGREEMENTS
    -------------------------------------------------**/

    public function getHireAgreementTemplatesBySchool($school_id){
        return HireAgreementResource::collection(HireAgreementTemplate::where('school_id', $school_id)->get());
    }
    
    public function createHireAgreementTemplate(Request $request)
    {
        $template = HireAgreementTemplate::create([
            'school_id' => $request->school_id,
            'heading' => $request->heading,
        ]);
        return new HireAgreementResource($template);
    }
}
