const path = require("path");
const views = path.join(__dirname, "../../web/views");

module.exports = {
    index: (req, res) => {
        res.render(path.join(views, "/index"));
    },
    carrito: (req, res) => {
        res.render(path.join(views, "/carrito"));
    },
    producto: (req,res) => {
        res.render(path.join(views, "/producto"))
    },
    register: (req, res) => {
        res.render(path.join(views, "/register"));
    },
    login: (req, res) => {
        res.render(path.join(views, "/login"));
    },
    crearproducto: (req,res) => {
        res.render(path.join(views, "/crearproducto"))
    }
}