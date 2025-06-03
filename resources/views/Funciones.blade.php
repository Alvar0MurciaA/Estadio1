
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Funciones Disponibles</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 40px 20px;
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex-direction: column;
            color: #fff;
        }

        .container {
            width: 100%;
            max-width: 600px;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            color: #333;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            color: #4a3aff;
            margin-bottom: 30px;
        }

        .funcion {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #f1f1f1;
            padding: 15px 20px;
            margin-bottom: 12px;
            border-radius: 8px;
        }

        .btn {
            background-color: #2196F3;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #1976D2;
        }

        form {
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Funciones Disponibles</h2>

 {{-- AQUÍ VAN LOS MENSAJES DE ÉXITO O ERROR --}}
    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Cerrar"></button>
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Cerrar"></button>
        </div>
    @endif



        @foreach ($Funciones as $funcion)
            <div class="funcion">
                <span>{{ $funcion }}</span>
                <form action="{{route('tasks.index')}}" method="GET">
                    @csrf
                    <input type="hidden" name="funcion" value="{{ $funcion }}">
                    <button type="submit" class="btn">Ver Asientos</button>
                </form>
            </div>
<a href="{{ route('tasks.EditarFuncionVista', $funcion) }}" class="btn btn-warning">Editar</a>
  {{-- Eliminar función --}}
        <form action="{{ route('tasks.EliminarFuncion', $funcion) }}" method="POST" style="display: inline-block;" onsubmit="return confirm('¿Estás seguro de que deseas eliminar esta función?');">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-danger">Eliminar</button>
        </form>
        @endforeach
        <div align="center">
            <br>
        <a align="center" href="{{ route('tasks.CrearFuncion') }}" class="btn btn-crear">Crear Función</a>
        <br><br><br>
        <div align="center">
         <a align="center" href="{{ route('tasks.Central')}}" class="btn btn-crear">Central</a>
    </div>
    </div>
    </div>
    <script>
    @if(session('success'))
        Swal.fire({
            icon: 'success',
            title: '¡Éxito!',
            text: '{{ session('success') }}',
            confirmButtonColor: '#3085d6'
        });
    @endif

    @if(session('error'))
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: '{{ session('error') }}',
            confirmButtonColor: '#d33'
        });
    @endif
</script>


<script>
    document.querySelectorAll('.formulario-eliminar').forEach(form => {
        form.addEventListener('submit', function (e) {
            e.preventDefault();

            Swal.fire({
                title: '¿Estás seguro?',
                text: "Esta acción eliminará la función y todos sus asientos y ventas asociadas.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    this.submit();
                }
            });
        });
    });
</script>

</body>
</html>

