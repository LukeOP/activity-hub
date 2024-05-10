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
        $hasForeignKey = DB::select("SELECT 1 FROM information_schema.table_constraints WHERE constraint_name = 'user_school_invitations_ibfk_1' AND table_name = 'user_school_invitations'");
        
        // Add foreign key constraints if they do not already exist
        if (empty($hasForeignKey)) {
            Schema::table('user_school_invitations', function (Blueprint $table) {
                $table->foreign(['school_id'], 'user_school_invitations_ibfk_1')->references(['id'])->on('schools');
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
        Schema::table('user_school_invitations', function (Blueprint $table) {
            $table->dropForeign('user_school_invitations_ibfk_1');
        });
    }
};
