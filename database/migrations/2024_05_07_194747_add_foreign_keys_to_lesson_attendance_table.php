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
        Schema::table('lesson_attendance', function (Blueprint $table) {
            $table->foreign(['user_id'], 'lesson_attendance_ibfk_2')->references(['id'])->on('users');
            $table->foreign(['lesson_id'], 'lesson_attendance_ibfk_3')->references(['id'])->on('lessons');
        });
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
