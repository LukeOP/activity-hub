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
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'lesson_attendance_ibfk_2' AND table_name = 'lesson_attendance'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('lesson_attendance', function (Blueprint $table) {
                $table->foreign(['user_id'], 'lesson_attendance_ibfk_2')->references(['id'])->on('users');
            });
        }
        // Check if foreign key constraints already exist
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'lesson_attendance_ibfk_3' AND table_name = 'lesson_attendance'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('lesson_attendance', function (Blueprint $table) {
                $table->foreign(['lesson_id'], 'lesson_attendance_ibfk_3')->references(['id'])->on('lessons');
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
        Schema::table('lesson_attendance', function (Blueprint $table) {
            $table->dropForeign('lesson_attendance_ibfk_2');
            $table->dropForeign('lesson_attendance_ibfk_3');
        });
    }
};
