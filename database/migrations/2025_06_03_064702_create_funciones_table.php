<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFuncionesTable extends Migration
{
    public function up()
    {
        Schema::create('funciones', function (Blueprint $table) {
            $table->id();
            $table->string('nombre_funcion')->unique(); // Nombre de la función (ej: Día 1 / Día 2)
            $table->integer('precio_vip')->default(0);
            $table->integer('precio_general')->default(0);
            $table->integer('descuento')->default(0); // Descuento del segundo día, por ejemplo
            $table->timestamps(); // created_at y updated_at
        });
    }

    public function down()
    {
        Schema::dropIfExists('funciones');
    }
}
