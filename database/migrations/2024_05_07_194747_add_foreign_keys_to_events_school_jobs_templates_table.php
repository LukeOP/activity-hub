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
        Schema::table('events_school_jobs_templates', function (Blueprint $table) {
            $table->foreign(['school_id'], 'events_school_jobs_templates_ibfk_1')->references(['id'])->on('schools');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('events_school_jobs_templates', function (Blueprint $table) {
            $table->dropForeign('events_school_jobs_templates_ibfk_1');
        });
    }
};
