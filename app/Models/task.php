<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class task extends Model
{
    protected $table = '_asientos';
     protected $fillable = ['Silla', 'Precio','status','tipo','funcion','descuento'];
}

