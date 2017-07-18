# Desafio da Pluga

Código de jogo da velha feito para a resolução do desafio da pluga.
Para executar a aplicação, execute os seguintes comandos
git clone 
ruby game.rb

Pontos tratados: 
	-> Implementação de tratamento para os casos em que a entrada é inválida
	-> Implementação de mensagens mais interativas ao usuário
	-> Adicionado a opção de selecionar modos de jogo. Estes sendo humano contra humano, humano contra o computador ou computador contra computador
	-> Adição de um modo fácil e de se selecionar entre as dificuldades
	-> Adição da opção de se iniciar uma nova partida no final da partida anterior

Coisas a tratar:
	-> Corrigir bug na implementação do algorítimo de escolha da melhor jogada. Por algum motivo ela agora mantem a casa 0 do tabuleiro marcada mesmo ela tendo escolhido outra casa como a melhor jogada
	-> Possível refatorar ainda mais