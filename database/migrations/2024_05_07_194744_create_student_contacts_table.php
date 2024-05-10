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
        if (! Schema::hasTable('student_contacts')) {
            Schema::create('student_contacts', function (Blueprint $table) {
                $table->bigIncrements('id');
                $table->string('student_id', 36)->index('student_id');
                $table->string('student_mobile', 20)->nullable();
                $table->string('student_email', 50)->nullable();
                $table->string('pc_name', 100)->nullable();
                $table->string('pc_relationship', 50)->nullable();
                $table->string('pc_mobile', 20)->nullable();
                $table->string('pc_email', 50)->nullable();
                $table->string('sc_name', 100)->nullable();
                $table->string('sc_relationship', 50)->nullable();
                $table->string('sc_mobile', 20)->nullable();
                $table->string('sc_email', 50)->nullable();
                $table->timestamp('updated_at')->useCurrentOnUpdate()->useCurrent();
                $table->timestamp('created_at')->useCurrent();
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
        Schema::dropIfExists('student_contacts');
    }
};
