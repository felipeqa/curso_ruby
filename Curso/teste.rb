puts "Bem vindo ao jogo da adivinhação!!!!!!!!!!!!!!!!!!!!!!!!!"
puts "Qual é o seu nome?"
jogador = gets + "\n\n"
puts "Iremos começar o jogo para você, " + jogador + "!"
puts "Escolhendo um numero aleatório..."
numero_secreto = 175
puts "Numero escolhido!!!\n\n"
puts "Tentativa 1"
chute = gets + "\n"
puts jogador.to_s + ", vc chutou " + chute.to_s + " ???"
acertou = numero_secreto == chute.to_i

if acertou
    puts "Acertou!!!"
else
    puts "Errou!!!"
      if chute.to_i < numero_secreto
          puts "Numero escolhido é maior!!!"
      else
            puts "Numero escolhido é menor!!!"
      end
end
