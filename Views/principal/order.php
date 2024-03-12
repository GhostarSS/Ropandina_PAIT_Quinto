<?php include "Views/template/header.php"; ?>

<section class="shoping-cart spad">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title mb-5">LOGIN</h5>
                <div class="card">
                    <div class="card-body">
                        <div class="form-structor">
                        <div class="signup">
                            <h2 class="form-title" id="signup"><span>or</span>Registrarse</h2>
                            <form>
                                <div class="form-holder">
                                    <input type="text" name="name" id="nameRegister" class="input" placeholder="Name" required />
                                    <input type="email" name="email" id="emailRegister" class="input" placeholder="Email" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" />
                                    <input type="password" name="password" id="passwordRegister" class="input" placeholder="Password" required minlength="8" />
                                </div>
                                <button type="submit" class="submit-btn bg-white text-dark" id="btnRegister">Registrarse</button>
                            </form>
                        </div>
                            <div class="login slide-up">
                                <div class="center">
                                    <h2 class="form-title" id="loginForm"><span>or</span>Login</h2>
                                    <div class="form-holder mb-3">
                                        <input type="email" id="email" class="input" placeholder="Email" />
                                        <input type="password" id="password" class="input" placeholder="Password" />
                                    </div>
                                    <a href="<?php echo BASE_URL . 'principal/recoverpw'; ?>">Olvidaste tu contraseña?</a>
                                    <button class="submit-btn" id="btnLogin">Login</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include "Views/template/footer.php"; ?>

<script src="<?php echo BASE_URL; ?>public/admin/js/jquery.min.js"></script>
<script src="<?php echo BASE_URL; ?>public/js/login.js"></script>
</body>

</html>

<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = isset($_POST['name']) ? $_POST['name'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';

    $errors = [];

    // Validar nombre
    if (empty($name)) {
        $errors['name'] = "El nombre es obligatorio.";
    }

    // Validar email
    if (empty($email)) {
        $errors['email'] = "El correo electrónico es obligatorio.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = "El formato del correo electrónico no es válido.";
    }

    // Validar contraseña
    if (empty($password)) {
        $errors['password'] = "La contraseña es obligatoria.";
    } elseif (strlen($password) < 8) {
        $errors['password'] = "La contraseña debe tener al menos 8 caracteres.";
    }

    // Si no hay errores, procesar el registro
    if (empty($errors)) {
        // Aquí iría el código para procesar el registro, como insertar en la base de datos.
        echo "Registro exitoso.";
    } else {
        // Mostrar errores
        foreach ($errors as $error) {
            echo "<p style='color: red;'>$error</p>";
        }
    }
}

?>
