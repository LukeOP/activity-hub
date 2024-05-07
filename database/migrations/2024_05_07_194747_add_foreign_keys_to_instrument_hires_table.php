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
        Schema::table('instrument_hires', function (Blueprint $table) {
            $table->foreign(['student_id'], 'instrument_hires_ibfk_2')->references(['id'])->on('students')->onDelete('SET NULL');
            $table->foreign(['instrument_id'], 'instrument_hires_ibfk_3')->references(['id'])->on('instruments');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('instrument_hires', function (Blueprint $table) {
            $table->dropForeign('instrument_hires_ibfk_2');
            $table->dropForeign('instrument_hires_ibfk_3');
        });
    }
};
