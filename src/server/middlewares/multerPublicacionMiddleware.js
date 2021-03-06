const multer = require("./multerPublicacionConfig")

const upload = multer.single("foto_publicacion")

const db = require("../database/models")

const multerError ={
    msg: "Solo se admiten archivos JPG, JPEG , PNG , GIF"
}

module.exports =  async (req, res , next) => {
    try {
        let listaCategorias = await db.Categoria.findAll()
        let libro = await db.Libro.findByPk(req.params.libroId,{include: [{ association: "categoria" }, { association: "editorial" }, { association: "autores" }]})
        upload(req, res, (err) => {
            if(err) {

                res.render("./products/crearpublicacion", {multerError : multerError , oldBody: req.body, authUser: req.session.authUser , libro: libro , categorias: listaCategorias });
            }
            next()
        })
        
    } catch (error) {
        res.json({
            ok: false,
            msg: "Fallo el middleware de carga de imagen"
        });
        
    }   
    
}
