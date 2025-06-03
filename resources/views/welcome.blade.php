<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Selección de Asientos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f8f8;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .section-title {
            font-weight: bold;
            font-size: 18px;
            margin: 20px 0 10px;
            text-align: center;
        }

        .seating-zone {
            margin-bottom: 30px;
            text-align: center;
        }

        .row {
            display: flex;
            justify-content: center;
            margin-bottom: 8px;
        }

        .seat {
            width: 40px;
            height: 40px;
            margin: 4px;
            border-radius: 5px;
            text-align: center;
            line-height: 40px;
            font-weight: bold;
            color: white;
            cursor: pointer;
        }

        .available {
            background-color: #4CAF50; /* verde */
        }

        .occupied {
            background-color: #f44336; /* rojo */
            cursor: not-allowed;
        }

        .vip {
            border: 2px solid gold;
        }

        .general {
            border: 2px solid gray;
        }
    </style>
</head>
<body>

    <h2>Selecciona tus Asientos</h2>

    <!-- Zona VIP -->
    <div class="seating-zone">
        <div class="section-title">Zona VIP</div>
        <div class="row">
            <div class="seat vip available">A1</div>
            <div class="seat vip occupied">A2</div>
            <div class="seat vip available">A3</div>
            <div class="seat vip available">A4</div>
            <div class="seat vip occupied">A5</div>
        </div>
        <div class="row">
            <div class="seat vip available">B1</div>
            <div class="seat vip available">B2</div>
            <div class="seat vip occupied">B3</div>
            <div class="seat vip available">B4</div>
            <div class="seat vip occupied">B5</div>
        </div>
    </div>

    <!-- Zona General -->
    <div class="seating-zone">
        <div class="section-title">Zona General</div>
        <div class="row">
            <div class="seat general available">C1</div>
            <div class="seat general available">C2</div>
            <div class="seat general occupied">C3</div>
            <div class="seat general available">C4</div>
            <div class="seat general available">C5</div>
            <div class="seat general occupied">C6</div>
            <div class="seat general available">C7</div>
        </div>
        <div class="row">
            <div class="seat general occupied">D1</div>
            <div class="seat general available">D2</div>
            <div class="seat general available">D3</div>
            <div class="seat general occupied">D4</div>
            <div class="seat general available">D5</div>
            <div class="seat general available">D6</div>
            <div class="seat general available">D7</div>
        </div>
    </div>

</body>
</html>
