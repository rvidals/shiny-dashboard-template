server <- function(input, output, session) {
  
  # Mostra o modal ao carregar o app
  observe({
    req(DEMO$relive_date, META$conf_org, META$conf_ano, META$local, META$site_oficial)
    
    showModal(
      modalDialog(
        title = paste0("Seja bem-vindo(a) ao ", META$conf_org),
        easyClose = TRUE,
        footer = modalButton("Fechar"),
        
        # tags$p("Não, você não está preso em um ciclo temporal estilo ", tags$em("Russian Doll"), "!"),
        
        tags$p(
          
          str_to_sentence(strftime(DEMO$relive_date, "%A, %d de %B de %Y", tz = tz_global())),
          tags$br(),
          tags$br(),
          "Este dashboard é um ambiente de experiência imersiva para acessar os principais resultados do ",
          tags$strong(META$conf_org), 
          "(", tags$strong(META$conf_abbrev),")."
        ),
        
        tags$p("O ", META$conf_abbrev, "possui 9 indicadores de sustentabilidade que podem ser agrupados em:"),
        
        tags$ul(
          tags$li("Cobertura Vegetal"),
          tags$li("Conservação Hídrica"),
          tags$li("Regulação Climática")
        ),
        
        tags$p("Volte amanhã para reviver tudo de novo!"),
        
        tags$p(
          HTML("&mdash; Equipe da "),
          tags$a(href = META$site_oficial, target = "_blank", META$diretoria)
        )
      )
    )
  })
}
