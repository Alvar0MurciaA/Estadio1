<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TaskController;
Route::get('/', function () {
    return redirect('/Funciones');
});

Route::resource('tasks',TaskController::class);
Route::get('/confirmar-compra', [TaskController::class, 'ConfirmarCompra'])->name('tasks.ConfirmarCompra');
Route::get('/confirmar-usuario', [TaskController::class, 'VerificarUsuario'])->name('tasks.VerificarUsuario');
Route::get('/Crear-usuario', [TaskController::class, 'CrearUsuario'])->name('tasks.CrearUsuario');
Route::POST('/Comprar2', [TaskController::class, 'Comprar2'])->name('tasks.Comprar2');
Route::POST('/Venta-Final', [TaskController::class, 'VentaFinal'])->name('tasks.VentaFinal');
Route::GET('/CrearFuncion', [TaskController::class, 'CrearFuncion'])->name('tasks.CrearFuncion');
Route::POST('/CrearFunc', [TaskController::class, 'CrearFunc'])->name('tasks.CrearFunc');
Route::GET('/Funciones', [TaskController::class, 'Funciones'])->name('tasks.Funciones');
Route::GET('/Central', [TaskController::class, 'Central'])->name('tasks.Central');


// Route::put('/funcion/{funcion}', [TaskController::class, 'actualizarFuncion'])->name('tasks.actualizarFuncion');

// Route::get('/funcion/{funcion}/editar', [TaskController::class, 'EditarFuncionVista'])->name('tasks.EditarFuncionVista');


Route::get('/Funciones/editar/{funcion}', [TaskController::class, 'EditarFuncionVista'])->name('tasks.EditarFuncionVista');
Route::put('/Funciones/editar/{funcion}', [TaskController::class, 'ActualizarFuncion'])->name('tasks.ActualizarFuncion');


Route::delete('/Funciones/eliminar/{funcion}', [TaskController::class, 'EliminarFuncion'])->name('tasks.EliminarFuncion');
