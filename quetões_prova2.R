# ---- Questões 1: Variância, Desvio Médio Absoluto e Coeficiente de Assimetria ----

# A variância amostral (S²), o desvio médio absoluto (DMA) e o segundo coeficiente de assimetria 
# de Pearson (AS2) são medidas definidas, respectivamente, por:
#
#    S² = (1 / (n - 1)) * Σ(xi - x̄)²,  DMA = (1 / n) * Σ|xi - x̄|,  AS2 = 3 * (x̄ - Md) / S
#
# em que x̄ é a média amostral, Md é a mediana e |a| corresponde ao módulo de a.
# Implemente uma função em R que retorne uma lista com o S², o DMA e o AS2 de uma variável 
# quantitativa qualquer. Considere o banco de dados ChickWeight disponível no R e responda ao que se pede.

# 1. Calcule o S² da variável "Time".
# 2. Calcule o DMA da variável "Time".
# 3. No nível 28 da variável "Chick", calcule o AS2 da variável "weight".
# 4. Considerando apenas o nível 28 da variável "Chick", calcule o DMA da variável "weight".
# 5. Para todas as variáveis do banco ChickWeight, verifique se a variância amostral é maior 
#    do que o desvio médio absoluto. (Retorne TRUE = 1 ou FALSE = 0).

# ---- Questões 2: Operações em Matrizes m x m ----

# Considere uma matriz m x m, em que m é um inteiro positivo. Implemente uma função em R que realize 
# a varredura de uma matriz e execute uma operação específica que depende do valor encontrado na matriz, 
# conforme as seguintes regras:
#
# - Se o valor for um número primo, multiplique-o por 3.
# - Se o valor for um quadrado perfeito, subtraia 14. Caso o resultado obtido for negativo, eleve à 5ª potência.
# - Se o valor for negativo na matriz original, calcule a raiz quadrada do seu módulo.
# - Para todos os outros valores, não faça nada.
#
# A função a ser criada deve retornar a matriz transformada.
# *Dica*: Crie funções auxiliares para verificar se um número é primo e se é um quadrado perfeito, 
# e então implemente a função varrer_matriz que realiza a varredura da matriz conforme as regras estabelecidas.

# Considere as seguintes matrizes:
# - Matriz A: matrix(c(-5, 7, 8, 9, -2, -1, 5, 3, -8, -7, -4, -10, -6, 0, 2), nrow = 4, byrow = FALSE)
# - Matriz B: matrix(c(-11, 17, -2, -12, -8, 0, 4, 10, -20, -19, 20, -3, -17, -9, -10, -18, 15, -15, 1), nrow = 4, byrow = FALSE)
# - Matriz C: matrix(c(6, 5, -19, 15, 25, 30, 8, 13, 16, -24, -2, -5, 13, -6, -18, 1, -28), nrow = 4, byrow = FALSE)

# Responda ao que se pede:
# 1. Qual é a soma dos elementos da diagonal principal da matriz A transformada?
# 2. Qual é o maior elemento, em módulo, da matriz C transformada?
# 3. Qual é a soma dos elementos da coluna 1 da matriz C transformada?
# 4. A matriz A tem quantos números primos?
# 5. As matrizes A, B e C juntas têm quantos números primos?

# ---- Questões 3: População de Peixes no Lago Baikal ----

# O Lago Baikal, na Rússia, é famoso por sua abundância de nutrientes e por sua beleza natural, 
# sendo lar da espécie de peixe Omul do Baikal (Coregonus migratorius). 
# O lago pode suportar uma capacidade máxima de 5 × 10^5 peixes e apresenta uma taxa de reprodução basal de 6% ao dia.
#
# Essa taxa de reprodução varia de acordo com a temperatura média da estação do ano, conforme a Tabela 1:
# ----------------------------------------------------------
# Tabela 1: Ajuste na Taxa de Reprodução Baseada na Temperatura
# Estação    | Temperatura | Fator de Reprodução
# Primavera  | 0           | 0.00
# Verão      | 20          | 0.03
# Outono     | 10          | -0.03
# Inverno    | 0           | -0.02
#
# Além disso, o pH da água afeta o comportamento dos pescadores, que pescam diferentes porcentagens 
# de peixes por dia, conforme a Tabela 2:
# ----------------------------------------------------------
# Tabela 2: Porcentagem de Peixes Pescados por Dia com Base no pH da Água
# Faixa pH   | Percentual Pescado
# 6.0–6.5    | 0.12
# 6.6–7.0    | 0.20
# 7.1–7.5    | 0.15
# > 7.6      | 0.08
#
# Atualmente, há *80 peixes* no lago. Um programa de monitoramento foi implementado para avaliar o impacto 
# dessas variáveis na população de peixes.

# ----------------------------------------------------------
# TAREFA:
# Criar uma função chamada simular_lago que:
# 1. Receba os parâmetros:
#     - dias: Número de dias do experimento
#     - peixes_iniciais: Número inicial de peixes no lago
#     - estacao: Estação do ano (Primavera, Verão, Outono ou Inverno)
#     - ph: pH médio da água durante o experimento
#
# 2. Calcule:
#     - O número de peixes no lago a cada dia.
#     - O número de dias até o lago atingir sua capacidade máxima (se aplicável).
#
# 3. Retorne:
#     - Um data frame com duas colunas: 
#         - dias: Número do dia
#         - peixes: Número de peixes no lago naquele dia
#
# Fórmula para o cálculo diário:
# ----------------------------------------------------------
# Peixes no próximo dia = Peixes atuais × (1 + taxa de reprodução ajustada) - peixes pescados
#
# Onde:
# - Taxa de reprodução ajustada = Taxa basal + Fator de ajuste (Tabela 1)
# - Peixes pescados = Peixes atuais × Percentual pescado (Tabela 2)
#
# Observações:
# - O número de peixes nunca pode exceder a capacidade máxima do lago (500.000 peixes).
# - A contagem de peixes deve ser sempre um número inteiro (arredondar para cima).
# - O experimento considera no máximo *1000 dias*.

# ----------------------------------------------------------
# EXEMPLO DE USO DO ENUNCIADO:
# Considere a entrada:
# resultado <- simular_lago(
#   dias = 30,
#   peixes_iniciais = 50000,
#   estacao = "Verão",
#   ph = 7.0
# )
# ----------------------------------------------------------

# Função para simular o número de peixes no lago ao longo do tempo
simular_lago <- function(dias, peixes_iniciais, estacao, ph) {
  # Parâmetros constantes
  capacidade_maxima <- 5 * 10^5   # Capacidade máxima do lago
  taxa_basica <- 0.06             # Taxa basal de reprodução diária
  
  # Ajuste do fator de reprodução conforme a estação (Tabela 1)
  fatores_estacao <- list(
    "Primavera" = 0.00,
    "Verão" = 0.03,
    "Outono" = -0.03,
    "Inverno" = -0.02
  )
  
  fator_ajuste <- fatores_estacao[[estacao]]
  
  # Percentual de peixes pescados conforme o pH da água (Tabela 2)
  if (ph >= 6.0 && ph <= 6.5) {
    percentual_pescado <- 0.12
  } else if (ph > 6.5 && ph <= 7.0) {
    percentual_pescado <- 0.20
  } else if (ph > 7.0 && ph <= 7.5) {
    percentual_pescado <- 0.15
  } else {
    percentual_pescado <- 0.08
  }
  
  # Inicialização do vetor de resultados
  peixes <- numeric(dias + 1)
  peixes[1] <- peixes_iniciais
  
  # Loop para calcular a população de peixes ao longo dos dias
  for (i in 1:dias) {
    taxa_reproducao_ajustada <- taxa_basica + fator_ajuste
    pescados <- round(peixes[i] * percentual_pescado)
    
    peixes_proximo_dia <- peixes[i] * (1 + taxa_reproducao_ajustada) - pescados
    
    # Garantir que o número de peixes não exceda a capacidade máxima e seja inteiro
    peixes[i + 1] <- min(capacidade_maxima, round(peixes_proximo_dia))
  }
  
  # Criar o data frame de resultado
  resultado <- data.frame(dias = 0:dias, peixes = peixes)
  return(resultado)
}

# ----------------------------------------------------------
# EXEMPLO DE USO CONFORME O ENUNCIADO
resultado <- simular_lago(
  dias = 30,
  peixes_iniciais = 50000,
  estacao = "Verão",
  ph = 7.0
)
print(resultado)