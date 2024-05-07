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
        Schema::create('lesson_request_forms_data', function (Blueprint $table) {
            $table->string('id', 36)->primary();
            $table->string('lesson_request_form_id', 36)->index('lesson_request_form_id');
            $table->string('type', 50);
            $table->string('value', 50);
            $table->boolean('available')->default(true);
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
        Schema::dropIfExists('lesson_request_forms_data');
    }
};
