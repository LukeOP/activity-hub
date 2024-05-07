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
        Schema::table('lessons', function (Blueprint $table) {
            $table->foreign(['user_id'], 'lessons_ibfk_1')->references(['id'])->on('users');
            $table->foreign(['student_id'], 'lessons_ibfk_2')->references(['id'])->on('students');
        });
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
