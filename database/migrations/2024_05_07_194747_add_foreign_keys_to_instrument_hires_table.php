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
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'instrument_hires_ibfk_2' AND table_name = 'instrument_hires'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('instrument_hires', function (Blueprint $table) {
                $table->foreign(['student_id'], 'instrument_hires_ibfk_2')->references(['id'])->on('students')->onDelete('SET NULL');
            });
        }
        // Check if foreign key constraints already exist
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'instrument_hires_ibfk_3' AND table_name = 'instrument_hires'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('instrument_hires', function (Blueprint $table) {
                $table->foreign(['instrument_id'], 'instrument_hires_ibfk_3')->references(['id'])->on('instruments');
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
        Schema::table('instrument_hires', function (Blueprint $table) {
            $table->dropForeign('instrument_hires_ibfk_2');
            $table->dropForeign('instrument_hires_ibfk_3');
        });
    }
};
