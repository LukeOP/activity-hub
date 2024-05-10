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
        if (! Schema::hasTable('school_terms')) {
            Schema::create('school_terms', function (Blueprint $table) {
                $table->string('id', 36)->primary();
                $table->string('school_id', 36)->index('school_id');
                $table->string('year', 4);
                $table->string('description', 20);
                $table->date('start_date');
                $table->date('end_date');
                $table->timestamp('created_at')->useCurrent();
                $table->timestamp('updated_at')->useCurrentOnUpdate()->useCurrent();
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
        Schema::dropIfExists('school_terms');
    }
};
