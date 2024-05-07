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
        Schema::table('instruments', function (Blueprint $table) {
            $table->foreign(['school_id'], 'instruments_ibfk_1')->references(['id'])->on('schools');
            $table->foreign(['state_id'], 'instruments_ibfk_2')->references(['id'])->on('instrument_states');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('instruments', function (Blueprint $table) {
            $table->dropForeign('instruments_ibfk_1');
            $table->dropForeign('instruments_ibfk_2');
        });
    }
};
