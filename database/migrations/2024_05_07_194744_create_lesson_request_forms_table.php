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
        Schema::create('lesson_request_forms', function (Blueprint $table) {
            $table->string('id', 36)->primary();
            $table->string('school_id', 36)->index('school_id');
            $table->string('description', 100)->nullable();
            $table->integer('year')->nullable();
            $table->boolean('logo_cb')->nullable()->default(false);
            $table->string('logo', 150)->nullable();
            $table->boolean('school_name_cb')->nullable()->default(false);
            $table->boolean('header_content_cb')->nullable()->default(false);
            $table->text('header_content')->nullable();
            $table->boolean('heading_cb')->nullable()->default(false);
            $table->string('heading', 150)->nullable();
            $table->boolean('contact_content_cb')->nullable()->default(false);
            $table->text('contact_content')->nullable();
            $table->boolean('student_name_cb')->nullable()->default(false);
            $table->string('student_name', 150)->default('Student Name');
            $table->boolean('student_email_cb')->nullable()->default(false);
            $table->string('student_email', 150)->default('Student Email');
            $table->boolean('student_phone_cb')->nullable()->default(false);
            $table->string('student_phone', 150)->default('Student Phone Number');
            $table->boolean('student_year_cb')->nullable()->default(false);
            $table->string('student_year', 150)->default('Student year Level');
            $table->boolean('student_age_cb')->nullable()->default(false);
            $table->string('student_age', 150)->default('Student Age');
            $table->boolean('pc_name_cb')->nullable()->default(false);
            $table->string('pc_name', 150)->default('Parent / Caregiver Name');
            $table->boolean('pc_phone_cb')->nullable()->default(false);
            $table->string('pc_phone', 150)->default('Parent / Caregiver Phone Number');
            $table->boolean('pc_email_cb')->nullable()->default(false);
            $table->string('pc_email', 150)->default('Parent / Caregiver Email');
            $table->boolean('lesson_content_cb')->nullable()->default(false);
            $table->text('lesson_content')->nullable();
            $table->boolean('instrument_cb')->nullable()->default(false);
            $table->string('instrument', 50)->default('Instrument');
            $table->boolean('tutor_cb')->nullable()->default(false);
            $table->string('tutor', 150)->default('Tutor')->index('tutor');
            $table->boolean('funding_type_cb')->nullable()->default(false);
            $table->string('funding_type', 150)->default('Funding Type');
            $table->boolean('experience_cb')->nullable()->default(false);
            $table->text('experience');
            $table->boolean('footer_content_cb')->nullable()->default(false);
            $table->text('footer_content')->nullable();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrentOnUpdate()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lesson_request_forms');
    }
};
