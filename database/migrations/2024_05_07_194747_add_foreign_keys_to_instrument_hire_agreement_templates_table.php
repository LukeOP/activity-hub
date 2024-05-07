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
        Schema::table('instrument_hire_agreement_templates', function (Blueprint $table) {
            $table->foreign(['school_id'], 'instrument_hire_agreement_templates_ibfk_1')->references(['id'])->on('schools');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('instrument_hire_agreement_templates', function (Blueprint $table) {
            $table->dropForeign('instrument_hire_agreement_templates_ibfk_1');
        });
    }
};
