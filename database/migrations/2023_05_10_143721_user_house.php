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
        Schema::create('user_house', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('userid');
        $table->unsignedBigInteger('houseid');
        $table->tinyInteger('role')->unsigned()->default(1);
        $table->timestamps();

        $table->foreign('userid')->references('id')->on('users')->onDelete('cascade');
        $table->foreign('houseid')->references('id')->on('house')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_house');

    }
};
