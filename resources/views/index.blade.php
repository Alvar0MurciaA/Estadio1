<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Selecciona Asientos</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

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
      font-weight: 600;
    }

    .seccion {
      margin-bottom: 40px;
    }

    .seccion h3 {
      font-weight: 600;
      color: #6b5bff;
      margin-bottom: 15px;
      border-left: 6px solid #4a3aff;
      padding-left: 12px;
      font-size: 1.2rem;
    }

    .asientos {
      display: grid;
      grid-template-columns: repeat(10, 1fr);
      gap: 12px;
      margin-bottom: 10px;
    }

    .asiento {
      background-color: #d9d9d9; /* No registrado */
      border-radius: 8px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      cursor: not-allowed;
      font-weight: 600;
      color: #999;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 40px;
      user-select: none;
    }

    .asiento.available {
      background-color: #2196F3;
      color: white;
      cursor: pointer;
    }

    .asiento.available:hover {
      background-color: #1976D2;
      box-shadow: 0 4px 12px rgba(25, 118, 210, 0.7);
    }

    .asiento.occupied {
      background-color: #f44336;
      color: white;
      cursor: not-allowed;
    }

    .asiento.selected {
      background-color: #FF5722;
      color: white;
      box-shadow: 0 6px 15px rgba(255, 87, 34, 0.7);
      transform: scale(1.1);
    }

    button {
      background-color: #4a3aff;
      border: none;
      padding: 14px 0;
      width: 100%;
      border-radius: 12px;
      color: white;
      font-weight: 700;
      font-size: 1.15rem;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #362db9;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Selecciona tus Asientos</h2>

    <form id="seats-form" method="GET" action="{{ route('tasks.ConfirmarCompra') }}">
      @csrf
      <input type="hidden" name="asientos_seleccionados" id="asientos_seleccionados">
      <input type="hidden" name="ids" id="ids">

      @php
        // Agrupamos las letras por sección
        $secciones = [
          'VIP' => ['A', 'B'],
          'GENERAL' => ['C', 'D']
        ];
        $asientosPorFila = 10;
        $filasPorSeccion = 2;
        $mapa = [];

        foreach ($tasks as $t) {
            $mapa[$t->Silla] = [
                'id' => $t->id,
                'tipo' => $t->tipo
            ];
        }
      @endphp

      @foreach ($secciones as $nombreSeccion => $letras)
        <div class="seccion">
          <h3>Sección {{ $nombreSeccion }}</h3>

          @foreach ($letras as $letra)
            @for ($fila = 0; $fila < $filasPorSeccion; $fila++)
              <div class="asientos">
                @for ($i = 1 + ($fila * $asientosPorFila); $i <= ($fila + 1) * $asientosPorFila; $i++)
                  @php
                    $silla = $letra . $i;
                    $estado = $mapa[$silla] ?? null;
                  @endphp

                  @if ($estado)
                    @if ($estado['tipo'] === 'Disponible')
                      <div class="asiento available" data-id="{{ $estado['id'] }}" data-label="{{ $silla }}">{{ $silla }}</div>
                    @else
                      <div class="asiento occupied">{{ $silla }}</div>
                    @endif
                  @else
                    <div class="asiento">{{ $silla }}</div>
                  @endif
                @endfor
              </div>
            @endfor
          @endforeach
        </div>
      @endforeach

      <button type="submit">Confirmar Compra</button>
    </form>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const seats = document.querySelectorAll('.asiento.available');
      const idsInput = document.getElementById('ids');
      const labelsInput = document.getElementById('asientos_seleccionados');

      let selected = [];

      seats.forEach(seat => {
        seat.addEventListener('click', () => {
          const id = seat.dataset.id;
          const label = seat.dataset.label;

          const index = selected.findIndex(s => s.id === id);
          if (index !== -1) {
            selected.splice(index, 1);
            seat.classList.remove('selected');
          } else {
            selected.push({ id, label });
            seat.classList.add('selected');
          }

          idsInput.value = selected.map(s => s.id).join(',');
          labelsInput.value = selected.map(s => s.label).join(',');
        });
      });
    });
  </script>
</body>
</html>

