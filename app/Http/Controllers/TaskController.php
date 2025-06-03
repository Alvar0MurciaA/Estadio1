<?php
// CONTROLADOR DE tAREAS
namespace App\Http\Controllers;
use App\Models\Funcion;
use App\Models\task;
use App\Models\usuario;
use App\Models\Venta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TaskController extends Controller
{

    // función que crea el evento con los asientos VIP  y General
    // Registra cada uno en la BD con su precio, tipo, disponibilida y descuento
    public function CrearFunc(Request $request)
    {
        $VipA = array_filter(explode(",", $request->input('vip_a_asientos', '')));
        $VipB = array_filter(explode(",", $request->input('vip_b_asientos', '')));
        $generalC = array_filter(explode(",", $request->input('general_c_asientos', '')));
        $generalD = array_filter(explode(",", $request->input('general_d_asientos', '')));
        $funcion = $request->input('nombre_funcion');
        $precioG = intval($request->input('precio_general'));
        $precioV = intval($request->input('precio_vip'));
        $descuento = intval($request->input('descuento_segundo_dia'));

        foreach ($VipA as $asiento) {
            Task::create(['Silla' => $asiento, 'Precio' => $precioV, 'status' => 'VIP', 'tipo' => 'Disponible', 'funcion' => $funcion, 'descuento' => $descuento]);
        }
        foreach ($VipB as $asiento) {
            Task::create(['Silla' => $asiento, 'Precio' => $precioV, 'status' => 'VIP', 'tipo' => 'Disponible', 'funcion' => $funcion, 'descuento' => $descuento]);
        }
        foreach ($generalC as $asiento) {
            Task::create(['Silla' => $asiento, 'Precio' => $precioG, 'status' => 'GENERAL', 'tipo' => 'Disponible', 'funcion' => $funcion, 'descuento' => $descuento]);
        }
        foreach ($generalD as $asiento) {
            Task::create(['Silla' => $asiento, 'Precio' => $precioG, 'status' => 'GENERAL', 'tipo' => 'Disponible', 'funcion' => $funcion, 'descuento' => $descuento]);
        }

        return redirect('/Funciones');
    }


    // Muestra un resumen  de todas las ventas realizadas
    public function Central()
    {
        $ventas = Venta::all();
        $Datos = [];

        foreach ($ventas as $venta) {
            $usuario = Usuario::find($venta->usuario_id);
            $asiento = Task::find($venta->idasiento);
            $Datos[] = [
                $venta->id,
                $usuario?->Name,
                $asiento?->Silla,
                $usuario?->cedula,
                $venta->Dia,
                $asiento?->funcion,
            ];
        }

        return view("Central", ['Datos' => $Datos]);
    }


    // muestra la lista de funciones creadas
    public function Funciones()
    {
        $funciones = Task::all()->pluck('funcion')->unique();
        return view('Funciones', ['Funciones' => $funciones]);
    }

    // Muestra el formulario para crear una nueva función(retorna la vista función)
    public function CrearFuncion()
    {
        return view('crearFuncion');
    }

    // muestra los asientos disponibles en una función específica
    public function index(Request $request)
    {
        $tasks = Task::where('funcion', $request->input('funcion'))->get();
        return view('index', ['tasks' => $tasks]);
    }
    // muestra los detalles de los asientos que el usuario desea comprar
    public function ConfirmarCompra(Request $request)
    {
        $asientosString = $request->input('ids');
        $asientosArray = array_filter(explode(',', $asientosString));
        $asientos = Task::whereIn('id', $asientosArray)->get();

        return view('ConfirmarCompra', ['Asientos' => $asientos]);
    }


    // Verifica si el usuario existe antes de realziar la compra
    public function VerificarUsuario(Request $request)
    {
        $datosUsuario = $request->all();
        $asientosArray = $request->input('asientos', []);
        if (!is_array($asientosArray)) {
            $asientosArray = [];
        }

        $email = $datosUsuario["email_existente"] ?? null;
        $user = Usuario::where('Email', $email)->first();
        $diaFuncion = intval($datosUsuario['dia_funcion'] ?? 1);

        $asientos = Task::whereIn('id', $asientosArray)->get();
        // si existe calcula ep recio total según el día y los asientos, luego muestra la vista ConfirmarVenta
        if ($user) {
            $precioTotal = $this->calcularPrecio($asientos, $diaFuncion);
            return view("confirmarVenta", [
                'Precio' => $precioTotal,
                'Asientos' => $asientos->pluck('id'),
                'Dia' => $diaFuncion,
                'It' => $user->id,
            ]);
        }

        return view("crearUsuario", [
            'Datos' => $datosUsuario,
            'Asientos' => $asientos,
        ]);
    }
    // crea un nuevo usuario y muestr ael resumen de compra
    public function CrearUsuario(Request $request)
    {
        $usuario = Usuario::create([
            'Name' => $request->input('nombre'),
            'apellido' => $request->input('apellido'),
            'cedula' => $request->input('cedula'),
            'Email' => $request->input('email_nuevo'),
        ]);

        $asientos = Task::whereIn('id', $request->input('asientos', []))->get();
        $diaFuncion = intval($request->input('dia_funcion', 1));
        $precioTotal = $this->calcularPrecio($asientos, $diaFuncion);

        return view("confirmarVenta", [
            'Precio' => $precioTotal,
            'Asientos' => $asientos->pluck('id'),
            'Dia' => $diaFuncion,
            'It' => $usuario->id,
        ]);
    }
    // reutiliza la funcion crearUsuario para crearlo y pasar a la vista confirmarVenta
    public function Comprar2(Request $request)
    {
        return $this->CrearUsuario($request);
    }
    // Registra la compra final en la base de datos
    public function VentaFinal(Request $request)
    {
        $idu = $request->input('Iduser');
        $dia = $request->input('Dia');
        $sillas = json_decode($request->input('asientos')[0] ?? '[]', true);

        if (is_array($sillas)) {
            Task::whereIn('id', $sillas)->update(['tipo' => 'ocupada']);
            foreach ($sillas as $silla) {
                Venta::create(['usuario_id' => $idu, 'idasiento' => $silla, 'Dia' => $dia]);
            }
        }

        return redirect('/Funciones');
    }
    // Calcula el total a pagar por los asientos seleccionados, aplicando descuento si es el segundo día
    private function calcularPrecio($asientos, $dia)
    {
        $precioTotal = 0;

        foreach ($asientos as $asiento) {
            $precio = $asiento->Precio;
            if (strtoupper($asiento->status) === 'GENERAL' && $dia == 2 || strtoupper($asiento->status) === 'VIP' && $dia == 2) {
                $precio -= ($precio * ($asiento->descuento / 100));
            }
            $precioTotal += $precio;
        }

        return $precioTotal;
    }
   public function ActualizarFuncion(Request $request, $funcion)
{
    $request->validate([
        'nuevo_nombre' => 'required|string|max:255',
        'nuevo_precio_vip' => 'required|numeric|min:0',
        'nuevo_precio_general' => 'required|numeric|min:0',
        'nuevo_descuento' => 'required|numeric|min:0|max:100',
    ]);

    // Verificar que existan asientos con la función original
    $asientos = task::where('funcion', $funcion)->get();

    if ($asientos->isEmpty()) {
        return redirect()->route('tasks.Funciones')->with('error', 'Función no encontrada.');
    }

    // Actualizar todos los registros asociados a la función
    foreach ($asientos as $asiento) {
        $nuevoPrecio = ($asiento->status === 'VIP') ? $request->nuevo_precio_vip : $request->nuevo_precio_general;

        $asiento->update([
            'funcion' => $request->nuevo_nombre,
            'Precio' => $nuevoPrecio,
            'descuento' => $request->nuevo_descuento,
        ]);
    }

    return redirect()->route('tasks.Funciones')->with('success', 'Función actualizada correctamente.');
}


    public function EditarFuncionVista($funcion)
    {
        $funcionData = task::where('funcion', $funcion)->first();

        if (!$funcionData) {
            return redirect()->route('tasks.Funciones')->with('error', 'Función no encontrada.');
        }

        return view('editarFuncion', ['funcion' => $funcionData]);
    }






    public function EliminarFuncion($funcion)
    {
        // Obtener los IDs de los asientos de la función
        $asientosIds = DB::table('_asientos')->where('funcion', $funcion)->pluck('id');

        // Eliminar ventas relacionadas con esos asientos
        DB::table('venta')->whereIn('idasiento', $asientosIds)->delete();

        // Luego eliminar los asientos de la función
        DB::table('_asientos')->where('funcion', $funcion)->delete();

        return redirect()->route('tasks.Funciones')->with('success', 'Función y ventas asociadas eliminadas correctamente');
    }








   

    // public function EliminarFuncion($funcion)
    // {
    //     // Elimina todos los asientos relacionados con esa función
    //     //DB::table('_asientos')->where('funcion', $funcion)->delete();
    //     Task::where('funcion', $funcion)->delete();
    //     return redirect()->route('tasks.Funciones')->with('success', 'Función eliminada correctamente');
    // }

}
