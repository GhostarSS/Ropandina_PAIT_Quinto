<?php include "Views/template/header.php"; ?>

<section class="shoping-cart spad">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title mb-5">Dirección de Envío</h5>
                <div class="card">
                    <div class="card-body">
                        <form autocomplete="off" id="frmEnvio">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Nombres</span>
                                        <input type="text" id="nombre" name="nombre" class="form-control" value="<?php echo (!empty($_SESSION['address']['nombre'])) ? $_SESSION['address']['nombre'] : ''; ?>" placeholder="Nombres *">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Apellidos</span>
                                        <input type="text" id="apellido" name="apellido" class="form-control" value="<?php echo (!empty($_SESSION['address']['apellido'])) ? $_SESSION['address']['apellido'] : ''; ?>" placeholder="Apellidos *">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Dirección</span>
                                        <input type="text" id="direccion" name="direccion" class="form-control" value="<?php echo (!empty($_SESSION['address']['direccion'])) ? $_SESSION['address']['direccion'] : ''; ?>" placeholder="Dirección *">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Ciudad</span>
                                        <input type="text" id="ciudad" name="ciudad" class="form-control" value="<?php echo (!empty($_SESSION['address']['ciudad'])) ? $_SESSION['address']['ciudad'] : ''; ?>" placeholder="Ciudad *">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Código postal</span>
                                        <input type="text" id="cod" name="cod" class="form-control" value="<?php echo (!empty($_SESSION['address']['cod'])) ? $_SESSION['address']['cod'] : ''; ?>" placeholder="Cod postal *">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Pais</span>
                                        <input type="text" id="pais" name="pais" class="form-control" value="<?php echo (!empty($_SESSION['address']['pais'])) ? $_SESSION['address']['pais'] : ''; ?>" placeholder="Pais *">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Telefono</span>
                                        <input type="text" id="telefono" name="telefono" class="form-control" value="<?php echo (!empty($_SESSION['address']['telefono'])) ? $_SESSION['address']['telefono'] : ''; ?>" placeholder="Telefono *">
                                    </div>
                                </div>
                            </div>
                            <div class="btn-group" role="group" aria-label="Button group name">
                                <button type="submit" class="btn btn-primary">
                                    Siguiente
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include "Views/template/footer.php"; ?>

<script src="<?php echo BASE_URL; ?>public/admin/js/jquery.min.js"></script>
<script>
    const frmEnvio = document.querySelector("#frmEnvio");
    document.addEventListener("DOMContentLoaded", function() {

        frmEnvio.onsubmit = function(e) {
            e.preventDefault();

            const nombreRegex = /^[a-zA-Z\s]+$/;
            const codRegex = /^\d{5}$/; // Ajustar según necesidad
            const paisRegex = /^[a-zA-Z\s]+$/;
            const telefonoRegex = /^\d{7,10}$/; // Ajustar según estándares locales

            // Validaciones individuales con alertas específicas
            if (!nombreRegex.test(frmEnvio.nombre.value)) {
                alerta("EL NOMBRE DEBE CONTENER SOLO LETRAS Y ESPACIOS", 2);
                return;
            }

            if (!nombreRegex.test(frmEnvio.apellido.value)) {
                alerta("EL APELLIDO DEBE CONTENER SOLO LETRAS Y ESPACIOS", 2);
                return;
            }

            if (frmEnvio.direccion.value == "") {
                alerta("LA DIRECCIÓN NO PUEDE ESTAR VACÍA", 2);
                return;
            }

            if (frmEnvio.ciudad.value == "") {
                alerta("LA CIUDAD NO PUEDE ESTAR VACÍA", 2);
                return;
            }

            if (!codRegex.test(frmEnvio.cod.value)) {
                alerta("EL CÓDIGO POSTAL DEBE TENER 5 DÍGITOS NUMÉRICOS", 2);
                return;
            }

            if (!paisRegex.test(frmEnvio.pais.value)) {
                alerta("EL PAÍS DEBE CONTENER SOLO LETRAS Y ESPACIOS", 2);
                return;
            }

            if (!telefonoRegex.test(frmEnvio.telefono.value)) {
                alerta("EL TELÉFONO DEBE CONTENER ENTRE 7 Y 10 DÍGITOS NUMÉRICOS", 2);
                return;
            }

            // Código para enviar el formulario si todas las validaciones son correctas
            const url = ruta + "principal/envio";
            const http = new XMLHttpRequest();
            http.open("POST", url, true);
            http.send(new FormData(this));
            http.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    if (res.icono == "success") {
                        setTimeout(function() {
                            window.location = ruta + 'principal/pagos';
                        }, 1500);
                    }
                    let type = res.icono == "success" ? 1 : 2;
                    alerta(res.msg.toUpperCase(), type);
                }
            };
        };
    });
</script>


</body>

</html>