<?php
class Registro extends Controller
{
    public function __construct()
    {
        parent::__construct();
        session_start();
    }
    public function save(){
        // Asegurar que todos los campos esperados estén presentes
        if (isset($_POST['nombre'], $_POST['apellido'], $_POST['direccion'], $_POST['email'], $_POST['clave'])) {
            // Verificar que ninguno de los campos esté vacío
            if (empty($_POST['nombre']) || empty($_POST['apellido']) || empty($_POST['direccion']) || empty($_POST['email']) || empty($_POST['clave'])) {
                $respuesta = ['msg' => 'Todos los campos son requeridos', 'icono' => 'warning'];
            } else {
                // Limpiando y validando los datos de entrada
                $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
                $nombre = strip_tags($_POST['nombre']); // Usa una función más específica si es posible, según cómo definas strClean()
                $clave = $_POST['clave']; // Considera limpiar si es necesario
                $apellido = strip_tags($_POST['apellido']);
                $direccion = strip_tags($_POST['direccion']);
    
                // Validaciones adicionales
                if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $respuesta = ['msg' => 'El formato del correo electrónico no es válido', 'icono' => 'warning'];
                } elseif (strlen($nombre) < 5) {
                    $respuesta = ['msg' => 'El nombre debe tener más de 5 caracteres', 'icono' => 'warning'];
                } elseif (strlen($clave) < 8) {
                    $respuesta = ['msg' => 'La contraseña debe tener al menos 8 caracteres', 'icono' => 'warning'];
                } else {
                    // Si pasa todas las validaciones, se procede con el registro
                    $tipo = 2;
                    $claveHash = password_hash($clave, PASSWORD_DEFAULT);
                    $consulta = $this->model->getUsuario($email);
                    if (empty($consulta)) {
                        $data = $this->model->registrar($email, $nombre, $apellido, $direccion, $claveHash, $tipo);
                        if ($data > 0) {
                            $_SESSION['id_usuario'] = $data;
                            $_SESSION['email'] = $email;
                            $_SESSION['nombre_usuario'] = $nombre;
                            $_SESSION['apellido_usuario'] = $apellido;
                            $_SESSION['direccion_usuario'] = $direccion;
                            $respuesta = ['msg' => 'Usuario registrado', 'icono' => 'success'];
                        } else {
                            $respuesta = ['msg' => 'Error al registrarse', 'icono' => 'error'];
                        }
                    } else {
                        $respuesta = ['msg' => 'El correo ya existe', 'icono' => 'warning'];
                    }
                }
            }
        } else {
            $respuesta = ['msg' => 'Error desconocido', 'icono' => 'error'];
        }
        echo json_encode($respuesta, JSON_UNESCAPED_UNICODE);
        die();
    }
    

    //registrar pedidos
    public function registrarPedido()
    {
        if (!empty($_SESSION['address'])) {
            $datos = file_get_contents('php://input');
            $json = json_decode($datos, true);
            $productos = $json['productos'];
            $pedidos = $json['pedidos'];
            if (is_array($productos)) {
                $transaccion = $pedidos['id'];
                $monto = $pedidos['purchase_units'][0]['amount']['value'];
                $cliente = $_SESSION['address'];
                $envio = 0;
                $data = $this->model->registrarPedido(
                    $transaccion,
                    $monto,
                    $cliente['nombre'],
                    $cliente['apellido'],
                    $cliente['direccion'],
                    $cliente['ciudad'],
                    $cliente['cod'],
                    $cliente['pais'],
                    $cliente['telefono'],
                    $envio,
                    $_SESSION['id_usuario'],
                );
                if ($data > 0) {
                    foreach ($productos as $producto) {
                        $temp = $this->model->getProducto($producto['id']);
                        $this->model->registrarDetalle($temp['nombre'], $temp['precio'], $producto['cantidad'], $producto['id'], $data);
                        //actualizar stock
                        $nuevaCantidad = $temp['cantidad'] - $producto['cantidad'];
                        $nuevaVenta = $temp['ventas'] + $producto['cantidad'];
                        $this->model->actualizarStock($nuevaCantidad, $nuevaVenta, $temp['id']);
                    }
                    $mensaje = array('msg' => 'Pedido registrado', 'icono' => 'success');
                    unset($_SESSION['address']);
                } else {
                    $mensaje = array('msg' => 'Error al registrar el pedido', 'icono' => 'error');
                }
            } else {
                $mensaje = array('msg' => 'Error fatal con los datos', 'icono' => 'error');
            }
        } else {
            $mensaje = array('msg' => 'Datos de envio no encontrado', 'icono' => 'error');
        }
        echo json_encode($mensaje);
        die();
    }
}
