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
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'lesson_requests_ibfk_1' AND table_name = 'lesson_requests'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('lesson_requests', function (Blueprint $table) {
                $table->foreign(['form_id'], 'lesson_requests_ibfk_1')->references(['id'])->on('lesson_request_forms');
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
        Schema::table('lesson_requests', function (Blueprint $table) {
            $table->dropForeign('lesson_requests_ibfk_1');
        });
    }
};
