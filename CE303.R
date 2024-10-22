#CE303
install.packages("networkD3")
instball.packages("dplyr")

library(networkD3)
library(dplyr)
df <- data_frame()

#colocar os nós
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

## ggplot2
require(dplyr)
require(ggplot2)

data(mtcars)
head(mtcars)

# gráfico de dispersão - básico
mtcars %>% ggplot(aes(x=hp,y=mpg))+geom_point()

#gráfico de dispersão - básico
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
        
 