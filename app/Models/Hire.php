<?php

namespace App\Models;

use App\Http\Resources\InstrumentResource;
use App\Http\Resources\StudentsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Hire extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'instrument_hires';
    protected $fillable = [
        'instrument_id',
        'student_id',
        'start_date',
        'return_date',
        'returned_date',
        'form_signed',
        'upload_id',
        'notes',
    ];

    public function instrument($instrument_id)
    {
        return new InstrumentResource(Instrument::where('id', $instrument_id)->first());
    }

    public function student($student_id)
    {
        return new StudentsResource(Student::where('id', $student_id)->first());
    }
}
