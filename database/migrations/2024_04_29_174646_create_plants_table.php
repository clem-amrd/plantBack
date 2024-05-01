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
        Schema::create('plants', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('scientific_name')->nullable();
            $table->integer('maximum_height')->nullable();
            $table->integer('average_height')->nullable();
            $table->string('photo')->nullable();
            $table->integer('light')->nullable();
            $table->integer('temperature_min')->nullable();
            $table->integer('temperature_max')->nullable();
            $table->integer('temperature_perfect')->nullable();
            $table->json('seed_months')->nullable();
            $table->json('fruit_months')->nullable();
            $table->integer('row_spacing')->nullable();
            $table->integer('toxicity')->nullable();
            $table->string('description')->nullable();
            $table->integer('watering')->nullable();
            $table->integer('humidity')->nullable();
            $table->json('compatibility')->nullable();
            $table->integer('difficulty')->nullable();
            $table->boolean('fruit')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('plants');
    }
};
