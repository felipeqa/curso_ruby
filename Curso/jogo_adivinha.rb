def da_boas_vindas
	puts "Olá esse é o jogo da adivinhação." 
	puts "Qual é o seu Nome?"
	nome = gets.strip
	puts "Bem vindo #{nome}, esse é o jogo da adivinhação! Boa sorte!!!\n\n\n"
end

def escolha_numero_secreto
	puts "Agora vamos a escolha do número secreto!"
	sorteado = 120
	"Numero Secreto escolhido!!!"
	sorteado.to_i
end

def pede_um_numero
	puts "Entre com o número"
	chute = gets
  	puts "Você chutou #{chute} "
  	chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
	acertou = numero_secreto == chute
	if acertou
	puts "Parabens, Vc acertou o Numero secreto que era #{numero_secreto}"
	else
	puts "Que pena! Vc errou, o numero secreto era #{numero_secreto} \nGAME OVER!!!!!"
	end
end

numero_tentativa = 3


da_boas_vindas
numero_secreto = escolha_numero_secreto
chute = pede_um_numero

for tentativa in 1..numero_tentativa
verifica_se_acertou(numero_secreto, chute)

end