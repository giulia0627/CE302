require(data.table)
require(dplyr)
require(tidyverse)
require(ggplot2)
library(networkD3)

df <- fread("C:\\Users\\User\\Documents\\one_million_mushrooms.csv")

# Mudando o nome das colunas para garantir que fiquem com _ ao invés de - 
names(df) <- gsub("-","_",names(df))


# Vamos substituir os registros de acordo com o dicionário de dados. 
# Caso não haja uma correspondência no nosso dicionário, substituiremos por unknown

df <- df %>%
  mutate(
    class = case_when(
      class == "e" ~ "edible",
      class == "p" ~ "poisonous",
      TRUE ~ "Unknown"
    ),
    cap_shape = case_when(
      cap_shape == "b" ~ "bell",
      cap_shape == "c" ~ "conical",
      cap_shape == "x" ~ "convex",
      cap_shape == "f" ~ "flat",
      cap_shape == "k" ~ "knobbed",
      cap_shape == "s" ~ "sunken",
      TRUE ~ "Unknown"
    ),
    cap_surface = case_when(
      cap_surface == "f" ~ "fibrous",
      cap_surface == "g" ~ "grooves",
      cap_surface == "y" ~ "scaly",
      cap_surface == "s" ~ "smooth",
      TRUE ~ "Unknown"
    ),
    cap_color = case_when(
      cap_color == "n" ~ "brown",
      cap_color == "b" ~ "buff",
      cap_color == "c" ~ "cinnamon",
      cap_color == "g" ~ "gray",
      cap_color == "r" ~ "green",
      cap_color == "p" ~ "pink",
      cap_color == "u" ~ "purple",
      cap_color == "e" ~ "red",
      cap_color == "w" ~ "white",
      cap_color == "y" ~ "yellow",
      TRUE ~ "Unknown"
    ),
    does_bruise_or_bleed = case_when(
      does_bruise_or_bleed == "t" ~ "bruises",
      does_bruise_or_bleed == "f" ~ "no",
      TRUE ~ "Unknown"
    ),
    gill_attachment = case_when(
      `gill_attachment` == "a" ~ "attached",
      `gill_attachment` == "d" ~ "descending",
      `gill_attachment` == "f" ~ "free",
      `gill_attachment` == "n" ~ "notched",
      TRUE ~ "Unknown"
    ),
    gill_spacing = case_when(
      `gill_spacing` == "c" ~ "close",
      `gill_spacing` == "w" ~ "crowded",
      `gill_spacing` == "d" ~ "distant",
      TRUE ~ "Unknown"
    ),
    gill_color = case_when(
      `gill_color` == "k" ~ "black",
      `gill_color` == "n" ~ "brown",
      `gill_color` == "b" ~ "buff",
      `gill_color` == "h" ~ "chocolate",
      `gill_color` == "g" ~ "gray",
      `gill_color` == "r" ~ "green",
      `gill_color` == "o" ~ "orange",
      `gill_color` == "p" ~ "pink",
      `gill_color` == "u" ~ "purple",
      `gill_color` == "e" ~ "red",
      `gill_color` == "w" ~ "white",
      `gill_color` == "y" ~ "yellow",
      TRUE ~ "Unknown"
    ),
    
    habitat = case_when(
      habitat == 'g' ~ 'grass',
      habitat == 'l' ~'leaves',
      habitat == 'm' ~ 'meadow',
      habitat == 'p' ~ 'paths',
      habitat == 'h' ~ 'heath',
      TRUE ~'Unknown'
    ),
    
    season = case_when(
      season == 's' ~ 'spring',
      season == 'u' ~'summer',
      season == 'w' ~'winter',
      season == 'a' ~'autumn',
      TRUE ~'Unknown'
    ),
    stem_root = case_when(
      stem_root == 'b' ~'bulbous',
      stem_root == 's' ~'swollen',
      stem_root == 'c' ~'club', 
      stem_root == 'u' ~'cup',
      stem_root == 'e' ~ 'equal',
      stem_root == 'z' ~'rhizomorphs',
      stem_root == 'r' ~'rooted',
      TRUE ~ 'Unknown'
      
    ),
    
    stem_surface = case_when(
      stem_surface == "n" ~ "brown",
      stem_surface == "b" ~ "buff",
      stem_surface == "c" ~ "cinnamon",
      stem_surface == "g" ~ "gray",
      stem_surface == "r" ~ "green",
      stem_surface == "p" ~ "pink",
      stem_surface == "u" ~ "purple",
      stem_surface == "e" ~ "red",
      stem_surface == "w" ~ "white",
      stem_surface == "y" ~ "yellow",
      TRUE ~ "Unknown"
    ),
    
    
    stem_color = case_when(
      stem_color == "n" ~ "brown",
      stem_color == "b" ~ "buff",
      stem_color == "c" ~ "cinnamon",
      stem_color == "g" ~ "gray",
      stem_color == "r" ~ "green",
      stem_color == "p" ~ "pink",
      stem_color == "u" ~ "purple",
      stem_color == "e" ~ "red",
      stem_color == "w" ~ "white",
      stem_color == "y" ~ "yellow",
      TRUE ~ "Unknown"
      
    ),
    
    veil_type = case_when(
      veil_type == 'p' ~'partial',
      veil_type == 'u' ~'universal',
      TRUE ~'Unknown'
      
    ),
    
    veil_color = case_when(
      veil_color == "n" ~ "brown",
      veil_color == "b" ~ "buff",
      veil_color == "c" ~ "cinnamon",
      veil_color == "g" ~ "gray",
      veil_color == "r" ~ "green",
      veil_color == "p" ~ "pink",
      veil_color == "u" ~ "purple",
      veil_color == "e" ~ "red",
      veil_color == "w" ~ "white",
      veil_color == "y" ~ "yellow",
      TRUE ~ "Unknown"
      
    ),
    has_ring = case_when(
      has_ring == 't' ~'ring',
      has_ring == 'f' ~'none'
    ),
    ring_type = case_when(
      ring_type == 'c' ~ 'cobwebby',
      ring_type == 'e' ~'evanescent',
      ring_type == 'r' ~'flaring',
      ring_type == 'g' ~'grooved',
      TRUE ~ 'Unknown'
    ),
    spore_print_color = case_when(
      `spore_print_color` == "k" ~ "black",
      `spore_print_color` == "n" ~ "brown",
      `spore_print_color` == "b" ~ "buff",
      `spore_print_color` == "h" ~ "chocolate",
      `spore_print_color` == "g" ~ "gray",
      `spore_print_color` == "r" ~ "green",
      `spore_print_color` == "o" ~ "orange",
      `spore_print_color` == "p" ~ "pink",
      `spore_print_color` == "u" ~ "purple",
      `spore_print_color` == "e" ~ "red",
      `spore_print_color` == "w" ~ "white",
      `spore_print_color` == "y" ~ "yellow",
      TRUE ~ 'Unknown'
      
    )
   
    
     
  )
####################################
summary(df)


diametro_pileo <- df %>%
  group_by(df$class) %>%
  filter(cap_diameter > 0) %>%
  summarise(
    média = mean(cap_diameter, na.rm = TRUE),
    mediana = median(cap_diameter, na.rm = TRUE),
    desvio = sd(cap_diameter, na.rm = TRUE),
    maxímo = max(cap_diameter, na.rm = TRUE),
    minímo = min(cap_diameter, na.rm = TRUE),
    amplitude = diff(range(cap_diameter, na.rm = TRUE)),
    variância = var(cap_diameter, na.rm = TRUE),
    coefiênte = (sd(cap_diameter)/mean(cap_diameter)) *100,
    Q1 = quantile(cap_diameter, 0.25),
    Q2 = quantile(cap_diameter, 0.50),
    Q3 = quantile(cap_diameter, 0.75),
    countagem = n()
  )
altura_estipe <- df %>%
  group_by(df$class) %>%
  filter(stem_height > 0) %>%
  summarise(
    média = mean(stem_height, na.rm = TRUE),
    mediana = median(stem_height,na.rm = TRUE),
    desvio= sd(stem_height, na.rm = TRUE),
    maxímo = max(stem_height, na.rm = TRUE),
    minímo = min(stem_height, na.rm = TRUE),
    amplitude = diff(range(stem_height, na.rm = TRUE)),
    variância = var(stem_height, na.rm = TRUE),
    coefiênte = (sd(stem_height)/mean(stem_height)) *100,
    Q1 = quantile(stem_height, 0.25),
    Q2 = quantile(stem_height, 0.50),
    Q3 = quantile(stem_height, 0.75),
    countagem = n()
  )


largura_estipe <- df %>%
  group_by(df$class) %>%
  filter(stem_width > 0) %>%
  summarise(
    média = mean(stem_width, na.rm = TRUE),
    mediana = median(stem_width, na.rm = TRUE),
    desvio =sd(stem_width, na.rm = TRUE),
    maxímo = max(stem_width, na.rm = TRUE),
    minímo = min(stem_width, na.rm = TRUE),
    amplitude = diff(range(stem_width, na.rm = TRUE)),
    variância = var(stem_width, na.rm = TRUE),
    coefiênte = (sd(stem_width)/mean(stem_width)) *100,
    Q1 = quantile(stem_width, 0.25),
    Q2 = quantile(stem_width, 0.50),
    Q3 = quantile(stem_width, 0.75),
    countagem = n()
  )

print(altura_estipe)
print(diametro_pileo)
print(largura_estipe)

tabela_diametro <- as.data.frame(t(diametro_pileo))
tabela_largura <- as.data.frame(t(largura_estipe))
tabela_altura <- as.data.frame(t(altura_estipe))

print(tabela_altura)
print(tabela_diametro)
print(tabela_largura)
