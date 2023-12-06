<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentContacts extends Model
{
    use HasFactory;

    protected $table = 'student_contacts';
    protected $fillable = [
        'student_id',
        'student_mobile',
        'student_email',
        'pc_name',
        'pc_relationship',
        'pc_mobile',
        'pc_email',
        'sc_name',
        'sc_relationship',
        'sc_mobile',
        'sc_email',
    ];
}
