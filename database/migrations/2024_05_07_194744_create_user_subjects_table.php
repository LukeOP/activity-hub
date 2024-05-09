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
        if (! Schema::hasTable('user_subjects')) {
            Schema::create('user_subjects', function (Blueprint $table) {
                $table->bigInteger('id', true);
                $table->string('user_id', 36)->index('user_id');
                $table->string('school_id', 36)->index('school_id');
                $table->string('subject', 250)->index('subject_id');
                $table->boolean('signup_enabled')->default(true);
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
        Schema::dropIfExists('user_subjects');
    }
};
