
@extends('layouts.app')




@section('content')
<div class="container mt-4">
    <h2>Editar Función: {{ $funcion->funcion }}</h2>

    {{-- Mostrar errores de validación --}}
    @if ($errors->any())
        <div class="alert alert-danger">
            <strong>¡Ups! Hubo algunos problemas:</strong>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    {{-- Formulario para editar función --}}
    <form method="POST" action="{{ route('tasks.ActualizarFuncion', $funcion->funcion) }}">
        @csrf
        @method('PUT')

        <div class="mb-3">
            <label for="nuevo_nombre" class="form-label">Nuevo nombre de la función</label>
            <input type="text" class="form-control" name="nuevo_nombre" value="{{ $funcion->funcion }}" required>
        </div>

        <div class="mb-3">
            <label for="nuevo_precio_vip" class="form-label">Nuevo precio VIP</label>
            <input type="number" class="form-control" name="nuevo_precio_vip" value="{{ $funcion->status === 'VIP' ? $funcion->Precio : '' }}" required>
        </div>

        <div class="mb-3">
            <label for="nuevo_precio_general" class="form-label">Nuevo precio General</label>
            <input type="number" class="form-control" name="nuevo_precio_general" value="{{ $funcion->status === 'GENERAL' ? $funcion->Precio : '' }}" required>
        </div>

        <div class="mb-3">
            <label for="nuevo_descuento" class="form-label">Nuevo descuento para el segundo día (%)</label>
            <input type="number" class="form-control" name="nuevo_descuento" value="{{ $funcion->descuento }}" required>
        </div>

        <button type="submit" class="btn btn-primary">Actualizar Función</button>
        <a href="{{ route('tasks.Funciones') }}" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
@endsection
