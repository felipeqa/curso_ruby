
def da_boas_vindas
    puts "Bem vindo ao jogo da adivinhação!"
    puts "Qual é o seu nome?"
    nome = gets
    puts "Começaremos o jogo para você, " + nome.to_s
end

def sorteia_numero_secreto
    puts "Escolhendo um número secreto entre 1 e 200."
    sorteado = 175
    puts "Escolhido, que tal adivinhar hj o numero secreto?" + "\n\n"
    sorteado
end

def pede_um_numero(tentativa, numero_tentativas)
  puts "Tentativa " + tentativa.to_s + " de " + numero_tentativas.to_s + " !!!!"
  puts "Entre com o número"
  chute = gets
  puts "Você chutou " + chute
  chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)

    acertou = numero_secreto == chute
      if acertou
          puts "Vc acertou!!!!"
          puts "PARABÉNS!!!!!"
          return true
        else
          numero = numero_secreto > chute
            if numero
              puts "O numero Secreto é maior!!!!"
              return false

            else
              puts "Numero secreto é menor!!!"
              return false
            end
              puts "Vc errou!!!\n\n"
      end

    puts "GAME OVER"


end


da_boas_vindas
numero_secreto = sorteia_numero_secreto

numero_tentativas = 3

for tentativa in 1..numero_tentativas
    chute = pede_um_numero(tentativa, numero_tentativas)
    if verifica_se_acertou(numero_secreto, chute)
      break
    end
end
