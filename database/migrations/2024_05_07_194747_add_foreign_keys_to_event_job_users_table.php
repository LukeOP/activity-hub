<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
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
        Schema::table('event_job_users', function (Blueprint $table) {
            $table->foreign(['user_id'], 'event_job_users_ibfk_1')->references(['id'])->on('users');
            $table->foreign(['event_job_id'], 'event_job_users_ibfk_2')->references(['id'])->on('events_jobs');
        });
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
