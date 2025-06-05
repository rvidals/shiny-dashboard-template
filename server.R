server <- function(input, output, session) {
  
  # Mostra o modal ao carregar o app
  observe({
    req(DEMO$relive_date, META$conf_org, META$conf_ano, META$local, META$site_oficial)
    
    showModal(
      modalDialog(
        title = paste0("Seja bem-vindo(a) ao ", META$conf_org),
        easyClose = TRUE,
        footer = modalButton("Fechar"),
        
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
  
  # --- Simula dados para o gráfico interativo Top 10 Regiões
  
  # Simula dados para o gráfico interativo Top 10 Regiões
  regioes <- c("Plano Piloto", "Taguatinga", "Ceilândia", "Guará", "Águas Claras", 
               "Samambaia", "Gama", "Sobradinho", "Núcleo Bandeirante", "Lago Sul")
  set.seed(123)
  valores <- round(runif(10, min = 0.7, max = 0.95), 3)
  df_top10 <- data.frame(Regiao = regioes, ISU = valores)
  
  output$plot_top10_interactive <- plotly::renderPlotly({
    p <- ggplot2::ggplot(
      df_top10, 
      ggplot2::aes(
        x = reorder(Regiao, ISU), 
        y = ISU, 
        fill = ISU, 
        text = paste0("<b>ISU:</b>", sprintf("%.3f", ISU))
        )
      ) +
      ggplot2::geom_col(show.legend = FALSE) +
      # ggplot2::coord_flip() +
      ggplot2::scale_fill_gradient(low = "#26b985", high = "#1e8f6f") +
      ggplot2::labs(x = NULL, y = NULL) +
      ggplot2::theme_minimal(base_size = 13) +
      ggplot2::theme(
        axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size = 11),
        axis.text.y = ggplot2::element_text(size = 11),
        plot.margin = grid::unit(c(0.2,0.2,0.2,0.2), "cm"))
    plotly::ggplotly(p, tooltip = "text") %>%
      config(displayModeBar = FALSE)  
    })
  
  # --- Gráfico de pizza "Classificação das RAs" com plotly
  output$plot_classificacao <- plotly::renderPlotly({
    
    df <- data.frame(
      Categoria = c("Excelente", "Bom", "Regular"),
      Qtd = c(4, 18, 13)
    )
    plot_ly(
      df,
      labels = ~Categoria,
      values = ~Qtd,
      type = "pie",
      textinfo = "label+percent",
      insidetextfont = list(color = "#FFF", size = 14),
      marker = list(colors = c("#28a745", "#007bff", "#fd7e14")),
      hoverinfo = "label+value+percent"
    ) %>%
      layout(
        margin = list(t = 0, b = 0, l = 0, r = 0),
        showlegend = FALSE
      ) %>%
      config(displayModeBar = FALSE)
  })
  
  # --- Top 5 regiões (mock)
  output$top5_regioes <- renderUI({
    regioes5 <- head(df_top10[order(-df_top10$ISU), ], 5)
    status <- ifelse(regioes5$ISU > 0.84, "Excelente", "Bom")
    tags$div(
      lapply(seq_len(nrow(regioes5)), function(i) {
        tags$div(
          class = "custom-list-item",
          if (i == 1) icon("trophy", class = "text-warning", style="margin-right:8px;") 
          else tags$span(paste0("#", i), style="width:24px;display:inline-block;margin-right:8px;color:#888;font-weight:bold;"),
          tags$div(
            tags$strong(regioes5$Regiao[i]), tags$br(),
            tags$span(style="font-size:12px;color:#888;", sprintf("ISU/DF: %.3f", regioes5$ISU[i]))
          ),
          tags$span(class = ifelse(status[i] == "Excelente", "badge-success", "badge-primary"),
                    style = "margin-left:auto;", status[i])
        )
      })
    )
  })
}