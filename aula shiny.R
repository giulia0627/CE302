require(shiny)

ui<- fluidPage(
  #PAINEL DE TÍTULO DA PÁGINA
  titlePanel(""),
  #TIPO DE LAYOUT
  sidebarLayout(
    #PAINEL LATERAL
    sidebarPanel("Insira seus dados Pessoais",
                 textInput(inputId="nome",label="Nome:",value=""),
                 numericInput(inputId="peso",label="Peso (em kg):",value=""),
                 numericInput(inputId="altura",label="Altura (em cm):",value="")
    ),
    #PAINEL PRINCIPAL
    mainPanel("Resultado:",
              textOutput("onome"),
              textOutput("opeso"),
              textOutput("aaltura"),
              h4(textOutput("imc"))
    )
  )
)
server<-function(input,output){
  #CRIANDO OUTPUTS
  output$onome<-renderText(input$nome)
  output$opeso<-renderText(input$peso)
  output$aaltura<-renderText(input$altura)
  output$imc<-renderText({
    aux=round(as.numeric(input$peso)/(as.numeric(input$altura/100)^2),2)
    paste("O seu IMC é", aux, ".")
  })
#  output$grafico <- renderPlot({
#    x <- seq(24.9-3*4,5,24.9+3*4.5, length.out=500)
 #   plot(x,dnorm(x,24.9,4.5))
#  })
}
shinyApp(ui,server)
