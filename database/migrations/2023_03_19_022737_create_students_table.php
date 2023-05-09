<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->string('sms_identifier')->nullable();
            $table->string('first_name');
            $table->string('last_name');
            $table->string('tutor_group')->nullable();
            $table->string('year_level')->nullable();
            $table->string('gender')->nullable();
            $table->string('enrolled_status')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('students');
    }
};
