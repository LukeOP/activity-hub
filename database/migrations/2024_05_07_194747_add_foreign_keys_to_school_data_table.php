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
        Schema::table('school_data', function (Blueprint $table) {
            $table->foreign(['school_id'], 'school_data_ibfk_1')->references(['id'])->on('schools');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('school_data', function (Blueprint $table) {
            $table->dropForeign('school_data_ibfk_1');
        });
    }
};
