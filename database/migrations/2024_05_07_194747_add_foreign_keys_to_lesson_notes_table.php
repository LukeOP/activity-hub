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
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'lesson_notes_ibfk_1' AND table_name = 'lesson_notes'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('lesson_notes', function (Blueprint $table) {
                $table->foreign(['attendance_id'], 'lesson_notes_ibfk_1')->references(['id'])->on('lesson_attendance');
            });
        }
        // Check if foreign key constraints already exist
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'lesson_notes_ibfk_2' AND table_name = 'lesson_notes'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('lesson_notes', function (Blueprint $table) {
                $table->foreign(['lesson_id'], 'lesson_notes_ibfk_2')->references(['id'])->on('lessons');
            });
        }
        // Check if foreign key constraints already exist
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'lesson_notes_ibfk_3' AND table_name = 'lesson_notes'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('lesson_notes', function (Blueprint $table) {
                $table->foreign(['user_id'], 'lesson_notes_ibfk_3')->references(['id'])->on('users');
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
        Schema::table('lesson_notes', function (Blueprint $table) {
            $table->dropForeign('lesson_notes_ibfk_1');
            $table->dropForeign('lesson_notes_ibfk_3');
            $table->dropForeign('lesson_notes_ibfk_2');
        });
    }
};
