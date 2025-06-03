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
        .total { font-size: 24px; margin-bottom: 30px; }
        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #388E3C;
        }
        .seating-zone {
            width: 100%;
            max-width: 600px;
            margin-bottom: 50px;
            background: white;
            text-align:center;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
            padding: 25px 20px 35px;
        }
    </style>
</head>
<body>
        <div class="seating-zone">  
    <h2>Confirmar Compra</h2>

    <div class="total">
        Total a pagar: <strong>{{$Precio}}</strong>
    </div>

    <form action="{{route('tasks.VentaFinal')}}" method="POST">
        @csrf
        <input type="hidden" name="Iduser" value=" {{$It}} ">
        <input type="hidden" name="asientos[]" value="{{ $Asientos}}">
        <input type="hidden" name="Dia" value="{{ $Dia}}">
        <button type="submit">Confirmar Compra</button>
    </form>
    </div>

</body>
</html>
