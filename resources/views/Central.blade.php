<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Central de Ventas</title>
    <style>
       body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      margin: 0;
      display: flex;
      justify-content: center;
      padding: 40px 20px;
      color: #333;
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
     .container {
      background: #fff;
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.15);
      max-width: 720px;
      width: 100%;
      padding: 30px 40px;
    }

        h2 {
            text-align: center;
            color: #4a3aff;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            max-width: 900px;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 20px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #4a3aff;
            color: white;
        }

        tr:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <div class="container">
    <h2>Últimas Ventas Registradas</h2>

    <table>
        <thead>
            <tr>
                <th>ID Venta</th>
                <th>Nombre Usuario</th>
                <th>Cédula</th>
                <th>Asiento</th>
                <th>Función</th>
                <th>Día de Función</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($Datos as $venta)
                <tr>
                    <td>{{ $venta[0]}}</td>
                    <td>{{ $venta[1]}}</td>
                    <td>{{ $venta[3]}}</td>
                    <td>{{ $venta[2]}}</td>
                    <td>{{ $venta[5]}}</td>
                    <td>{{ $venta[4]}}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="5" style="text-align: center;">No hay ventas registradas.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
    <div align="center">
            <br>
        <a align="center" href="/Funciones" class="btn btn-crear">Retornar</a>
    </div>
    <div>
</body>
</html>
