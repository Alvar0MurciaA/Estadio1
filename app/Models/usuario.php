<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class usuario extends Model
{
    protected $table ='Usuarios';
    protected $fillable = ['Name', 'Email','apellido','cedula'];
    public $timestamps = false; 
}
