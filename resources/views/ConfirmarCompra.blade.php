<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Confirmar Compra</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 30px auto;  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        h2 {
            font-weight: 700;
            font-size: 2rem;
            text-align: center;
    color: #4a3aff;
    margin-bottom: 30px;
        }
        ul { list-style-type: none; padding: 0; }
        li { background: #f0f0f0; margin: 5px 0; padding: 10px; border-radius: 5px; }
        label { display: block; margin-top: 15px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box; }
        button { margin-top: 20px; padding: 10px; width: 100%; background-color: #2196F3; color: white; border: none; font-size: 16px; cursor: pointer; }
        button:hover { background-color: #1976D2; }
        .error { color: red; font-size: 14px; }
        .hidden { display: none; }
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
    <h2>Confirmar Compra</h2>

    <h3>Asientos seleccionados:</h3>
    <ul>
        @foreach($Asientos as $asiento)
            <li>{{ $asiento->Silla }}</li>
        @endforeach
    </ul>

    <form method="GET" action="" id="Formconfirmar">
        @csrf
        @foreach($Asientos as $asiento)
         <input type="hidden" name="asientos[]" value="{{ $asiento->id }}">
        @endforeach
        <label>¿Eres usuario existente o nuevo?</label>
        <input type="radio" name="usuario_tipo" id="usuario_existente" value="existente" checked> <label for="usuario_existente" style="display:inline">Existente</label>
        <input type="radio" name="usuario_tipo" id="usuario_nuevo" value="nuevo"> <label for="usuario_nuevo" style="display:inline">Nuevo</label>

        <div id="form-existente">
            <label for="email_existente">Correo electrónico:</label>
            <input type="email" name="email_existente" id="email_existente" placeholder="Tu correo" >
        </div>

        <div id="form-nuevo" class="hidden">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre" placeholder="Tu nombre">

             <label for="apellido">Apellido:</label>
            <input type="text" name="apellido" id="apellido" placeholder="Tu apellido">

             <label for="cedula">cedula:</label>
            <input type="number" name="cedula" id="cedula" placeholder="Tu cedula">

            <label for="email_nuevo">Correo electrónico:</label>
            <input type="email" name="email_nuevo" id="email_nuevo" placeholder="Tu correo">
        </div>

        <label for="dia_funcion">Selecciona el día de la función:</label>
        <select name="dia_funcion" id="dia_funcion" required>
            <option value="">-- Selecciona un día --</option>
            <option value="1">Primer día de función</option>
            <option value="2">Segundo día de función</option>
        </select>

        <button type="submit">Finalizar Compra</button>
    </form>

    @if ($errors->any())
        <div class="error">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
</div>
    @endif

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const usuarioExistenteRadio = document.getElementById('usuario_existente');
        const usuarioNuevoRadio = document.getElementById('usuario_nuevo');
        const formExistente = document.getElementById('form-existente');
        const formNuevo = document.getElementById('form-nuevo');

        function toggleForm() {
            if (usuarioExistenteRadio.checked) {
                formExistente.classList.remove('hidden');
                formNuevo.classList.add('hidden');
                document.getElementById('Formconfirmar').setAttribute("action","{{route('tasks.VerificarUsuario')}}");
            } else {
                formExistente.classList.add('hidden');
                formNuevo.classList.remove('hidden');
                document.getElementById('Formconfirmar').setAttribute("action","{{route('tasks.CrearUsuario')}}");
            }
        }

        usuarioExistenteRadio.addEventListener('change', toggleForm);
        usuarioNuevoRadio.addEventListener('change', toggleForm);

        toggleForm(); // Inicializa al cargar la página
    });
</script>
</body>
</html>

