<?php

namespace App\Models;

use DateTime;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class EventSchoolJob extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'events_school_jobs';


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

        // Calculate the number of days to subtract based on priority
        $daysToSubtract = 0;
        if ($priority >= 2 && $priority <= 14) {
            $daysToSubtract = ($priority - 1) * 7; // 7 days per week
        }

        // Subtract the calculated number of days from the event date
        $due_date->modify("-$daysToSubtract days");

        return $due_date;

        // $due_date = new DateTime($eventDate);
        // switch ($priority) {
        //     case '1':
        //         $due_date = new DateTime();
        //         break;
        //     case '2':
        //         $due_date = date('Y-m-d', strtotime("-12 week"));
        //         break;
        //     case '3':
        //         $due_date = date('Y-m-d', strtotime("-8 week"));
        //         break;
        //     case '4':
        //         $due_date = date('Y-m-d', strtotime("-4 week"));
        //         break;
        //     case '5':
        //         $due_date = date('Y-m-d', strtotime("-3 week"));
        //         break;
        //     case '6':
        //         $due_date = date('Y-m-d', strtotime("-2 week"));
        //         break;
        //     case '7':
        //         $due_date = date('Y-m-d', strtotime("-1 week"));
        //         break;
        //     case '8':
        //         $due_date = date('Y-m-d', strtotime("-5 day"));
        //         break;
        //     case '9':
        //         $due_date = date('Y-m-d', strtotime("-4 day"));
        //         break;
        //     case '10':
        //         $due_date = date('Y-m-d', strtotime("-3 day"));
        //         break;
        //     case '11':
        //         $due_date = date('Y-m-d', strtotime("-2 day"));
        //         break;
        //     case '12':
        //         $due_date = date('Y-m-d', strtotime("-1 day"));
        //         break;
        //     case '13':
        //         $due_date = date('Y-m-d', strtotime("0 day"));
        //         break;
        //     case '14':
        //         $due_date = date('Y-m-d', strtotime("+1 day"));
        //         break;

        //     default:
        //         break;
        // }
        // return $due_date;
    }
}
