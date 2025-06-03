<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8" />
<title>Crear Función - Selección de Asientos</title>
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
  }

  .asiento {
    background-color: #d9d9d9;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    cursor: pointer;
    font-weight: 600;
    color: #555;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 40px;
    transition:
      background-color 0.3s ease,
      color 0.3s ease,
      transform 0.2s ease,
      box-shadow 0.2s ease;
    user-select: none;
  }

  .asiento:hover {
    background-color: #b2b2ff;
    box-shadow: 0 4px 12px rgba(74, 58, 255, 0.5);
    color: #fff;
    transform: scale(1.1);
  }

  .asiento.selected {
    background-color: #4a3aff;
    color: white;
    box-shadow: 0 6px 15px rgba(74, 58, 255, 0.7);
    transform: scale(1.15);
  }

  label {
    font-weight: 600;
    margin-bottom: 6px;
    display: block;
    color: #444;
    font-size: 0.95rem;
  }

  input[type="number"], input[type="text"] {
    width: 100%;
    padding: 10px 14px;
    font-size: 1rem;
    border-radius: 10px;
    border: 1.8px solid #bbb;
    margin-bottom: 25px;
    transition: border-color 0.3s ease;
    box-sizing: border-box;
  }

  input[type="number"]:focus, input[type="text"]:focus {
    outline: none;
    border-color: #4a3aff;
    box-shadow: 0 0 8px rgba(74, 58, 255, 0.5);
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
    letter-spacing: 1px;
  }

  button:hover {
    background-color: #362db9;
  }

  /* Responsive */
  @media (max-width: 480px) {
    .asientos {
      grid-template-columns: repeat(5, 1fr);
      gap: 10px;
    }
    .container {
      padding: 20px 25px;
    }
  }
</style>
</head>
<body>
<div class="container">
  <h2>Crear Función - Selección de Asientos</h2>

  <form method="POST" action="{{route('tasks.CrearFunc')}}">
    <!-- Agrega @csrf si usas Blade -->
  @csrf  
    <div class="seccion" id="seccion-vip-a">
      <h3>Asientos VIP - Sección A (máx 20)</h3>
      <div class="asientos" data-seccion="vip_a"></div>
      <input type="hidden" name="vip_a_asientos" id="vip_a_asientos" value="">
    </div>

    <div class="seccion" id="seccion-vip-b">
      <h3>Asientos VIP - Sección B (máx 20)</h3>
      <div class="asientos" data-seccion="vip_b"></div>
      <input type="hidden" name="vip_b_asientos" id="vip_b_asientos" value="">
    </div>

    <div class="seccion" id="seccion-general-c">
      <h3>Asientos General - Sección C (máx 20)</h3>
      <div class="asientos" data-seccion="general_c"></div>
      <input type="hidden" name="general_c_asientos" id="general_c_asientos" value="">
    </div>

    <div class="seccion" id="seccion-general-d">
      <h3>Asientos General - Sección D (máx 20)</h3>
      <div class="asientos" data-seccion="general_d"></div>
      <input type="hidden" name="general_d_asientos" id="general_d_asientos" value="">
    </div>

    <label for="nombre_funcion">Nombre de la función:</label>
    <input type="text" id="nombre_funcion" name="nombre_funcion" placeholder="Ingresa el nombre de la función" required>

    <label for="precio_general">Precio boleta General:</label>
    <input type="number" id="precio_general" name="precio_general" min="0" step="0.01" required>

    <label for="precio_vip">Precio boleta VIP:</label>
    <input type="number" id="precio_vip" name="precio_vip" min="0" step="0.01" required>

    <label for="descuento_segundo_dia">Descuento por función en segundo día (%):</label>
    <input type="number" id="descuento_segundo_dia" name="descuento_segundo_dia" min="0" max="100" step="0.01" required>

    <button type="submit">Crear Función</button>
  </form>
</div>

<script>
  const maxAsientos = 20;
  const secciones = [
    { id: 'vip_a', letra: 'A' },
    { id: 'vip_b', letra: 'B' },
    { id: 'general_c', letra: 'C' },
    { id: 'general_d', letra: 'D' }
  ];

  secciones.forEach(({id, letra}) => {
    const container = document.querySelector(`div.asientos[data-seccion="${id}"]`);
    for(let i=1; i<=maxAsientos; i++){
      const seat = document.createElement('div');
      seat.classList.add('asiento');
      seat.textContent = letra + i;
      seat.dataset.seatLabel = letra + i;
      seat.dataset.seccion = id;
      container.appendChild(seat);
    }
  });

  document.querySelectorAll('.asientos').forEach(container => {
    container.addEventListener('click', (e) => {
      if(e.target.classList.contains('asiento')){
        e.target.classList.toggle('selected');
        updateHiddenInputs();
      }
    });
  });

  function updateHiddenInputs(){
    secciones.forEach(({id}) => {
      const selectedSeats = Array.from(document.querySelectorAll(`.asiento.selected[data-seccion="${id}"]`))
        .map(div => div.dataset.seatLabel);
      document.getElementById(`${id}_asientos`).value = selectedSeats.join(',');
    });
  }
</script>

</body>
</html>
