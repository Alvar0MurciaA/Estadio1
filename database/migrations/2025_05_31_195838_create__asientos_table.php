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
        Schema::create('_asientos', function (Blueprint $table) {
            $table->id();
            $table->string('Silla');
            $table->dateTime('due_date')->nullable();
            $table->enum('status',['VIP','GENERAl']);
            $table->enum('tipo',['Disponible','ocupada'])->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('_asientos');
    }
};
