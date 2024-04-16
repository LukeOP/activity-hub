<?php

namespace App\Models;

use App\Http\Resources\HireAgreementResource;
use App\Http\Resources\InstrumentResource;
use App\Http\Resources\StudentsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Hire extends Model
{
    use HasFactory;
    use SoftDeletes;

    public $incrementing = false;
    protected $keyType = 'string';

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $model->{$model->getKeyName()} = Str::uuid()->toString();
        });
    }

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

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function instrument($instrument_id)
    {
        return new InstrumentResource(Instrument::where('id', $instrument_id)->first());
    }

    public function getStudent($student_id)
    {
        return new StudentsResource(Student::where('id', $student_id)->first());
    }

    public function getHireAgreement($upload_id)
    {
        return new HireAgreementResource(Document::where('id', $upload_id)->first());
    }
}
