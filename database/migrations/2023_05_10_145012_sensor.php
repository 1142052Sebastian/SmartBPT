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
        Schema::create('sensor', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('roomid')->foreign('roomid')->references('id')->on('rooms');
            $table->string('name');
            $table->string('model');
            $table->string('manufacturer');
            $table->string('type', 50);
            $table->date('installed');
            $table->date('revised');
            $table->boolean('status')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sensor');
    }
};
