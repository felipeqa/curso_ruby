require 'pry'

def da_boas_vindas
  puts "Bem vindo ao jogo da adivinhação!"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "Começaremos o jogo para você, #{nome} "
  return nome
end

def pede_dificuldade
  puts "Qual o nível da dificuldade? (1 fácil, 5 difícil)"
  dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)

  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  else
    maximo = 200
  end


  puts "Escolhendo um número secreto entre 1 e #{maximo}."
  sorteado = rand(maximo) + 1
  puts "Escolhido, que tal adivinhar hj o numero secreto?" + "\n\n"
  sorteado
end

def pede_um_numero(tentativa, numero_tentativas, chutes)
  puts "Tentativa #{tentativa} de #{numero_tentativas} !!!"
  puts "Chute até agora #{chutes}"
  puts "Entre com o número"
  chute = gets.strip
  puts "Você chutou #{chute}"
  chute.to_i
end

def verifica_se_acertou(numero_secreto, chute,tentativa, numero_tentativas)

  acertou = numero_secreto == chute
  if acertou
    puts "Vc acertou!!!!"
    puts "PARABÉNS!!!!!"
    return true
  end

  numero = numero_secreto > chute
  if numero
    puts "O numero Secreto é maior!!!!"
  else
    puts "Numero secreto é menor!!!"
  end
  puts "Vc errou!!!\n\n"
  false

  if tentativa == numero_tentativas
    puts "GAME OVER!!!!"
  end

end

def joga (nome, dificuldade)
  numero_secreto = sorteia_numero_secreto(dificuldade)

  pontos_ate_agora = 1000
  numero_tentativas = 5
  chutes = []
  total_chutes = 0


  for tentativa in 1..numero_tentativas
    chute = pede_um_numero(tentativa, numero_tentativas, chutes)

    chutes << chute
    if nome == "Felipe"
      puts "Vc acertou!!!!"
      puts "PARABÉNS!!!!!"
      break
    end

    pontos_a_perder = (chute - numero_secreto).abs / 2.0
    pontos_ate_agora = pontos_ate_agora - pontos_a_perder

    if verifica_se_acertou(numero_secreto, chute, tentativa, numero_tentativas)
      break
    end
  end
  puts "Voce ganhou #{pontos_ate_agora} pontos"
end

def nao_quer_jogar?
  puts "Quer continuar a jogar? (S/N)"
  quero_jogar = gets.strip
  nao_quer_jogar = quero_jogar.upcase == "N"
end



nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
  joga(nome, dificuldade)
  if nao_quer_jogar?
    break
  end
end
