<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear Usuario y Confirmar Compra</title>
    <style>
       body { font-family: Arial, sans-serif; max-width: 600px; margin: 30px auto;  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        h2 {
            font-weight: 700;
            font-size: 2rem;
            text-align: center;
    color: #4a3aff;
    margin-bottom: 30px;
        }
        label { display: block; margin-top: 15px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box; }
        button { margin-top: 20px; padding: 10px; width: 100%; background-color: #2196F3; color: white; border: none; font-size: 16px; cursor: pointer; }
        button:hover { background-color: #1976D2; }
        .error { color: red; font-size: 14px; }
        .seating-zone {
            width: 100%;
            max-width: 600px;
            margin-bottom: 50px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
            padding: 25px 20px 35px;
        }
    </style>
</head>
<body>
    <div class="seating-zone"> 
    <h2>Crear Usuario y Confirmar Compra</h2>

    <form method="POST" action="{{route('tasks.Comprar2')}}" id="FormCrearUsuario">
        @csrf

        @foreach($Asientos as $Asientos)
            <input type="hidden" name="asientos[]" value="{{ $Asientos->id }}">
        @endforeach
        
        <label for="nombre">Nombre completo:</label>
        <input type="text" name="nombre" id="nombre" placeholder="Tu nombre" required>

        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" id="apellido" placeholder="Tu apellido">

        <label for="cedula">cedula:</label>
        <input type="number" name="cedula" id="cedula" placeholder="Tu cedula">

        <label for="email_nuevo">Correo electrónico:</label>
        <input type="email" name="email_nuevo" id="email_nuevo" placeholder="Tu correo" value="{{$Datos['email_existente']}}" required>

        <label for="dia_funcion">Selecciona el día de la función:</label>
        <select name="dia_funcion" id="dia_funcion" required>
            <option value="">-- Selecciona un día --</option>
            <option value="1">Primer día de función</option>
            <option value="2">Segundo día de función</option>
        </select>

        <button type="submit">Finalizar Compra</button>
    </form>
    </div>

    @if ($errors->any())
        <div class="error">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
</body>
</html>
