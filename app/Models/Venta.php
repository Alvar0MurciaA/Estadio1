<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    protected $table ='venta';
    protected $fillable = ['usuario_id', 'idasiento','Dia'];
    public $timestamps = false; 
}
