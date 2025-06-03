<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Funcion extends Model
{
    use HasFactory;

    // Opcional: si el nombre de tu tabla no es "funcions"
    protected $table = 'funciones';

    // Opcional: si no usás timestamps (created_at, updated_at)
    public $timestamps = false;

    // Campos que se pueden asignar masivamente
    protected $fillable = [
        'nombre_funcion',
        'precio_vip',
        'precio_general',
        'descuento',
    ];
}
