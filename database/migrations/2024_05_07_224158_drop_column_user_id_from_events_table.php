<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // // Check if foreign key constraints already exist
        // $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'events_ibfk_2' AND table_name = 'events'");
        
        // // Drop foreign key constraints
        // if (!empty($hasForeignKey)) {
        //     Schema::table('events', function (Blueprint $table) {
        //         $table->dropForeign('events_ibfk_2');
        //     });
        // }
        
        // Drop column
        Schema::table('events', function (Blueprint $table) {
            $table->dropColumn('user_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Add back the column
        Schema::table('events', function (Blueprint $table) {
            $table->string('user_id', 36)->nullable()->index('user_id');
        });

        // Add back the foreign key constraint
        Schema::table('events', function (Blueprint $table) {
            $table->foreign(['user_id'], 'events_ibfk_2')->references(['id'])->on('users');
        });
    }
};
