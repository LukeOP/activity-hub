<?php

namespace App\Models;

use DateTime;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class EventSchoolJob extends Model
{
    use HasFactory;

    protected $table = 'events_school_jobs';

    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'school_id', 'description', 'template_id', 'priority'
    ];


    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $model->{$model->getKeyName()} = Str::uuid()->toString();
        });
    }

    public function calculateDueDateFromPriority(string $eventDate, int $priority)
    {
        $due_date = new DateTime($eventDate);
        switch ($priority) {
            case '1':
                $due_date = new DateTime();
                break;
            case '2':
                $due_date->modify('-12 week');
                break;
            case '3':
                $due_date->modify('-8 week');
                break;
            case '4':
                $due_date->modify('-4 week');
                break;
            case '5':
                $due_date->modify('-3 week');
                break;
            case '6':
                $due_date->modify('-2 week');
                break;
            case '7':
                $due_date->modify('-1 week');
                break;
            case '8':
                $due_date->modify('-5 day');
                break;
            case '9':
                $due_date->modify('-4 day');
                break;
            case '10':
                $due_date->modify('-3 day');
                break;
            case '11':
                $due_date->modify('-2 day');
                break;
            case '12':
                $due_date->modify('-1 day');
                break;
            case '13':
                $due_date->modify('0 day');
                break;
            case '14':
                $due_date->modify('+1 day');
                break;

            default:
                break;
        }
        return $due_date;
    }
}
