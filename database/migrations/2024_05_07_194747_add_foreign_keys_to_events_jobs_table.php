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
        Schema::table('events_jobs', function (Blueprint $table) {
            $table->foreign(['event_id'], 'events_jobs_ibfk_1')->references(['id'])->on('events')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('events_jobs', function (Blueprint $table) {
            $table->dropForeign('events_jobs_ibfk_1');
        });
    }
};
