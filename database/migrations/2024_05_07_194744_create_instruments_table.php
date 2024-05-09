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
        if (! Schema::hasTable('instruments')) {
            Schema::create('instruments', function (Blueprint $table) {
                $table->string('id', 36)->primary();
                $table->string('name', 100);
                $table->string('type', 20);
                $table->string('family', 20)->nullable();
                $table->text('notes')->nullable();
                $table->string('school_id', 36)->default('ef42838a-ddb6-11ee-a36a-c209c825a6f4')->index('school_id');
                $table->bigInteger('state_id')->index('state');
                $table->float('fee', 10, 0)->nullable();
                $table->timestamp('created_at')->useCurrent();
                $table->timestamp('updated_at')->useCurrentOnUpdate()->useCurrent();
                $table->softDeletes();
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
        Schema::dropIfExists('instruments');
    }
};
