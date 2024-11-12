# CE302
??mean
vignette("ggplot2")

## Operadores lógicos
a <- 1
b <- 2
a == b
a != b
a <= b
a >= b

## vetores
vetor_numerico <- c(1,2,3,4,5)
vetor_numerico[1]
vetor_numerico[2]

vetor_numerico[1:2]
vetor_numerico[-1]
vetor_numerico[-c(3:5)]

vetor_x_3 = vetor_numerico*3
vetor_x_3

## operaçôes matematicas
vetor1 <- c(2,4,6)
vetor2 <- c(1,3,5)

soma_vetores = vetor1 + vetor2
soma_vetores
vetor1 * vetor2

vetor3 <- c(-2,-1,0)
abs(vetor3)
sort(vetor3)

is.character(vetor3)
is.numeric(vetor3)

class(vetor3)


## vetor nomeado
## Podemos ter um vetor numérico com nomes
altura <- c("João" = 1.82,
            "Bianca" = 1.68,
            "Eduarda" = 1.62)
class(altura)
altura

altura[2]
altura[max(altura)]

names(altura)
names(altura[max(altura)])

altura[altura > 1.5]

## sequências
seq1 <- seq(1, 10)
seq1


## números alatórios
runif(10)
runif(10, min = 0, max = 100)

rnorm(10)
rnorm(10, mean = 6, sd = 2)

rpois(10, lambda = 2)

x <- c("thiago", "joão", "lucas")
sample(x, size = 2)

# Comparação entre vetores
vetor1 <- c(1, 2, 3, 4)
vetor2 <- c(4, 5, 6, 7)

# Igualdade
vetores_iguais <- vetor1 == vetor2  
vetores_iguais
y <- rnorm(100)
sample(y, size =2)

# Diferença
vetores_diferentes <- vetor1 != vetor2
vetores_diferentes

alturas <- c("João" = 1.82, 
             "Bianca" = 1.68,
             "Carlos" = 1.75, 
             "Ana" = 1.70)

# Selecionar elemento
alturas[1]
alturas[1:3]
alturas[c(1, 3, 4)]
# remover elemento
alturas[c(1, 3, 4)]

# Seleciona alturas maiores que 1.70
mascara_logica <- alturas > 1.70
alturas[mascara_logica]
mascara_logica

# Modificar a alturas
alturas["João"] <- 1.85
alturas["Bianca"] <- NA
alturas = alturas[-3]
alturas

# Adiciona a altura de Ivete
append(alturas, 
       value = c("Ivete" = 1.60),
       after = 0)

# Concatena alturas
alturas2 <- c("Alana" = 1.70, 
              "Rafael" = 1.80)
alturas <- c(alturas, alturas2)
alturas

ls()
print(vetor1)
sum(vetor2)
mean(vetor3)
median(vetor1)
max(vetor2)
min(vetor3)
sqrt(vetor_numerico)
rev(vetor2)
length(vetor3)
sort(vetor3)
unique(vetor3)

dados <- c(10, 15, 20, 25, 30)
soma <- sum(dados)
media <- mean(dados)
mediana <- median(dados)
valor_maximo <- max(dados)
valor_minimo <- min(dados)
raiz_quadrada <- sqrt(25)

## gráfico de disperção ou linhas
vetor4 = c(1:100)
vetor5 = sqrt(vetor4)

plot(x = vetor4, 
     y = vetor5, 
     las = 1, 
     pch = 16,
     col = "#219EBC")
# Cria um gráfico de linhas e pontos
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)
plot(x, y, type = "b")  

## histograma
hist(vetor4, 
     las = 1,
     col = "#cdb4db")
# Cria um histograma dos dados no vetor x
hist(x) 

## manipulação de texto (string)
nomes = c("Maria", "Ana", "Rafaela")
paste(nomes[1], "e", nomes[2], "são minhas amigas.")
paste(nomes[1], nomes[2], nomes[3], sep = "|")
paste(nomes, collapse = " ")
toupper(nomes)
tolower(nomes)
substr(x = nomes[1], start = 1,stop = 3)

## diretório atual
diretorio_atual <- getwd()
setwd("~/desktop/")

# Listar os arquivos no diretório de trabalho atual
arquivos <- list.files()
print(arquivos)

## Exploração de Conjuntos de Dados Integrados
data(iris)
str(iris)
head(iris)
tail(iris)
summary(iris)

## matrizes
vetor_a = c(1,2,3,4)
vetor_b = c(5,6,7,8)

matriz_linha = rbind(vetor_a, 
                     vetor_b)
matriz_linha

A <- matrix(c(1:9), 
            ncol = 3,
            byrow = TRUE)

## operações de matrizes
B <- matrix(c(2, -1, 3,
              1, 4, 1, 
              5, -2, 7), 
            ncol = 3, 
            byrow = TRUE)
B
dim(B)
soma <- A + B
soma
dim(soma)

## nomes de linhas e colunas
rownames(A) <- c("Linha1", "Linha2", "Linha3")
colnames(A) <- c("Coluna1", "Coluna2", "Coluna3")

A <- matrix(1:9, nrow = 3)
upper_elements <- upper.tri(A)
upper_elements
A[upper.tri(A)]

lower_elements <- lower.tri(A, diag = T)
lower_elements
A[lower.tri(A)]


## Arrays
# Criando um array 2x3x4

arr <- array(1:24, dim = c(2, 3, 4)) #dim = c(linha, coluna, dimenção)
arr


## datas frames
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))
meu_data_frame

# visualizar as primeiras e ultimas linhas de um data frame
head(meu_data_frame)
tail(meu_data_frame)

# visão geral do data frame
str(meu_data_frame)

meu_data_frame$nome
class(meu_data_frame$nome)

# remover e adcionar coluna/variavel
meu_data_frame[,-2]
meu_data_frame$genero <- c("F", "M", "F", "F", "M", "M", "F", "M")

# Usando a função subset()
subconjunto_df <- subset(meu_data_frame, idade > 28)
subconjunto_df
subconjunto_df <- meu_data_frame[meu_data_frame$idade > 28, ]  # Seleciona pessoas com idade maior que 28
subconjunto_df

# dimensões do data frame (linhas/coluna)
dim(meu_data_frame)
# número de linhas
nrow(meu_data_frame)
# números de colunas 
ncol(meu_data_frame)

# resumo estatístico das variaveis
summary(meu_data_frame)

## Aplicar uma função a subconjunto de um data frame
# Exemplo de uso da função by()
resultado <- by(meu_data_frame$salario, meu_data_frame$idade, mean)
resultado

## Fatores
# Exemplo de criação de fator
genero <- factor(c("Masculino", "Feminino", "Masculino", "Feminino"))

# Exenplo com diferentes níveis
estadiamento_doenca <- factor(c("Estágio I", "Estágio II", "Estágio I", "Estágio III", "Estágio IV"), 
                              levels = c("Estágio I", "Estágio II", "Estágio III", "Estágio IV"))
genero
estadiamento_doenca
meu_data_frame$estad.doenca <- estadiamento_doenca

meu_data_frame$genero = as.factor(meu_data_frame$genero)
meu_data_frame$genero
summary(meu_data_frame)

# Definindo fator com níveis específicos
cores <- factor(c("Vermelho", "Verde", "Azul"), levels = c("Vermelho", "Verde", "Azul", "Amarelo"))
cores


# Exemplo de criação de tabela de dupla entrada
sexo <- c("Masculino", "Feminino", "Masculino", "Masculino", "Feminino")
cidade <- c("A", "B", "A", "B", "A")

tabela_contingencia <- table(sexo, cidade)
tabela_contingencia
tabela_contingencia2 <- table(meu_data_frame$meio_de_transporte, meu_data_frame$genero)
tabela_contingencia2

marginais_linhas <- margin.table(tabela_contingencia, 1)  # Somas das linhas
marginais_colunas <- margin.table(tabela_contingencia, 2)  # Somas das colunas

Queimadas_Q1 <- read.csv("/home/est/gvea24/CE302/Dataset_FireWatch_Brazil_Q1_2024.csv")
Queimadas_Q2 <- read.csv("/home/est/gvea24/CE302/Dataset_FireWatch_Brazil_Q2_2024.csv")
Queimadas_Q3 <- read.csv("/home/est/gvea24/CE302/Dataset_FireWatch_Brazil_Q3_2024.csv")
head(Queimadas_Q1)
head(Queimadas_Q2)
head(Queimadas_Q3)

# Unindo os três bancos de dados
Queimadas <- rbind(Queimadas_Q1, Queimadas_Q2, Queimadas_Q3)
head(Queimadas)
str(Queimadas)
dim(Queimadas)
write.csv(Queimadas, file = "/home/est/gvea24/Dataset_FireWatch_Brazil_2024.csv", row.names = FALSE)

#3 exercícios
# 1)
print(head(Queimadas, n = 9))
# 2)
print(tail(Queimadas, n = 3))
# 3-4)
nrow(Queimadas)
ncol(Queimadas)
dim(Queimadas)
# 5)
summary(Queimadas)
# 6)
str(Queimadas)
# 7) 
unique(Queimadas$bioma)
# 8) Qual a média de avg_numero_dias_sem_chuva para os estados da região sul e da região norte?
Estado_Sul = c("Paraná", "Santa Catarina", "Rio Grande do Sul")
Estado_Norte = c("Amazonas", "Para", "Acre", "Amapa", "Roraima", "Rondonia")

# Criar um data.table
meu_data_table <- data.table(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))
meu_data_table

class(meu_data_table)

## Importar um data.table e comparando o tempo de importação com o read.csv
system.time(Queimadas <- fread("/home/est/gvea24/Dataset_FireWatch_Brazil_2024.csv"))
system.time(Queimadas <- read.csv("/home/est/gvea24/Dataset_FireWatch_Brazil_2024.csv"))

## Selecionar colunas e filtrar linhas
resultado <- meu_data_table[idade > 25, .(nome, salario)]
resultado

require(tibble)
require(magrittr)
require(dplyr)

meu_tibble <- tibble(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))
meu_tibble

glimpse(meu_tibble)

meu_tibble <- mutate(meu_tibble, `minha coluna` = 1:8)
meu_tibble <-  rename(meu_tibble, idade_anos = idade)
meu_tibble

## Filtrar e ordenar
resultado <- filter(meu_tibble, idade_anos > 25) 
arrange(resultado, desc(salario))

## Agregar por idade e calcular média de salários
agregado_por_idade <-  group_by(meu_tibble, idade_anos) 
summarize(agregado_por_idade, media_salario = mean(salario))

## Exemplo de criação de lista
minha_lista <- list(
  vetor = c(1, 2, 3, 4, 5),
  matriz = matrix(1:9, nrow = 3),
  data_frame = data.frame(
    nome = c("Alice", "Bob", "Carol"),
    idade = c(25, 30, 28)
  ),
  lista_aninhada = list(
    vetor_aninhado = c(10, 20, 30),
    matriz_aninhada = matrix(1:4, nrow = 2)
  )
)
minha_lista

## Acessar elementos da lista
elemento1 <- minha_lista[[1]]  # Acessar o primeiro elemento
elemento2 <- minha_lista$data_frame  # Acessar o data frame
elemento3 <- minha_lista$lista_aninhada$vetor_aninhado  # Acessar o vetor aninhado
elemento1
elemento2
elemento3

## Adicionar elementos a uma lista
minha_lista$nova_lista <- list(novo_vetor = c(1, 2, 3), nova_matriz = matrix(1:4, nrow = 2))
minha_lista
######################

## Utilizndo o tdyverse
library(tidyverse)

## Lendo dados
dados <- data.table::fread("/home/est/gvea24/CE302/Brazil Total highway crashes 2010 - 2023.csv.gz")
class(dados)
head(dados)
dados
glimpse(dados)

dados <- data.table::fread("/home/est/gvea24/CE302/Mental Health Dataset.csv")
class(dados)
head(dados)
dados
glimpse(dados)

Poland <- subset(dados, Country == "Poland")
Poland

x <- c(-4:4)
x

sort(cos(unique(x)), decreasing = TRUE)

##  Uso do pipe
require(magrittr)

set.seed(123)
rnorm(10)    %>%
  multiply_by(5) %>%
  add(5)  

set.seed(123)
rnorm(10) * 5 + 5

## Pipe de atribuição
require(dplyr)

## Atribuição explicita
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))

meu_data_frame = meu_data_frame %>%
  mutate(idade_25 = idade > 25)

glimpse(meu_data_frame)

## Atribuição implicita
meu_data_frame %<>% 
  mutate(idade_50 = idade > 50)
glimpse(meu_data_frame)
meu_data_frame

require(data.table)
require(dplyr)
require(tidyr)

car_crash = fread("/home/est/gvea24/CE302/Brazil Total highway crashes 2010 - 2023.csv.gz")
glimpse(car_crash)

# Seleção de Variáveis
## Por nome de coluna
car_crash %>% 
  select(data, tipo_de_acidente) %>% 
  head()

car_crash %>% 
  select(starts_with("tipo")) %>% 
  head()

car_crash %>% 
  select(ends_with("feridos")) %>% 
  head()

car_crash %>% 
  select(contains("mente")) %>% 
  head()

# Variãveis por tipo específico de dados
## variável nimerica
car_crash %>% 
  select(where(is.numeric)) %>% 
  glimpse()
## variáveis characters
car_crash %>% 
  select(where(is.character)) %>% 
  glimpse()
## variáveis lógicas
car_crash %>% 
  select(where(is.logical)) %>% 
  glimpse()

## Seleção por critérios
vars_interesse = c("automovel", "bicicleta", "onibus")
car_crash %>% 
  select(all_of(vars_interesse)) %>% 
  glimpse()

vars_interesse2 = c("automovel", "bicicleta", "onibus", "trator")
car_crash %>% 
  select(any_of(vars_interesse2)) %>% 
  glimpse()

## Seleção de Observações (Filtros Simples)
dados_filtrados <- car_crash %>%
  filter(automovel >= 3)
dados_filtrados

##  Agrupamento de dados
tabela <- car_crash %>% 
  filter(tipo_de_ocorrencia %in% c("sem vítima", "com vítima"))%>% 
  group_by(tipo_de_ocorrencia) %>%
  summarise(n = n(), 
            f_r = n()/nrow(car_crash), 
            f_per = n()/nrow(car_crash) * 100, 
            media = mean(levemente_feridos, na.rm = T), 
            Q1 = quantile(levemente_feridos, 0.25, type = 5, na.rm = T), 
            Q2 = quantile(levemente_feridos, 0.5, type = 5, na.rm = T), 
            Q3 = quantile(levemente_feridos, 0.75, type = 5, na.rm = T), 
            var = var(levemente_feridos, na.rm = T), 
            sd  = sd(levemente_feridos, na.rm = T), 
            min = min(levemente_feridos, na.rm = T), 
            max = max(levemente_feridos, na.rm = T)) 
tabela

# Transformando Strings em Datas
# String representando uma data
data_string <- "2023-08-21"

# Transformando a string em data
data <- as.Date(data_string)

# Exibindo a data
print(data)


## Adição, subtração, comparação de dias, semanas, meses ou anos:
data <- as.Date("2023-08-21")
data1 <- data + 7  # Adicionando 7 dias
data2 <- data - 1  # Subtraindo 1 dia
data1 > data2  # Verifica se data1 é posterior a data2

## Formatação de datas para strings:
data <- as.Date("2023-08-21")
data_formatada <- format(data, "%d/%m/%Y")

## Extração de componentes de data (ano, mês, dia):
data <- as.Date("2023-08-21")
ano <- format(data, "%Y")
mes <- format(data, "%m")
dia <- format

## Cálculo de diferenças entre datas:
data3 <- as.Date("2023-08-21")
data4 <- as.Date("2023-08-15")
diferenca <- difftime(data3, data4, units = "days")  # Diferença em dias

## ubridate: Facilitando a Manipulação de Datas no R
install.packages("lubridate")
require(lubridate)
data_ymd <- ymd("2023-08-21")
data_mdy <- mdy("08-21-2023")
data_dmy <- dmy("21-08-2023")
print(data_ymd)
print(data_dmy)

## Operações com Datas
data <- ymd("2023-08-21")
data_nova <- data + days(7)  # Adiciona 7 dias
data_anterior <- data - months(2)  # Subtrai 2 meses
print(data_nova)
print(data_anterior)

## Extraindo Informações de Datas
data <- ymd_hms("2023-08-21 15:30:45")
ano <- year(data)
mes <- month(data)
dia <- day(data)
hora <- hour(data)
minuto <- minute(data)
segundo <- second(data)

print(ano)
print(mes)
print(dia)
print(hora)
print(minuto)
print(segundo)

## Funções de Resumo de Datas
# Data original no fuso horário de Nova Iorque
data_ny <- ymd_hms("2023-08-21 12:00:00", tz = "America/New_York")

# Converter para o fuso horário de Londres
data_london <- with_tz(data_ny, tz = "Europe/London")

print(data_ny)
print(data_london)

## Calcular a Diferença de Tempo entre Datas em Fusos Horários Diferentes:
# Duas datas em fusos horários diferentes
data_ny <- ymd_hms("2023-08-21 12:00:00", tz = "America/New_York")
data_london <- ymd_hms("2023-08-21 17:00:00", tz = "Europe/London")

# Calcular a diferença de tempo em horas
diferenca_horas <- as.numeric(data_london - data_ny)
print(diferenca_horas)

## Trabalhar com Fusos Horários em Data Frames:
dados <- data.frame(
  nome = c("Evento 1", "Evento 2"),
  data = c(
    ymd_hms("2023-08-21 12:00:00", tz = "America/New_York"),
    ymd_hms("2023-08-21 17:00:00", tz = "Europe/London")))

## Converter todas as datas para um fuso horário comum, por exemplo, UTC
dados$data_utc <- with_tz(dados$data, tz = "UTC")
print(dados)

## Junção de dados
require(nycflights13)
airlines
airports
planes
weather

##  Verificação de Chaves Primárias
planes %>% 
  count(tailnum) %>%
  filter(n > 1)

weather %>%
  count(time_hour, origin) %>%
  filter(n > 1)

planes %>%
  filter(is.na(tailnum))

weather %>% 
  filter(is.na(time_hour) | is.na(origin))

## Junções Mutacionais
flights2 <- flights %>% 
  filter(distance > 2000) %>% 
  select(year, time_hour, origin, dest, tailnum, carrier)
flights2

flights2_airlines = 
  flights2  %>% 
  left_join(., airlines)

flights2_airlines = 
  flights2  %>% 
  left_join(., airlines, 
            by = "carrier")

## Right Join
planes_flights = flights2 %>% 
  right_join(planes, by = "tailnum")
print(planes_flights)
## Inner Join
origin_flights = flights2 %>% 
  inner_join(airports, by = c("origin"= "faa"))
origin_flights

origin_flights = flights2 %>% 
  inner_join(airports, join_by(origin == faa))
origin_flights
## Full Join
dest_flights = flights2 %>% 
  full_join(airports, by = c("dest"= "faa"))

dest_flights = flights2 %>% 
  full_join(airports, join_by(dest == faa))
dest_flights
## unções de Filtragem
airports %>% 
  semi_join(flights2, join_by(faa == origin))

flights %>%
  anti_join(airports, join_by(dest == faa)) %>% 
  distinct(dest)

install.packages("tidyverse")
library(tidyverse)
table1 %>% 
  select(country, year, cases) %>% 
  pivot_wider(names_from = year, values_from = cases)

require(data.table)
require(dplyr)
require(tidyr)

require(tidyverse)
require(magrittr)

x <- "Seu nome aqui"
y <- 'Seu nome aqui'
x == y

var_com_aspas <- "Ela disse: 'Eu adoro lasanha.'"
var_com_aspas

var_com_aspas2 <- 'Ela disse: "Eu adoro lasanha."'
var_com_aspas2

var_com_aspas4 <- 'Ela disse: \'Eu adoro lasanha.\''
var_com_aspas4


df <- data.frame(nome = c("Ana", "Maria", "João", NA), 
                 sobrenome= c("Santos", "Silva", "Souza", NA))

