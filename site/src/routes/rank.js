var express = require("express");
var router = express.Router();

var rankController = require("../controllers/rankController");


router.post("/buscarPontuacao", function (req, res) {
    rankController.buscarPontuacao(req, res);
})


module.exports = router;