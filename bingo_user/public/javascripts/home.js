

/**
 * Representa el botón para acceder al formulario de inicio de sesión.
 * @type {Element}
 */
const loginButton = document.querySelector('#login-btn');
/**
 * Representa el botón para acceder al formulario para registrar nuevos usuarios.
 * @type {Element}
 */
const signInButton = document.querySelector('#signIn-btn');

/**
 * Representa el contenedor de los campos de nombre y apellido del usuario
 * @type {Element}
 */
const nameBox = document.querySelector('#name-box');

const login = document.querySelector('#login');

const sign = document.querySelector('#sign-in');

/**
 * Función que define las acciones a realizar cuando se de click al botón de login.
 */
loginButton.addEventListener("click", event => {
    loginButton.classList.add("selected");
    signInButton.classList.remove("selected");
    nameBox.classList.add("hide");
    sign.classList.add("hide");
    login.classList.remove("hide");
});

/**
 * Función que define las acciones a realizar cuando se de click al botón de registrarse.
 */
signInButton.addEventListener("click", event => {
    signInButton.classList.add("selected");
    loginButton.classList.remove("selected");
    nameBox.classList.remove("hide");
    sign.classList.remove("hide");
    login.classList.add("hide");
});

function register() {

    const name = document.querySelector('#name').value;
    const lastname = document.querySelector('#lastname').value;
    const password = document.querySelector('#password').value;
    const username = document.querySelector('#username').value;

    if (name === '' || lastname === '' || password === '' || username === '') {
        alert('Por favor, complete todos los campos.');
        return;
    }

    fetch('/register', {
        method: 'POST',
        headers: {
            'content-type': 'application/json',
        },
        body: JSON.stringify({ name, lastname, username, password }),
    })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            location.reload();
        })
        .catch(error => {
          console.log('Error al registrar el usuario',error);
        })
}

function loginUser() {
    const password = document.querySelector('#password').value;
    const username = document.querySelector('#username').value;

    if (username === '' || password === '') {
        alert('Por favor, complete todos los campos.')
        return;
    }

    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username, password }),
    })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
        })
        .catch(error => {
            alert(error.message);
            console.error('Error al iniciar sesion:', error);
        })
}