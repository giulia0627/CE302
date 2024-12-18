#Considere as notas de alunos descritas no vetor numérico nomeado em Notas
#e os alunos que entregaram os trabalhos descritas no vetor lógico nomeado em Trabalhos
#:

#  Notas
##     João    Maria     José      Ana    Pedro    Paula 
##       32       70       95       78       33       51 
##   Carlos  Mariana Fernando    Luiza 
##       69       52       53       77
#Trabalhos
##     João    Maria     José      Ana    Pedro    Paula 
##    FALSE     TRUE     TRUE     TRUE    FALSE    FALSE 
##   Carlos  Mariana Fernando    Luiza 
##     TRUE    FALSE    FALSE     TRUE
#Responda as seguintes questões, considerando duas casas decimais.

#A raiz quadrada da média das notas dos alunos é: Answer 1 Questão 1 
require(lubridate)
require(tidyverse)
require(data.table)

notas <- data.frame( "notas" = c(32,70,95,78,33,51,69,52,53,77),
                     "nomes" = c("joao","maria","jose","ana","pedro","paula","carlos","mariana","fernando","luiza"))
head(notas)

sqrt(mean(notas$notas))

# A mediana dos alunos que entregaram o trabalho é: Answer 2 Questão 1

trabalhos <- data.frame( "nomes" = c("joao","maria","jose","ana","pedro","paula","carlos","mariana","fernando","luiza"),
                         "trabalhos" = c(FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE))
head(trabalhos,10)
resp_b <- notas %>% inner_join(trabalhos, by = c("nomes"= "nomes")) %>% filter(trabalhos == TRUE)

median(resp_b$notas)


# A maior nota dentre os alunos que não entregaram o trabalho é 

nao_entregaram <- notas %>% inner_join(trabalhos, by = c("nomes"= "nomes")) %>% filter(trabalhos == FALSE)
max(nao_entregaram$notas)


# Assuma que a média para aprovação direta é 70, alunos com média inferior a 40 tem reprovação direta, 
#os demais estão em recuperação. A quantidade de alunos em recuperação que entregou os trabalhos é:

dim(notas %>% inner_join(trabalhos, by = c("nomes"= "nomes")) %>% filter(notas >= 40 & notas < 70 & trabalhos == TRUE))

#O desvio-padrão das notas dos alunos que entregaram os trabalhos é: 

entregaram <- notas %>% inner_join(trabalhos, by = c("nomes"= "nomes")) %>% filter(trabalhos == TRUE)
entregaram

sd(entregaram$notas)



#### QUESTÃO 2



# Uma equipe de analistas está avaliando o desempenho de uma carteira de 10 ativos em um período de 5 meses, 
#antes e depois de uma mudança na alocação do capital. 
#Para isso, os retornos mensais percentuais de cada ativo foram organizados em matrizes de dimensões 5×10
#, onde cada linha representa um mês e cada coluna representa um ativo. Considere as matrizes de retornos antes da mudança X
#e após a mudança Y
#apresentadas abaixo.

#X
##       Ativo_1 Ativo_2 Ativo_3 Ativo_4 Ativo_5 Ativo_6
## Mês_1    -1.3    -2.8     3.9     1.0    -1.0    -2.3
## Mês_2     4.8     1.2     2.4     0.0    -0.4    -1.4
## Mês_3     2.7     1.1    -4.7     3.7    -1.7    -2.9
## Mês_4     2.7     2.8     1.4    -0.1     4.1    -2.4
## Mês_5    -1.4     0.6     1.9     4.5     4.8     1.4
##       Ativo_7 Ativo_8 Ativo_9 Ativo_10
## Mês_1    -2.3    -0.7    -1.7     -0.5
## Mês_2    -2.4     4.2    -0.7      3.9
## Mês_3    -1.6     1.1     3.9      2.4
## Mês_4     0.5     1.6     0.5     -3.0
## Mês_5     4.8     3.2     1.9     -3.6
#Y
##       Ativo_1 Ativo_2 Ativo_3 Ativo_4 Ativo_5 Ativo_6
## Mês_1     4.5     3.2    -3.3     1.5     2.8     0.5
## Mês_2    -2.7    -3.9     1.7     2.8     3.3     1.5
## Mês_3     4.9    -0.6     3.7     4.4    -1.4    -1.1
## Mês_4    -1.5    -4.6    -3.0    -0.7     3.0    -2.8
## Mês_5     0.2    -3.2    -3.0     1.6    -1.1    -0.2
##       Ativo_7 Ativo_8 Ativo_9 Ativo_10
## Mês_1     1.8    -0.4    -0.3     -3.2
## Mês_2     2.8     4.3    -1.3     -1.4
## Mês_3     3.2    -4.5    -1.7      4.5
## Mês_4     1.9    -1.5    -3.7     -2.1
## Mês_5    -3.6    -1.9     0.7      3.4



#Os analistas desejam identificar os ativos com maior retorno médio na carteira antes da
#mudança de alocação. Escreva um código em R que calcule a média de retorno para cada ativo 
#e identifique o ativo com a maior média. O ativo com o maior retorno médio é o: 


ativos_antes <- matrix(data = c(-1.3  ,  -2.8   ,  3.9   ,  1.0   , -1.0   , -2.3,-2.3  ,  -0.7 ,   -1.7  ,   -0.5,
                                4.8   ,  1.2  ,   2.4   ,  0.0  ,  -0.4 ,   -1.4, -2.4  ,   4.2  ,  -0.7   ,   3.9,
                                2.7   ,  1.1   , -4.7    , 3.7  ,  -1.7   , -2.9, -1.6   ,  1.1   ,  3.9   ,   2.4,
                                2.7   ,  2.8    , 1.4  ,  -0.1   ,  4.1  ,  -2.4, 0.5   ,  1.6  ,   0.5   ,  -3.0,
                                -1.4   ,  0.6   ,  1.9  ,   4.5   ,  4.8   ,  1.4, 4.8   ,  3.2   ,  1.9   ,  -3.6),
                       nrow = 5, ncol = 10, byrow = TRUE)

max(colMeans(ativos_antes))



# Para visualizar como os ativos se relacionam, 
#os analistas decidem multiplicar a matriz (Y) pela sua transposta, 
#criando uma nova matriz que reflete as similaridades entre os ativos. A soma dos elementos da diagonal princial dessa matriz é



ativos_depois <- matrix(data = c( 4.5   ,  3.2   , -3.3    , 1.5   ,  2.8  ,   0.5, 1.8 ,   -0.4  ,  -0.3   ,  -3.2,
                                  -2.7  ,  -3.9  ,   1.7   ,  2.8   ,  3.3   ,  1.5, 2.8  ,   4.3  ,  -1.3   ,  -1.4,
                                  4.9   , -0.6    , 3.7   ,  4.4   , -1.4  ,  -1.1,3.2 ,   -4.5 ,   -1.7  ,    4.5,
                                  -1.5  ,  -4.6   , -3.0  ,  -0.7   ,  3.0   , -2.8, 1.9   , -1.5  ,  -3.7  ,   -2.1,
                                  0.2   , -3.2  ,  -3.0   ,  1.6  ,  -1.1  ,  -0.2,-3.6   , -1.9   ,  0.7    ,  3.4 ),
                        nrow = 5, ncol = 10, byrow = TRUE)

nova_matriz <- ativos_depois%*%t(ativos_depois)

sum(diag(nova_matriz))



#Após a mudança na alocação, um segundo conjunto de dados foi coletado para a mesma carteira de ativos.
#O ativo que apresentou a maior alteração absoluta média de retorno após a mudança foi o


max(abs(colMeans(ativos_depois)))



#Mantendo apenas os cinco ativos com maior média de retorno antes da mudança, o determinante da matriz de retornos correspondente é


medias <- colMeans(ativos_antes)
ativos <- c("Ativo_1" ,"Ativo_2", "Ativo_3", "Ativo_4", "Ativo_5", "Ativo_6","Ativo_7","Ativo_8","Ativo_9","Ativo_10")
medias_ativos <-data.frame( "medias" = medias,
                            "ativos" = ativos)
medias_ativos <- medias_ativos %>% arrange(desc(medias))
medias_ativos <- medias_ativos[1:5,]
medias_ativos


### QUESTÃO 3

#Considere o banco de dados contendo informações sobre 10000 restaurantes de Fast Food nos Estados Unidos. 
#Considere que o ano de entrada na base (dateAdded) é a data de abertura do restaurante.

#Importante: Considere as seguintes alterações à serem realizadas nos nomes dos restaurantes:


#  Homogeinize os nomes dos restaurantes para letras maiúsculas/minusculas
#Remova espaços em branco extras
#Substititua apóstrofos (’S) por S
#Remova abreviações de “JR.”, substituindo por “JR”
#Substitua hífens por espaços
#Responda as seguintes questões, considerando duas casas decimais.

df <- fread("Datafiniti_Fast_Food_Restaurants.csv")
colnames(df)

# letras maiúsculas

toupper(df$name)

#letras minusculas 

df <- df %>% mutate(name = str_to_lower(name))

#Juntos, os estados AZ, RI e UT possuem quantos restaurantes de Fast Food? Answer 1 Questão 3

rest <- df %>% filter(province %in% c("AZ","RI","UT"))
length(unique(rest$id))


# Considerando o estado com mais restaurantes de Fast Food, dentre AZ, RI e UT quantos restaurantes ele possui? 

rest_2 <- rest %>% group_by(province) %>% summarise(id = unique(id)) # Temos que contar os ID's unicos para garantir que não repetimos a contagem de um restaurante 2x
rest_2 %>% group_by(province) %>% summarise(n = n())



#O estado que mais consome Fast Food da rede ARCTIC CIRCLE é: Answer 3 Questão 3

df <- df %>% mutate(name = toupper(name))
df %>% filter(name == "ARCTIC CIRCLE") %>% group_by(province) %>% summarize(n = n())


#No ano de 2017 quantos restaurantes abriram no estado de NC? Answer 4 Questão 3

df<- df %>% mutate(ano_abertura = year(dateAdded)) # Criando uma coluna com o ano
view(df)  

nc_rest <- df %>% filter(ano_abertura == 2017 & province == "NC") %>% group_by(id) %>% summarise(n = n()) #agrupando por ID



dim(nc_rest) # Considera-se que o mesmo ID trata-se do mesmo restaurante, o mesmo restaurante não pode ser contabilizado duas vezes, por isso fazemos uma contagem para uma ocorrência e não uma soma


#No ano de 2016 a rede que mais expandiu foi a

expandiu <- df %>% filter(ano_abertura == 2016)
expandiu <- expandiu %>% group_by(id) %>% summarise(n = n(), rede = unique(name)) #agrupando por ID

expandiu <- expandiu %>% group_by(rede) %>% summarise(contagem = n()) %>% arrange(desc(contagem))
expandiu %>% mutate(rede = str_replace(rede,"'S","S"))
expandiu




### QUESTÃO 4

#Para as perguntas a seguir, utilize o banco de dados proveninete do Tidytuesday de 2021, semana 48, 
#que contém informações sobre a série de TV Dr. Who. Para carregar o banco, utilize a função abaixo.


#tuesdata <- tidytuesdayR::tt_load(2021, week = 48)

#Note que o resultado é uma lista contendo quatro objetos, cada um contendo um banco de dados. Os objetos são: writers, directors, episodes e imdb.


#Caso necessário, junte os bancos utilizando apenas informações comuns à todos os bancos.


#Responda as seguintes questões, considerando duas casas decimais.

install.packages("tidytuesdayR")
require(tidytuesdayR)
tuesdata <- tidytuesdayR::tt_load(2021, week = 48)



#A dupla de diretor e escritor formada por Rachel Talalay e Steven Moffat é responsável por quantos episódios?

writers <- tuesdata$writers

directors <- tuesdata$directors

episodes <- tuesdata$episodes


View(episodes)
View(directors)
View(writers)


rachel <- directors %>% filter(director == "Rachel Talalay")
steven <- writers %>% filter(writer == "Steven Moffat")

episodios <- rachel %>% inner_join(steven, by= c("story_number"="story_number"))
episodios
dim(episodes %>% filter(story_number %in% episodios$story_number))


#Somente em 2011 o escritor Steven Moffat escreveu mais de dois episódios. Quantos episódios ele escreveu neste ano?

episodes <- episodes %>% mutate(ano = year(first_aired))
dim(episodes %>% filter(ano == 2011 & story_number %in% steven$story_number))


#O escritor Peter Harness trabalhou na série por algum tempo. Quantos anos ele trabalhou na série?

peter <- writers %>% filter(writer == "Peter Harness")
peter
peter_years <- episodes %>% filter(story_number %in% peter$story_number)
peter_years <- max(peter_years$ano) - min(peter_years$ano)
peter_years


#Durante o tempo que o escritorPeter Harness escreveu roteiros para Dr. Who, ele foi responsável por quantos roteiros?

dim(episodes %>% filter(story_number %in% peter$story_number))


#O diretor Daniel O’Hara dirigiu episódios com duração média de quantos minutos?
daniel <- directors %>% filter(director == "Daniel O'Hara")

daniel_episodes <- episodes %>% filter(story_number %in% daniel$story_number)

mean(daniel_episodes$duration)



### QUESTÃO 5

#Considere o banco de dados contendo informações sobre o programa americano de calouros American Idol para responder as questões que seguem. 
#Se necessário, utilize quatro casas decimais para arredondamento.

american_idol <- fread("American_Idol.csv")

#Na Season_04, quantos(as) participantes distintos(as) cantaram músicas contendo a palavra Love no título?

season_4 <- american_idol %>% filter(season == "Season_01")
season_4 <- season_4 %>% mutate(song = str_to_title(song))
love <- season_4 %>% filter(str_detect(song,"Love"))
length(unique(love$contestant))


#O(A) artista mais cantado dentre todos os(as) participantes cujo nome começa com a letra M é:


american_idol %>% filter(artist %like% "^M") %>% group_by(artist) %>% summarise(n = n()) %>% arrange(desc(n))


#Na Season_17, quantos(as) participantes que se apresentaram após o(a) segundo(a) candidato(a) não foram eliminados(as) da competição?

season_17 <- american_idol %>% filter(season == "Season_17")
participantes <- count(season_17 %>% filter(order > 2),result) %>% arrange(desc(n))



#Qual a proporção de participantes que foram eliminados(as) na Season_13 cantando músicas do Bee Gees ou do Elton John? 


# Como a pergunta não diz, assumo que a proporção dos elimnados que cantam bee gees ou elton john seja em relação ao todo de eliminados na season_13

season_13 <- american_idol %>% filter(season == "Season_13")
count(season_13, result)

eliminados_13 <- season_13 %>% filter(result == "Eliminated")
eliminados_13_elton <- eliminados_13 %>% filter(artist == "Bee Gees" | artist == "Elton John")

dim(eliminados_13_elton)[1]/dim(eliminados_13)[1]


#Qual é o nome da música que foi cantada por mais participantes distintos(as) ao longo de todas as temporadas? 
#Desconsidere os participantes cujo nome contenha a letra J. 

american_idol <- american_idol %>% filter(!contestant %like% "^J")
musica_cantadas <- american_idol %>% group_by(song,contestant) %>% summarise(n = n()) %>% arrange(desc(n))


musica_cantadas %>% group_by(song) %>% summarise(n = n()) %>% arrange(desc(n))