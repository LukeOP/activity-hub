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
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'event_job_users_ibfk_1' AND table_name = 'documents'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('event_job_users', function (Blueprint $table) {
                $table->foreign(['user_id'], 'event_job_users_ibfk_1')->references(['id'])->on('users');
            });
        }
        // Check if foreign key constraints already exist
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'event_job_users_ibfk_2' AND table_name = 'event_job_users'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('event_job_users', function (Blueprint $table) {
                $table->foreign(['event_job_id'], 'event_job_users_ibfk_2')->references(['id'])->on('events_jobs');
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
        Schema::table('event_job_users', function (Blueprint $table) {
            $table->dropForeign('event_job_users_ibfk_1');
            $table->dropForeign('event_job_users_ibfk_2');
        });
    }
};
