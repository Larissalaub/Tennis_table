var database = require("../database/config");

function buscarPontuacao()
{
    
    var instrucao = `
    select p.pontos, u.nome from pontuacao p
    inner join usuario u
    on p.idusuario = u.idusuario
    order by p.pontos desc
    limit 10
    `;
    
    console.log("Executando a instrução SQL: \n" + instrucao);
    
    var perguntas = database.executar(instrucao)
    
    return perguntas;

}

module.exports = {
   buscarPontuacao
}
