# 1. Função para calcular S², DMA e AS₂
# Função para calcular variância amostral (S²), DMA e coeficiente de assimetria AS2
calcula_metricas <- function(variavel) {
  n <- length(variavel)
  media <- mean(variavel)
  mediana <- median(variavel)
  
  # Variância amostral (S²)
  S2 <- sum((variavel - media)^2) / (n - 1)
  
  # Desvio médio absoluto (DMA)
  DMA <- sum(abs(variavel - media)) / n
  
  # Coeficiente de assimetria de Pearson (AS2)
  AS2 <- 3 * (media - mediana) / sqrt(S2)
  
  return(list(S2 = S2, DMA = DMA, AS2 = AS2))

#2. Cálculo para a variável **Time**
# Carregar o banco de dados
data(ChickWeight)

# Calcular métricas para a variável Time
result_time <- calcula_metricas(ChickWeight$Time)
print("Resultados para a variável Time:")
print(result_time)

  
#3. Cálculo do **DMA** para a variável **Time**
# Como o DMA já foi calculado na função anterior, ele estará presente no `result_time`:
  
print(paste("O DMA da variável Time é:", result_time$DMA))

#4. Cálculo de **AS₂** no nível 28 da variável **chick** e variável **weight**
# Filtrar dados apenas para chick no nível 28
nivel_28 <- subset(ChickWeight, Chick == 28)

# Calcular métricas para a variável weight no nível 28
result_weight_28 <- calcula_metricas(nivel_28$weight)
print("Resultados para a variável weight no nível 28:")
print(result_weight_28)

# 5. DMA da variável **weight** no nível 28
print(paste("O DMA da variável weight no nível 28 é:", result_weight_28$DMA))

# 6. Comparação entre variância amostral e DMA para todas as variáveis
# Lista de variáveis numéricas no banco de dados
variaveis <- sapply(ChickWeight, is.numeric)

# Função para verificar se S² > DMA para cada variável
comparacao <- sapply(ChickWeight[, variaveis], function(x) {
  metricas <- calcula_metricas(x)
  return(as.integer(metricas$S2 > metricas$DMA))
})

print("Comparação S² > DMA para todas as variáveis (TRUE = 1, FALSE = 0):")
print(comparacao)

________________________________________________________________________________
# 1. Funções Auxiliares
# Funções para verificar números primos e quadrados perfeitos:
# Verifica se um número é primo
eh_primo <- function(n) {
  if (n <= 1) return(FALSE)
  if (n == 2) return(TRUE)
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}

# Verifica se um número é um quadrado perfeito
eh_quadrado_perfeito <- function(n) {
  if (n < 0) return(FALSE)
  raiz <- sqrt(n)
  return(raiz == floor(raiz))
}

# 2. Função para Varredura e Transformação
#Implementa a lógica para varrer e modificar a matriz de acordo com as regras fornecidas:
# Função que transforma a matriz conforme as regras
varrer_matriz <- function(matriz) {
  n <- nrow(matriz)
  m <- ncol(matriz)
  matriz_transformada <- matriz
  
  for (i in 1:n) {
    for (j in 1:m) {
      valor <- matriz[i, j]
      if (eh_primo(valor)) {
        # Regra 1: Multiplica por 3 se o valor for primo
        matriz_transformada[i, j] <- valor * 3
      } else if (eh_quadrado_perfeito(valor)) {
        # Regra 2: Subtrai 14 se for quadrado perfeito
        matriz_transformada[i, j] <- valor - 14
        # Eleva à 5ª potência se o resultado for negativo
        if (matriz_transformada[i, j] < 0) {
          matriz_transformada[i, j] <- matriz_transformada[i, j]^5
        }
      } else if (valor < 0) {
        # Regra 3: Valor negativo -> raiz quadrada do módulo
        matriz_transformada[i, j] <- sqrt(abs(valor))
      }
    }
  }
  return(matriz_transformada)
}

# 3. Aplicação nas Matrizes A, B e C
#Transforma as matrizes conforme a função criada:
# Definição das matrizes
A <- matrix(c(-5, 7, 8, 9, -2, -1, 5, 3, -8, -7, -4, -10, -6, 0, 2), nrow = 4, byrow = FALSE)
B <- matrix(c(-11, 17, -2, -12, -8, 0, 4, 10, -20, -19, 20, -3, -17, -9, -10, -18, 15, -15, 1), nrow = 4, byrow = FALSE)
C <- matrix(c(6, 5, -19, 15, 25, 30, 8, 13, 16, -24, -2, -5, 13, -6, -18, 1, -28), nrow = 4, byrow = FALSE)

# Aplicar transformação nas matrizes
A_t <- varrer_matriz(A)
B_t <- varrer_matriz(B)
C_t <- varrer_matriz(C)
  
# 4. Respostas às Perguntas
# a) Soma dos elementos da diagonal principal da matriz **A transformada**:
soma_diag_A <- sum(diag(A_t))
print(paste("A soma dos elementos da diagonal principal da matriz A transformada é:", soma_diag_A))
# b) Maior elemento em módulo da matriz **C transformada**:
maior_modulo_C <- max(abs(C_t))
print(paste("O maior elemento, em módulo, da matriz C transformada é:", maior_modulo_C))
# c) Soma dos elementos da coluna 1 da matriz **C transformada**:
soma_col1_C <- sum(C_t[, 1])
print(paste("A soma dos elementos da coluna 1 da matriz C transformada é:", soma_col1_C))
# d) Quantidade de números primos na matriz **A**:
qtd_primos_A <- sum(sapply(A, eh_primo))
print(paste("A matriz A tem", qtd_primos_A, "números primos."))
# e) Quantidade de números primos nas matrizes **A, B e C** juntas:
qtd_primos_total <- sum(sapply(c(A, B, C), eh_primo))
print(paste("As matrizes A, B e C juntas têm", qtd_primos_total, "números primos."))

________________________________________________________________________________

# Função para simular o número de peixes no lago
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

# 1. Durante a estação Verão e com pH de 6.6–7.0, após 16 dias, quantos peixes haverá no lago?
resultado_1 <- simular_lago(dias = 16, peixes_iniciais = 80, estacao = "Verão", ph = 6.7)
peixes_apos_16_dias <- resultado_1$peixes[17]
print(paste("Número de peixes após 16 dias:", peixes_apos_16_dias))

# 2. Durante a estação Verão e com pH de 6.6–7.0, quantos dias são necessários para o lago atingir sua capacidade máxima?
dias_atinge_max <- function(peixes_iniciais, estacao, ph) {
  dias <- 0
  peixes <- peixes_iniciais
  capacidade_maxima <- 5 * 10^5
  
  repeat {
    taxa_reproducao_ajustada <- 0.06 + ifelse(estacao == "Verão", 0.03, 0)
    percentual_pescado <- ifelse(ph > 6.5 && ph <= 7.0, 0.20, 0)
    pescados <- round(peixes * percentual_pescado)
    peixes <- round(min(capacidade_maxima, peixes * (1 + taxa_reproducao_ajustada) - pescados))
    dias <- dias + 1
    if (peixes >= capacidade_maxima || dias >= 1000) break
  }
  return(dias)
}
dias_para_max <- dias_atinge_max(peixes_iniciais = 80, estacao = "Verão", ph = 6.7)
print(paste("Dias necessários para atingir a capacidade máxima:", dias_para_max))

# 3. Durante a estação Outono e com pH de 6.0–6.5, após 87 dias, quantos peixes haverá no lago?
resultado_3 <- simular_lago(dias = 87, peixes_iniciais = 80, estacao = "Outono", ph = 6.3)
peixes_apos_87_dias <- resultado_3$peixes[88]
print(paste("Número de peixes após 87 dias:", peixes_apos_87_dias))

# 4. Durante a estação Outono e com pH de 6.0–6.5, quantos dias são necessários para o lago atingir sua capacidade máxima?
dias_para_max_outono <- dias_atinge_max(peixes_iniciais = 80, estacao = "Outono", ph = 6.3)
print(paste("Dias necessários para atingir a capacidade máxima no Outono:", dias_para_max_outono))