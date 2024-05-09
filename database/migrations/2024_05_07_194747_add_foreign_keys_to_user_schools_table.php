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
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'user_schools_ibfk_1' AND table_name = 'user_schools'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('user_schools', function (Blueprint $table) {
                $table->foreign(['school_id'], 'user_schools_ibfk_1')->references(['id'])->on('schools');
            });
        }
        // Check if foreign key constraints already exist
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'user_schools_ibfk_2' AND table_name = 'user_schools'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('user_schools', function (Blueprint $table) {
                $table->foreign(['user_id'], 'user_schools_ibfk_2')->references(['id'])->on('users');
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
        Schema::table('user_schools', function (Blueprint $table) {
            $table->dropForeign('user_schools_ibfk_1');
            $table->dropForeign('user_schools_ibfk_2');
        });
    }
};
