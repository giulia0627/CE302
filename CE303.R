#CE303
install.packages("networkD3")
instball.packages("dplyr")

library(networkD3)
library(dplyr)
df <- data_frame()

## colocar os nós
nos <- tibble(names =c( "EUa e Canadá",
                        "Europa, Oriente Médio e Africa",
                        "Latam",
                        "receita",
                        "CMV",
                        "Adm eGeral",
                        "Tech e Dev",
                        "Receita Total",
                        "Lucro Bruto",
                        "Lucro Operacional",
                        "IR",
                        "Ásia e Pacifico",
                        "Custo Operacional",
                        "Lucro Líquido" ))

links <- tibble(source = c (0,1,2,3,
                            4,4,
                            6,6,
                            7,7,7,
                            8,8,8
),
target = c (4,4,4,4,
            5,6,
            7,8,
            9,10,11,
            12,13,14
),
value = c (4.3,3.0,1.2,1.1,
           4.4,5.2,
           2.6,1.6,
           2.1,0.4,0.089,
           0.6,0.7,0.4))

links

plot <- sankeyNetwork(Links = links, Nodes = nos, Source = 'source', Target = 'target', Value = 'value', 
                      NodeID = "names", units = 'Bi', fontSize = 12, nodeWidth = 10)
plot

# ggplot2 
require(dplyr)
require(ggplot2)

data(mtcars)
head(mtcars)

## gráfico de dispersão - básico
mtcars %>% ggplot(aes(x=hp,y=mpg))+geom_point()

## gráfico de dispersão - básico
mtcars %>% ggplot(aes(x=hp,y=mpg,size=qsec, col=factor(am)))+
  geom_point(alpha=0.7)+
  xlab("potência")+
  ylab("milhas por galão")+
  ggtitle("gráfico de dispersão")+
  scale_y_log10()+
  scale_x_continuous(limits = c(50,400))+
  scale_size_continuous("quarto milha por tempo")+
  scale_color_manual("câmbio",labels=c("AUT.","MAN."),values=c("green","red"))+
  theme_bw()+
  theme(text=element_text(size=15,colour = "blue"),
          plot.title = element_text(hjust=0.5, colour = "blue"))

# mapas 
require(sf)
require(dplyr)
require(ggplot2)
mapa <- st_read("/home/est/gvea24/Downloads/dados_mapa")
plot(st_geometry(mapa))

cidades <- c("CURITIBA","SÃO JOSÉ DOS PINHAIS",
             "PINHAIS","BOCAIÚVA DO SUL",
             "QUATRO BARRAS",
             "ITAPERUÇU","COLOMBO",
             "ALMIRANTE TAMANDARÉ")

mapa$NM_MUNICIP <- iconv(mapa$NM_MUNICIP,
                         from="latin1", 
                         to="utf-8")


cidades <- data.frame(cidades)
names(cidades)="NM_MUNICIP"
cidades2 <- left_join(cidades,mapa,by="NM_MUNICIP")
mapa_red <- st_as_sf(cidades2)

plot(st_geometry((mapa_red)))

dados_pr <- read.csv("/home/est/gvea24/Downloads/dados_mapa/dados_pr.csv",dec=",",
                     sep=";",header=T)
#View(mapa_red)
names(dados_pr)[1]="CD_GEOCODM"
dados_pr$CD_GEOCODM=as.character(dados_pr$CD_GEOCODM)
mapa_redD <- left_join(mapa_red,dados_pr,by="CD_GEOCODM")
names(mapa_redD)

mapa1 <- 
  mapa_redD %>% ggplot(aes(fill=IDH.municipal))+
  geom_sf()+
  scale_fill_gradient(low="tomato",high = "green2")+
  theme_bw()+
  theme(legend.position = "bottom")

require(plotly)
ggplotly(mapa1)

### LEAFLET
qPaleta <- colorBin("Blues",
                         mapa_redD$IDH.municipal,
                         10)
require(leaflet)
require(htmltools)

ufpr <- data.frame(lat=-25.450052641847687,
                   lng=-49.231127407523545)
mapa_redD %>% 
  leaflet() %>% 
  addProviderTiles(providers$Stadia.StamenToner) %>% 
  addPolygons(color=NA,
              label=paste(mapa_redD$NM_MUNICIP,
                          "IDHm:",mapa_redD$IDH.municipal),
              fillOpacity = 0.6,
              fillColor = qPaleta(mapa_redD$IDH.municipal)) %>% 
  addLegend(pal=qPaleta,
            values=mapa_redD$IDH.municipal,
            position = "bottomright") %>% 
  addMarkers(lat=ufpr$lat,lng=ufpr$lng,
             popup = "Estamos Aqui!")

# Marcas aleatórias
marcas <- data.frame(lat=runif(25, -26.45, -24.45),
                     lng=runif(25, -50.23, -48.23))

marcas %>% leaflet() %>%
  addTiles() %>%
  addMarkers()

# Marcas como círculo
marcas %>% leaflet() %>%
  addTiles() %>%
  addCircleMarkers(radius = 20,
                   color = rep(c("red", "blue"),5))

LEGIcon <- makeIcon(iconUrl ="http://web.leg.ufpr.br/img/logo-leg-circle.png",
                    iconWidth = 25, iconHeight = 25)