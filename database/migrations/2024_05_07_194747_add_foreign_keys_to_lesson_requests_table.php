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
        Schema::table('lesson_requests', function (Blueprint $table) {
            $table->foreign(['form_id'], 'lesson_requests_ibfk_1')->references(['id'])->on('lesson_request_forms');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('lesson_requests', function (Blueprint $table) {
            $table->dropForeign('lesson_requests_ibfk_1');
        });
    }
};
