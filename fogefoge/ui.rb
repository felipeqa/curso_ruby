def da_boas_vindas
  puts "Bem vindo ao Foge-foge"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n"
  puts "Começaremos o jogo para vc, #{nome}"
  nome
end

def desenha(mapa)
  puts mapa
end

def pede_movimento
  puts "Para onde deseja ir?"
  movimento = gets.upcase.strip
end

def game_over
  puts "\n\n\n"
  puts "Game Over"
end

def movimento_invalido
  puts "Movimento inválido, selecione entre as teclas 'WASD'"
end
