def da_boas_vindas
	puts "Olá esse é o jogo da adivinhação."
	puts "Qual é o seu Nome?"
	nome = gets.strip
	puts "Bem vindo #{nome}, esse é o jogo da adivinhação! Boa sorte!!!\n\n\n"
end

def escolha_numero_secreto
	puts "Agora vamos a escolha do número secreto!"
	sorteado = 120
	puts "Numero Secreto escolhido!!!"
	sorteado.to_i
end

def pede_um_numero(tentativa)
	puts "Entre com o número na tentativa #{tentativa}"
	chute = gets.strip
	puts "\nVocê chutou #{chute} "
	chute.to_i
end

def verifica_se_acertou(numero_secreto, chute, tentativa, numero_tentativa,chutes)
	acertou = numero_secreto == chute
	if acertou
		puts "Parabens, Vc acertou o Numero secreto que era #{numero_secreto}!!!"
		true
	else
		puts "Que pena! Vc errou!"
		chutes << chute

		if tentativa < numero_tentativa
			if chute < numero_secreto
				puts "O numero secreto é maior!!!\n\n"
			else
				puts "O numero secreto é menor!!!\n\n"
			end
			puts "Vc já tentou esses chutes : #{chutes}"
			puts "Vamos para tentativa " + (tentativa + 1).to_s + "\n\n"
		else
			puts "Game Over!!!!"
		end
	end

end

numero_tentativa = 3
chutes = []


da_boas_vindas
numero_secreto = escolha_numero_secreto

for tentativa in 1..numero_tentativa
	chute = pede_um_numero(tentativa)
	verifica_se_acertou(numero_secreto, chute, tentativa, numero_tentativa, chutes)
	if acertou = chute == numero_secreto
		break
	end
end
