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
        if (! Schema::hasTable('lesson_attendance')) {
            Schema::create('lesson_attendance', function (Blueprint $table) {
                $table->string('id', 36)->primary();
                $table->string('lesson_id', 36)->index('lesson_id');
                $table->string('attendance', 50);
                $table->date('date');
                $table->time('time');
                $table->string('user_id', 36)->index('user_id');
                $table->timestamp('created_at')->useCurrent();
                $table->timestamp('updated_at')->useCurrentOnUpdate()->useCurrent();
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
        Schema::dropIfExists('lesson_attendance');
    }
};
