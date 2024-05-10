<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Check if foreign key constraints already exist
        $hasSchoolForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'calendar_events_ibfk_1' AND table_name = 'calendar_events'");
        $hasUserForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'calendar_events_ibfk_2' AND table_name = 'calendar_events'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasSchoolForeignKey)) {
            Schema::table('calendar_events', function (Blueprint $table) {
                $table->foreign(['school_id'], 'calendar_events_ibfk_1')->references(['id'])->on('schools');
            });
        }

        if (empty($hasUserForeignKey)) {
            Schema::table('calendar_events', function (Blueprint $table) {
                $table->foreign(['user_id'], 'calendar_events_ibfk_2')->references(['id'])->on('users');
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('calendar_events', function (Blueprint $table) {
            $table->dropForeign('calendar_events_ibfk_1');
            $table->dropForeign('calendar_events_ibfk_2');
        });
    }
};
