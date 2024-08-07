var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");


router.post("/salvarPontuacao", function (req, res) {
    quizController.salvarPontuacao(req, res);
})

router.post("/listarRank", function (req, res) {
    quizController.autenticar(req, res);
});

router.post("/listarPerguntas", function (req, res) {
    quizController.listarPerguntas(req, res);
});

module.exports = router;