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
        Schema::table('lesson_notes', function (Blueprint $table) {
            $table->foreign(['attendance_id'], 'lesson_notes_ibfk_1')->references(['id'])->on('lesson_attendance');
            $table->foreign(['user_id'], 'lesson_notes_ibfk_3')->references(['id'])->on('users');
            $table->foreign(['lesson_id'], 'lesson_notes_ibfk_2')->references(['id'])->on('lessons');
        });
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
