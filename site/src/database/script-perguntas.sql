use tennis_table;

INSERT INTO pergunta 
(pergunta, ativa)
VALUES
("1-Qual é o nome oficial do esporte conhecido como tênis de mesa ? " , "S"),
("2-Quantos pontos são necessários para vencer um set em uma partida de tênis de mesa" , "S"),
("3-Em que país o tênis de mesa teve suas origens?" , "S"),
("4- Em que ano o tênis de mesa se tornou um esporte olímpico?" , "S"),
("5-Qual é a vantagem do jogador que vence o primeiro set em uma partida?" , "S"),
("6- Qual é a cor predominante da bola de tênis de mesa oficial?" , "S"),
("7- Qual é a instituição responsável por administrar e regulamentar o tênis de mesa no Brasil?" , "S"),
("8- O que define a diferença entre uma raquete de tênis de mesa para jogo rápido e uma para controle preciso?" , "S");

INSERT INTO resposta  
(resposta, ativa, respostacerta, idPergunta)
VALUES
("Ping Pong", "S", "S",1),
("Tênis de Mesa", "S", "N",1),
("Mesa-Bola", "S", "N",1),
("Raquete-Bola", "S", "N",1),
("11 pontos", "S", "S",2),
("15 pontos", "S", "N",2),
("21 pontos", "S", "N",2),
("25 pontos", "S", "N",2),
("Japão", "S", "N",3),
("China", "S", "N",3),
("Inglaterra", "S", "S",3),
("Íinda", "S", "N",3),
("1964", "S", "N",4),
("1972", "S", "N",4),
("1988", "S", "S",4),
("1996", "S", "N",4),
("Nenhuma vantagem específica", "S", "N",5),
("Escolher se começa ou não o próximo set", "S", "S",5),
("Receber um ponto adicional no próximo set", "S", "N",5),
("Oponente começa o próximo set com um ponto a menos", "S", "N",5),
("Vermelha", "S", "N",6),
("Branca", "S", "N",6),
("Azul", "S", "N",6),
("Amarela", "S", "S",6),
("Associação Brasileira de Tênis de Mesa (ABTM)", "S", "N",7),
("Federação Brasileira de Tênis de Mesa (FBTM)", "S", "N",7),
("Confederação Brasileira de Tênis de Mesa (CBTM)", "S", "S",7),
("Organização Brasileira de Tênis de Mesa (OBTM)", "S", "N",7),
("A espessura da madeira", "S", "N",8),
("O tipo de borracha", "S", "S",8),
("O tamanho do cabo", "S", "N",8),
("O tipo de esponja", "S", "N",8);

select p.pontos, u.nome from pontuacao p
inner join usuario u
on p.idusuario = u.idusuario
order by p.pontos desc
limit 10





