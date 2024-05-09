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
        if (! Schema::hasTable('events_school_jobs')) {
            Schema::create('events_school_jobs', function (Blueprint $table) {
                $table->string('id', 36)->primary();
                $table->string('description', 150);
                $table->string('template_id', 36)->index('events_school_jobs_ibfk_2');
                $table->integer('priority');
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
        Schema::dropIfExists('events_school_jobs');
    }
};
