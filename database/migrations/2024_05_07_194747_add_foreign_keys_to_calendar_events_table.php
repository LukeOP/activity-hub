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
        Schema::table('calendar_events', function (Blueprint $table) {
            $table->foreign(['school_id'], 'calendar_events_ibfk_1')->references(['id'])->on('schools');
            $table->foreign(['user_id'], 'calendar_events_ibfk_2')->references(['id'])->on('users');
        });
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
