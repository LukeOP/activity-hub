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
        Schema::create('lesson_requests', function (Blueprint $table) {
            $table->string('id', 36)->primary();
            $table->string('student_name', 200);
            $table->string('student_email', 50)->nullable();
            $table->string('student_phone', 20)->nullable();
            $table->integer('student_age')->nullable();
            $table->string('student_year', 10)->nullable();
            $table->string('parent_name', 200)->nullable();
            $table->string('parent_phone', 25)->nullable();
            $table->string('parent_email', 50)->nullable();
            $table->string('requested_instrument', 50);
            $table->text('experience')->nullable();
            $table->string('requested_tutor', 50)->nullable();
            $table->string('funding_type', 20)->nullable()->default('Private');
            $table->string('status', 20)->default('Awaiting Review');
            $table->string('form_id', 36)->nullable()->index('form_id');
            $table->string('school_id', 36);
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
        Schema::dropIfExists('lesson_requests');
    }
};
