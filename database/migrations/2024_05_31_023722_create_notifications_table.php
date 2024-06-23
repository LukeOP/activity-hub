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
        if (! Schema::hasTable('notifications')) {
            Schema::create('notifications', function (Blueprint $table) {
                $table->string('id', 36)->primary();
                $table->string('user_id', 36)->index('user_id');
                $table->string('icon');
                $table->string('header', 100);
                $table->text('details');
                $table->string('route')->nullable();
                $table->string('dataType')->nullable();
                $table->string('dataId', 36)->nullable();
                $table->boolean('seenStatus')->default(false);
                $table->timestamp('created_at')->useCurrent();
                $table->timestamp('updated_at')->useCurrentOnUpdate()->useCurrent();
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('notifications');
    }
};
