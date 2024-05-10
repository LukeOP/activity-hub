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
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'lessons_ibfk_1' AND table_name = 'lessons'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('lessons', function (Blueprint $table) {
                $table->foreign(['user_id'], 'lessons_ibfk_1')->references(['id'])->on('users');
            });
        }
        // Check if foreign key constraints already exist
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'lessons_ibfk_2' AND table_name = 'lessons'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('lessons', function (Blueprint $table) {
                $table->foreign(['student_id'], 'lessons_ibfk_2')->references(['id'])->on('students');
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
        Schema::table('lessons', function (Blueprint $table) {
            $table->dropForeign('lessons_ibfk_1');
            $table->dropForeign('lessons_ibfk_2');
        });
    }
};
