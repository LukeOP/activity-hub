<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
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
        // Check if foreign key constraints already exist
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'events_school_jobs_templates_ibfk_1' AND table_name = 'events_school_jobs_templates'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('events_school_jobs_templates', function (Blueprint $table) {
                $table->foreign(['school_id'], 'events_school_jobs_templates_ibfk_1')->references(['id'])->on('schools');
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
        Schema::table('events_school_jobs_templates', function (Blueprint $table) {
            $table->dropForeign('events_school_jobs_templates_ibfk_1');
        });
    }
};
