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
        if (! Schema::hasTable('user_school_invitations')) {
            Schema::create('user_school_invitations', function (Blueprint $table) {
                $table->bigInteger('id', true);
                $table->string('school_id', 36)->index('school_id');
                $table->string('reference', 100);
                $table->string('email', 100);
                $table->string('code', 36);
                $table->timestamp('created_at')->useCurrent();
                $table->timestamp('updated_at')->useCurrentOnUpdate()->useCurrent();
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
        Schema::dropIfExists('user_school_invitations');
    }
};
