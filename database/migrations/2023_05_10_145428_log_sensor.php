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
        Schema::create('log_sensor', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_sensor')->foreign('id_sensor')->references('id')->on('sensor');
            $table->boolean('error')->default(false);
            $table->boolean('status')->default(false);
            $table->longText('text')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('log_sensor');
    }
};
