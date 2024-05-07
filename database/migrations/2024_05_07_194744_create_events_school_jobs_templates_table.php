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
        Schema::create('events_school_jobs_templates', function (Blueprint $table) {
            $table->string('id', 36)->primary();
            $table->string('heading', 100);
            $table->string('description', 200)->nullable();
            $table->text('notes')->nullable();
            $table->string('school_id', 36)->index('school_id');
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
        Schema::dropIfExists('events_school_jobs_templates');
    }
};
