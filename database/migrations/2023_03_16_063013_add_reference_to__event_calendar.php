<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('calendar_events', function (Blueprint $table) {
            $table->string('reference_type');
            $table->integer('reference_type_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('calendar_envents', function (Blueprint $table) {
            $table->dropColumn('reference_type');
            $table->dropColumn('reference_type_id');
        });
    }
};
