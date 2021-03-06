require 'pry'
require_relative 'ui'
require_relative 'heroi'

def le_mapa(numero)
  arquivo = "mapa#{numero}.txt"
  texto = File.read arquivo
  mapa = texto.split "\n"
end

def encontra_jogador(mapa)
  caractere_do_heroi = "H"

  mapa.each_with_index do |linha_atual, linha|
    #linha_atual = mapa[linha]
    coluna_do_heroi = linha_atual.index caractere_do_heroi
      if coluna_do_heroi
        jogador = Heroi.new
        jogador.linha = linha
        jogador.coluna = coluna_do_heroi
        return jogador
      end
  end
  nil
end



# Criando um novo array heroi
# def calcula_nova_posicao(heroi, direcao)
#   case direcao
#   when "W"
#     [ heroi[0] -1, heroi[1] ]
#   when "S"
#     [ heroi[0] + 1, heroi[1] ]
#   when "A"
#     [ heroi[0], heroi[1] -1 ]
#   when "D"
#     [ heroi[0], heroi[1] +1 ]
#   end
# end

#Duplicando um array
# def calcula_nova_posicao(heroi, direcao)
#     heroi = heroi.dup
#     case direcao
#         when "W"
#             heroi[0] -= 1
#         when "S"
#             heroi[0] += 1
#         when "A"
#             heroi[1] -= 1
#         when "D"
#             heroi[1] += 1
#     end
#     heroi
# end


def posicao_valida?(mapa, posicao)

  linhas = mapa.size
  colunas = mapa[0].size
  estourou_linhas = posicao[0] < 0 || posicao[0] >= linhas
  estorou_colunas = posicao[1] < 0 || posicao[1] >= colunas

  if estourou_linhas || estorou_colunas
    return false
  end
  valor_atual = mapa[posicao[0]][posicao[1]]
  if valor_atual == "X" || valor_atual == "F"
    return false
  end
  true
end

def soma_vetor(vetor1, vetor2)
  [vetor1[0] + vetor2[0], vetor1[1] + vetor2[1]]
end

#Código refatorado
def posicoes_validas_a_partir_de(mapa, novo_mapa, posicao)
  posicoes = []
  movimentos = [[+1, 0], [0, +1], [-1, 0], [0, -1]]

  movimentos.each do |movimento|
    nova_posicao = soma_vetor(movimento, posicao)
    if (posicao_valida? mapa, nova_posicao) && (posicao_valida? novo_mapa, nova_posicao)
      posicoes << nova_posicao
    end
  end

  posicoes
end

#Refatorar código
# def posicoes_validas_a_partir_de(mapa, novo_mapa, posicao)
#   posicoes = []
#
#   baixo = [posicao[0] + 1, posicao[1]]
#   if (posicao_valida? mapa, baixo) && (posicao_valida? novo_mapa, baixo)
#     posicoes << baixo
#   end
#
#   cima = [posicao[0] - 1, posicao[1]]
#   if (posicao_valida? mapa, cima) && (posicao_valida? novo_mapa, cima)
#     posicoes << cima
#   end
#
#   direita = [posicao[0], posicao[1] + 1]
#   if (posicao_valida? mapa, direita) && (posicao_valida? novo_mapa, direita)
#     posicoes << direita
#   end
#
#   esquerda = [posicao[0], posicao[1] - 1]
#   if (posicao_valida? mapa, esquerda) && (posicao_valida? novo_mapa, esquerda)
#     posicoes << esquerda
#   end
#   posicoes
# end

def move_fantasma(mapa, novo_mapa, linha, coluna)

  posicoes = posicoes_validas_a_partir_de mapa, novo_mapa, [linha, coluna]

  return if posicoes.empty?

  # if posicoes.empty?
  #   return
  # end
  aleatorio = rand(posicoes.size)
  posicao = posicoes[aleatorio]

  mapa[linha][coluna] = " "
  novo_mapa[posicao[0]][posicao[1]] = "F"
end

#complexidade muito alta, implementação manual
# def copia_mapa(mapa)
#   novo_mapa = []
#   mapa.each do |linha|
#     nova_linha = ''
#     linha.each do |caractere|
#       if caractere == "F"
#         nova_linha << ' '
#       else
#         nova_linha << caractere
#       end
#     end
#     novo_mapa << nova_linha
#   end
#   novo_mapa
# end
################################################

#Complexidade média usando o dup para duplicar a linha e o tr para traduzir "F" para " "
# def copia_mapa(mapa)
#   novo_mapa = []
#   mapa.each do |linha|
#     nova_linha = linha.dup.tr "F", " "
#     novo_mapa << nova_linha
#   end
#   novo_mapa
# end

################################################

#Complexidade baixa, pegar o array de string e transformar em uma unica string com o join no \n
# Depois traduzir com o tr "F" para " " e por último fazer um split no \n
def copia_mapa(mapa)
  novo_mapa = mapa.join("\n").tr("F", " ").split "\n"
end

def move_fantasmas(mapa)
  caractere_do_fantasma = "F"
  novo_mapa = copia_mapa mapa
  mapa.each_with_index do |linha_atual, linha|
    linha_atual.chars.each_with_index do |caractere_atual, coluna|
      eh_fantasma = caractere_atual == caractere_do_fantasma
      if eh_fantasma
        move_fantasma mapa, novo_mapa, linha, coluna
      end
    end
  end
  novo_mapa
end

def jogador_perdeu?(mapa)
  !encontra_jogador(mapa) #! VERIFICA SE O RETORNO É NIL OU FALSE
end

#Sem refatorar
# def remove(mapa,nova_posicao,quantidade)
#   for direita in 1..quantidade
#     mapa[nova_posicao.linha][nova_posicao.coluna + direita] = " "
#   end
# end

#refatorada
# def remove(mapa, posicao, quantidade)
#   for direita in 1..quantidade
#     posicao = posicao.direita
#     posicao.remove_do mapa
#   end
# end

#refatorar com recursão

def remove(mapa, posicao, quantidade)
  if quantidade == 0
    return
  end
  executa_remocao mapa, posicao.direita, quantidade
  executa_remocao mapa, posicao.esquerda, quantidade
  executa_remocao mapa, posicao.baixo, quantidade
  executa_remocao mapa, posicao.cima, quantidade
end

def executa_remocao(mapa, posicao, quantidade)

  linhas = mapa.size
  colunas = mapa[0].size
  estourou_linhas = posicao.linha < 0 || posicao.linha >= linhas
  estorou_colunas = posicao.coluna < 0 || posicao.coluna >= colunas

  if estourou_linhas || estorou_colunas
    return
  elsif mapa[posicao.linha][posicao.coluna] == "X"
    return
  end

  posicao.remove_do mapa

  remove mapa, posicao, quantidade - 1
end

def joga(nome)

  mapa = le_mapa 3
  direcao = nil

  while true
    desenha(mapa)

    direcao = pede_movimento

    while direcao != "W" && direcao != "A" && direcao != "S" && direcao != "D"
      movimento_invalido
      direcao = pede_movimento
    end

    heroi = encontra_jogador mapa

    nova_posicao = heroi.calcula_nova_posicao direcao

    if !posicao_valida? mapa, nova_posicao.to_array
      next
    end

    heroi.remove_do mapa

    if mapa[nova_posicao.linha][nova_posicao.coluna] == "*"
      remove mapa, nova_posicao, 4
    end

    nova_posicao.coloca_no mapa

    # mapa[heroi.linha][heroi.coluna] = " "
    # mapa[nova_posicao.linha][nova_posicao.coluna] = "H"

    mapa = move_fantasmas mapa
    if jogador_perdeu? mapa
      game_over
      break
    end
  end
end

def inicia_fogefoge
  nome = da_boas_vindas
  joga nome
end
