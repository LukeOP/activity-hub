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
        Schema::create('lesson_notes', function (Blueprint $table) {
            $table->string('id', 36)->primary();
            $table->string('lesson_id', 36)->index('lesson_id');
            $table->string('user_id', 36)->index('user_id');
            $table->string('attendance_id', 36)->index('attendance_id');
            $table->text('planning_comment')->nullable();
            $table->text('progress_comment')->nullable();
            $table->text('next_steps_comment')->nullable();
            $table->text('general_comment')->nullable();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrentOnUpdate()->useCurrent();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lesson_notes');
    }
};
