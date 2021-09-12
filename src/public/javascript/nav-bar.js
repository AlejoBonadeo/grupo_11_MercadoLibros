const navBar = document.querySelector('.nav-bar')

window.addEventListener('DOMContentLoaded', () => {
    navBar.innerHTML = `
    <nav class="nav-bar-top">
            <div class="nav-bar-content-top">
                <img src="/img/dummy-logo.png" alt="MercadoLibros" class="logo">
                <div class="search-bar">
                    <input type="search" name="" class="search" placeholder="Buscá un libro...">
                    <button class="search-btn">
                        <i class="fas fa-search fa-2x"></i>
                    </button>
                </div>
                <div class="ingresar">
                    <h2 class="ingresar-item"><a href="login"class="login">Iniciar Sesión</a></h2>
                    <h2 class="ingresar-item"><a href="register"class="register">Registrarse</a></h2>
                </div>
            </div>
        </nav>
        <nav class="nav-bar-bottom">
            <div class="nav-bar-content-bottom">
                <h2 class="nav-bot-item categorias-btn">Categorías</h2>
                <h2 class="nav-bot-item"><a href="login" class="historial">Historial</a></h2>
                <h2 class="nav-bot-item"><a href="login" class="vender">Vender</a></h2>
                <h2 class="nav-bot-item"><a href="#" class="faqs">Preguntas frecuentes</a></h2>
            </div>
        </nav>
        
        <div class="categorias-container">
        <div class="categorias">
            <div class="categoria">Arquitectura</div>
            <div class="categoria">Arte</div>
            <div class="categoria">Ciencia</div>
            <div class="categoria">Derecho</div>
            <div class="categoria">Diseño</div>
            <div class="categoria">Economía</div>
            <div class="categoria ">Fiolosofía</div>
            <div class="break"></div>
            <div class="categoria">Goegrafía</div>
            <div class="categoria">Historia</div>
            <div class="categoria">Ingeniería</div>
            <div class="categoria">Inglés</div>
            <div class="categoria">Lengua</div>
            <div class="categoria">Literatura</div>
            <div class="categoria">Matemática</div>
            <div class="break"></div>
            <div class="categoria">Medicina</div>
            <div class="categoria">Música</div>
            <div class="categoria">Psicología</div>
            <div class="categoria">Sociales</div>
            <div class="categoria">Tecnología</div>
            <div class="categoria">Otros Idiomas</div>
            <div class="categoria">Otros</div>
        </div>
    </div>
    `
    const categoriesContainer = document.querySelector(".categorias-container")
    const categoriesButton = document.querySelector(".categorias-btn")

    categoriesButton.addEventListener("click", () => {
    categoriesContainer.classList.toggle("mostrar-categorias")
})
})