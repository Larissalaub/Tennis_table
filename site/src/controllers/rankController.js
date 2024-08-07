var rankModel = require("../models/rankModel");

function buscarPontuacao(req, res)
{
    rankModel.buscarPontuacao()
    .then(
        function (resultado) {
            res.json(resultado);
        }
    ).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao buscar o rank: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );

}


module.exports = {
    buscarPontuacao
}