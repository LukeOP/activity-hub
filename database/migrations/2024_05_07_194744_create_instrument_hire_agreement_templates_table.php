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
        Schema::create('instrument_hire_agreement_templates', function (Blueprint $table) {
            $table->string('id', 36)->primary();
            $table->string('school_id', 36)->index('school_id');
            $table->string('heading', 100);
            $table->string('description')->nullable();
            $table->text('notes')->nullable();
            $table->integer('header_content');
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
        Schema::dropIfExists('instrument_hire_agreement_templates');
    }
};
