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
        if (! Schema::hasTable('students')) {
            Schema::create('students', function (Blueprint $table) {
                $table->string('last_name');
                $table->string('first_name');
                $table->string('id', 36)->primary();
                $table->string('tutor_group')->nullable();
                $table->string('year_level')->nullable();
                $table->timestamp('date_of_birth')->nullable();
                $table->string('gender', 1)->nullable();
                $table->boolean('enrolled_status')->nullable()->default(true);
                $table->string('identifier', 50)->nullable();
                $table->string('school_id', 36)->index('school_id');
                $table->timestamps();
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
        Schema::dropIfExists('students');
    }
};
