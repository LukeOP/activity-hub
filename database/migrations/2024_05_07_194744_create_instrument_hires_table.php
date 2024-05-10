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
        if (! Schema::hasTable('instrument_hires')) {
            Schema::create('instrument_hires', function (Blueprint $table) {
                $table->string('id', 36)->primary();
                $table->string('instrument_id', 36)->index('instrument_id');
                $table->string('student_id', 36)->nullable()->index('instrument_hires_ibfk_2');
                $table->timestamp('start_date')->useCurrentOnUpdate()->useCurrent();
                $table->timestamp('return_date')->nullable();
                $table->timestamp('returned_date')->nullable();
                $table->string('upload_id', 36)->nullable();
                $table->text('notes')->nullable();
                $table->timestamp('created_at')->useCurrent();
                $table->timestamp('updated_at')->useCurrentOnUpdate()->useCurrent();
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
        Schema::dropIfExists('instrument_hires');
    }
};
