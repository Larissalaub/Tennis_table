var perguntaModel = require("../models/perguntaModel");


function salvarPontuacao(req, res) {
    var pontuacaoUsuario = 0;
    var respostas = req.body.respostas;
    var usuario = req.body.usuario;

    // Função auxiliar para buscar respostas
    function buscarResposta(idResposta) {
        return perguntaModel.buscarRespostaPorId(idResposta)
            .then(function (retorno) {
                return retorno;
            });
    }

    // Inicie a cadeia de promessas
    var promessa = Promise.resolve();

    // Encadeie as promessas para cada resposta
    respostas.forEach(function (resposta) {
        promessa = promessa.then(function () {
            return buscarResposta(resposta.idResposta);
        }).then(function (retorno) {
            if (retorno[0].respostacerta === "S") {
                pontuacaoUsuario += 10;
            }
        });
    });

    // Após todas as promessas serem resolvidas, grave a pontuação
    return promessa.then(function () {
        return perguntaModel.gravarPontuacao(usuario, pontuacaoUsuario);
    })
    .then(function () {
        console.log("Pontuação gravada com sucesso.");
        // Retorne uma resposta para a requisição HTTP
        res.status(200).send("Pontuação gravada com sucesso.");
    })
    .catch(function (error) {
        console.error("Erro ao processar respostas ou gravar pontuação:", error);
        // Retorne uma resposta de erro para a requisição HTTP
        res.status(500).send("Erro ao processar respostas ou gravar pontuação.");
    });
   

}


function listarPerguntas (req,res){
    
    var listaDePerguntas = [];

    perguntaModel.buscarPerguntas()
        .then(function (perguntas) {
            // Inicializa uma Promise resolvida
            var promessaAtual = Promise.resolve();

            // Itera sobre cada pergunta
            perguntas.forEach(function (pergunta) {
                // Adiciona uma etapa à cadeia de Promessas
                promessaAtual = promessaAtual.then(async function () {
                    const respostas = await perguntaModel.buscarRespostas(pergunta.idPergunta);

                    const constPergunta = {
                        idPergunta: pergunta.idPergunta,
                        pergunta: pergunta.pergunta,
                        respostas: respostas
                    };

                    listaDePerguntas.push(constPergunta);
                });
            });

            // Aguarda todas as etapas da cadeia serem concluídas antes de retornar
            return promessaAtual;
        })
        .then(function () {
            // Agora listaDePerguntas está preenchida
            res.json(listaDePerguntas);
        })
        .catch(function (error) {
            console.error('Erro:', error);
            res.status(500).json({ error: 'Erro ao buscar perguntas e respostas.' });
        });
   
}

module.exports = {
    salvarPontuacao,
    listarPerguntas
}