## Estrutura for
require(dplyr)
require(magrittr)

dado = c(1:6)
soma_dois_dados = function(dado1, dado2){
  soma = dado1 + dado2
  
}
quadrado_soma = function(soma){
  soma2 = soma^2
  return(soma2)
}

resultado = list()
k = 0 
for(i in dado){
  for(j in dado){
    k = k + 1
    soma = soma_dois_dados(dado[i], dado[j])
    somaqd = quadrado_soma(soma)
    
    resultado[[k]] = data.frame(dado1 = dado[i], 
                                dado2 = dado[j], 
                                soma = soma, 
                                soma2 = somaqd)
  }
}

resultado

resultado %<>% bind_rows()
resultado


matriz1 <- matrix(1:6, nrow = 2)
soma_linhas <- apply(matriz1, 1, sum)
soma_colunas <- apply(matriz1, 2, sum)


minha_lista <- list(a = c(1, 2, 3), b = c(4, 5, 6))
resultados <- lapply(minha_lista, mean)


minha_lista <- list(a = c(1, 2, 3), b = c(4, 5, 6), c=c(7,6,8))
resultados <- sapply(minha_lista, mean)


resultado <- mapply(soma_dois_dados, 
                    dado, 
                    dado)
print(resultado)


dois_dados = expand.grid(dado, dado)
dois_dados


resultado <- mapply(soma_dois_dados, 
                    dois_dados$Var1, 
                    dois_dados$Var2)
print(resultado)


## Funções
minha_media <- function(vetor_de_dados){
  media = sum(vetor_de_dados)/length(vetor_de_dados)
  media = round(media,2)
  return(media)
}

minha_media(iris$Sepal.Length)

meu_desvio_padrao_amostral <- function(vetor) {
  media <- minha_media(vetor) 
  diferenca <- vetor - media  # Calcula as diferenças em relação à média
  quadrados <- diferenca^2  # Calcula os quadrados das diferenças
  variancia <- sum(quadrados) / (length(vetor) - 1)  # Calcula a variância
  desvio_padrao <- sqrt(variancia)  # Calcula o desvio padrão
  return(desvio_padrao)
}
meu_desvio_padrao_amostral(iris$Sepal.Length)

## mensagens
x <- -5
if (x < 0) {
  message("O valor de x é negativo.")
}

x <- -5
if (x < 0) {
  warning("O valor de x é negativo.")
}

x <- -5
if (x < 0) {
  cat("O valor de x é negativo.")
}

x <- -5
if (x < 0) {
  stop("O valor de x é negativo.")
}

##  Estruturas Condicionais (If-else)
idade <- 25
if (idade >= 18) {
  cat("Você é maior de idade.\n")
} else {
  cat("Você é menor de idade.\n")
}


pontuacao = 90
if (pontuacao >= 90) {
  nota = "A"
} else {
  if (pontuacao >= 80) {
    nota = "B"
  } else {
    if (pontuacao >= 70) {
      nota = "C"
    } else {
      nota = "D"
    }
  }
}
nota


classifica_nota <- function(pontuacao) {
  if (pontuacao >= 90) {
    nota <- "A"
  } else {
    if (pontuacao >= 80) {
      nota <- "B"
    } else {
      if (pontuacao >= 70) {
        nota <- "C"
      } else {
        nota <- "D"
      }
    }
  }
  cat(paste("A nota do aluno é:", nota))
  return(nota)
}
pontuacao_aluno <- 85
nota <- classifica_nota(pontuacao_aluno)


quadrante <- function(x, y) {
  if (x > 0) {
    if (y > 0) {
      quadrante = "Quadrante 1"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
      return(quadrante)
    } else {
      quadrante = "Quadrante 4"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
    }
  } else {
    if (y > 0) {
      quadrante = "Quadrante 2"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
    } else {
      quadrante = "Quadrante 3"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
    }
  }
}
quadrante(1, 1)


## If_else e ifelse
require(magrittr)
require(dplyr)

iris %<>% 
  mutate(cat_petal.len = ifelse(Petal.Length > mean(Petal.Length), "Longa", "Curta"))

iris %<>% 
  mutate(cat_petal.len2 = if_else(Petal.Length > mean(Petal.Length), "Longa", "Curta"))


## Switch
dia_da_semana <- "segunda"
mensagem <- switch(dia_da_semana,
                   "segunda" = "Hoje é segunda-feira.",
                   "terca" = "Hoje é terça-feira.",
                   "quarta" = "Hoje é quarta-feira.",
                   "quinta" = "Hoje é quinta-feira.",
                   "sexta" = "Hoje é sexta-feira.",
                   "sabado" = "Hoje é sábado.",
                   "domingo" = "Hoje é domingo.",
                   "Outro" = "Dia não reconhecido.")
cat(mensagem)


##  case_when
iris$cat_sepal = 
  case_when((iris$Sepal.Length < mean(iris$Sepal.Length) - sd(iris$Sepal.Length)) ~ "X < media - 1 sd", 
            (iris$Sepal.Length < mean(iris$Sepal.Length) + sd(iris$Sepal.Length)) ~ "X < media + 1 sd", 
            .default = "X > media + 1 sd")