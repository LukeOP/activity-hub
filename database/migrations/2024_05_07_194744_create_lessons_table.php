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
        if (! Schema::hasTable('lessons')) {
            Schema::create('lessons', function (Blueprint $table) {
                $table->string('id', 36)->primary();
                $table->string('user_id', 36)->index('user_id');
                $table->string('student_id', 36)->index('student_id');
                $table->string('instrument', 50);
                $table->time('start')->nullable();
                $table->time('end')->nullable();
                $table->string('day', 10)->nullable();
                $table->date('start_date')->nullable();
                $table->date('end_date')->nullable();
                $table->string('funding_type')->nullable();
                $table->boolean('term_link')->default(true);
                $table->double('fee', 8, 2)->nullable();
                $table->string('status')->default('Pending');
                $table->text('experience')->nullable();
                $table->timestamps();
                $table->softDeletes();
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
        Schema::dropIfExists('lessons');
    }
};
