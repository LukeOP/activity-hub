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
        if (! Schema::hasTable('lesson_request_forms_inputs')) {
            Schema::create('lesson_request_forms_inputs', function (Blueprint $table) {
                $table->string('id', 36)->primary();
                $table->string('lesson_request_form_id', 36);
                $table->boolean('school_name')->default(false);
                $table->boolean('logo')->default(false);
                $table->boolean('student_name')->default(false);
                $table->boolean('student_email')->default(false);
                $table->boolean('student_phone')->nullable()->default(false);
                $table->boolean('student_year')->default(false);
                $table->boolean('student_age')->default(false);
                $table->boolean('pc_name')->default(false);
                $table->boolean('pc_phone')->default(false);
                $table->boolean('pc_email')->default(false);
                $table->boolean('instrument')->default(false);
                $table->boolean('tutor')->default(false);
                $table->boolean('type')->default(false);
                $table->boolean('experience')->default(false);
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
        Schema::dropIfExists('lesson_request_forms_inputs');
    }
};
