var database = require("../database/config");

function buscarPerguntas() {

var perguntaAtiva = "S";

var instrucao = `
    SELECT * FROM PERGUNTA
    WHERE ativa = '${perguntaAtiva}'
`;

console.log("Executando a instrução SQL: \n" + instrucao);

var perguntas = database.executar(instrucao)

return perguntas;
}

function buscarRespostas(idPergunta) {

    var respostaAtiva = "S";
    
    var instrucao = `
        SELECT * FROM RESPOSTA
        WHERE ativa = '${respostaAtiva}'
        AND idPergunta = '${idPergunta}'
    `;
    
    console.log("Executando a instrução SQL: \n" + instrucao);
    
    var perguntas = database.executar(instrucao)
    
    return perguntas;
    }

    function buscarRespostaPorId(idResposta) {

        var respostaAtiva = "S";
        
        var instrucao = `
            SELECT * FROM RESPOSTA
            WHERE ativa = '${respostaAtiva}'
            AND idResposta = '${idResposta}'
        `;
        
        console.log("Executando a instrução SQL: \n" + instrucao);
        
        var perguntas = database.executar(instrucao)
        
        return perguntas;

    }   

    function gravarPontuacao(idUsuario,pontuacao)
    {
        var instrucao = `
            INSERT INTO pontuacao
            (idUsuario, pontos)
            VALUES(${idUsuario},${pontuacao})
        `;
        
        console.log("Executando a instrução SQL: \n" + instrucao);
        
        var perguntas = database.executar(instrucao)
        
    }

module.exports = {
    buscarPerguntas,
    buscarRespostas,
    gravarPontuacao, 
    buscarRespostaPorId
}
