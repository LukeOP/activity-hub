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
        if (! Schema::hasTable('calendar_events')) {
            Schema::create('calendar_events', function (Blueprint $table) {
                $table->bigIncrements('id');
                $table->string('school_id', 36)->index('school_id');
                $table->string('user_id', 36)->index('calendar_events_user_id_foreign');
                $table->string('title')->nullable();
                $table->date('start')->nullable();
                $table->date('end')->nullable();
                $table->boolean('allDay')->nullable();
                $table->string('className')->nullable();
                $table->string('reference_type');
                $table->integer('reference_type_id');
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
        Schema::dropIfExists('calendar_events');
    }
};
