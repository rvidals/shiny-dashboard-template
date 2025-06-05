ui <- dashboardPage(
  dashboardHeader(title = "Dashboard Example"),
  
  dashboardSidebar(
    sidebarMenu(
      id = "menu",
      menuItem("Dashboard", tabName = "tab_dashboard", icon = icon("dashboard")),
      menuItem("Indicadores", tabName = "tab_high_score", icon = icon("tree")),
      menuItem("Ranking RAs", tabName = "tab_tweet_wall", icon = icon("stream")),
      menuItem("Sobre ISU-DF", tabName = "tab_pic_tweets", icon = icon("info"))
    )
  ),
  
  dashboardBody(
    tags$head(
      includeCSS("www/custom.css")
    ),
    tabItems(
      
      # ---- ABA DASHBOARD ----
      tabItem(tabName = "tab_dashboard",
              fluidRow(
                column(width = 4,
                       div(class = "card-custom",
                           div(class = "icon-circle", icon("medal")),
                           div(class = "title", "ISU/DF Médio"),
                           div(class = "value", "0.715"),
                           div(class = "desc", "Índice geral de sustentabilidade"),
                           div(class = "highlight", HTML('<i class="fa fa-arrow-up"></i> Base: 35 RAs'))
                       )
                ),
                column(width = 4,
                       div(class = "card-custom",
                           div(class = "icon-circle", icon("leaf")),
                           div(class = "title", "Áreas Verdes"),
                           div(class = "value", "0.539"),
                           div(class = "desc", "Cobertura vegetal urbana"),
                           div(class = "highlight", HTML('<i class="fa fa-arrow-down"></i> Um dos menores indicadores'))
                       )
                ),
                column(width = 4,
                       div(class = "card-custom",
                           div(class = "icon-circle", icon("tint")),
                           div(class = "title", "Conservação Hídrica"),
                           div(class = "value", "0.738"),
                           div(class = "desc", "Recarga de aquíferos"),
                           div(class = "highlight", HTML('<i class="fa fa-arrow-up"></i> Indicador intermediário'))
                       )
                )
              ),
              fluidRow(
                column(width = 4,
                       div(class = "card-custom",
                           div(class = "icon-circle", icon("sun")),
                           div(class = "title", "Evapotranspiração"),
                           div(class = "value", "0.557"),
                           div(class = "desc", "Regulação do microclima"),
                           div(class = "highlight", HTML('<i class="fa fa-arrow-up"></i> Proporcional às áreas verdes'))
                       )
                ),
                column(width = 4,
                       div(class = "card-custom",
                           div(class = "icon-circle", icon("tint")),
                           div(class = "title", "Consumo de Água"),
                           div(class = "value", "0.846"),
                           div(class = "desc", "Eficiência hídrica"),
                           div(class = "highlight", HTML('<i class="fa fa-arrow-up"></i> Bom desempenho geral'))
                       )
                ),
                column(width = 4,
                       div(class = "card-custom",
                           div(class = "icon-circle", icon("line-chart")),
                           div(class = "title", "Pegada de Carbono"),
                           div(class = "value", "0.908"),
                           div(class = "desc", "Emissões por habitante"),
                           div(class = "highlight", HTML('<i class="fa fa-arrow-up"></i> Melhor indicador do DF'))
                       )
                )
              ),
              fluidRow(
                column(
                  width = 4,
                  div(class = "card-custom",
                      div(class = "title card-title-large",
                          tagList(icon("chart-bar"), "Top 10 Regiões - ISU/DF")
                      ),
                      plotly::plotlyOutput("plot_top10_interactive", height = "180px")
                  )
                ),
                column(
                  width = 4,
                  div(class = "card-custom",
                      div(class = "title card-title-large",
                          tagList(icon("circle", class="text-success"), "Classificação das RAs")
                      ),
                      plotlyOutput("plot_classificacao", height = "220px"),
                      tags$div(
                        tags$span(style="color:#28a745;font-weight:bold", "Excelente"),
                        tags$span(style="color:#007bff;margin-left:10px;font-weight:bold", "Bom"),
                        tags$span(style="color:#fd7e14;margin-left:10px;font-weight:bold", "Regular")
                      )
                  )
                ),
                column(
                  width = 4,
                  div(class = "card-custom",
                      div(class = "title card-title-large",
                          tagList(icon("trophy", class="text-warning"), "Top 5 Regiões")
                      ),
                      uiOutput("top5_regioes")
                  )
                )
              ),
              # --------- Resumo dos Indicadores (por último, DENTRO do tabItem) ---------
              fluidRow(
                column(
                  width = 12,
                  tags$div(
                    style = "background: #fff; border-radius: 14px; padding: 28px 28px 18px 28px; box-shadow: 0 2px 12px rgba(0,0,0,0.07); margin-bottom: 32px;",
                    tags$h2("Resumo dos Indicadores", style = "font-weight: bold; font-size: 2rem;"),
                    tags$p("Médias do Distrito Federal por categoria", style = "color:#888; margin-bottom:28px;"),
                    fluidRow(
                      column(
                        width = 4,
                        tags$div(
                          style = "margin-bottom:24px;",
                          tags$span(icon("seedling", class = "fa-lg", style="color:#26b985; margin-right:8px;")),
                          tags$strong("Áreas Verdes"),
                          tags$div(
                            style = "font-size:14px; color:#888;",
                            "Índice: 0.539",
                            tags$span("53.9%", style="float:right; color:#26b985; font-weight:600;")
                          ),
                          tags$div(
                            style="background:#222; height:6px; border-radius:6px; margin:6px 0 6px 0; position:relative;",
                            tags$div(style="width:53.9%; background:#aaf4d2; height:6px; border-radius:6px;")
                          ),
                          tags$div("Cobertura vegetal em área urbana", style="font-size:13px; color:#b9b9b9;")
                        )
                      ),
                      column(
                        width = 4,
                        tags$div(
                          style = "margin-bottom:24px;",
                          tags$span(icon("tint", class = "fa-lg", style="color:#5f7cf9; margin-right:8px;")),
                          tags$strong("Recarga Hídrica"),
                          tags$div(
                            style = "font-size:14px; color:#888;",
                            "Índice: 0.738",
                            tags$span("73.8%", style="float:right; color:#5f7cf9; font-weight:600;")
                          ),
                          tags$div(
                            style="background:#222; height:6px; border-radius:6px; margin:6px 0 6px 0; position:relative;",
                            tags$div(style="width:73.8%; background:#dadfff; height:6px; border-radius:6px;")
                          ),
                          tags$div("Recarga de aquíferos", style="font-size:13px; color:#b9b9b9;")
                        )
                      ),
                      column(
                        width = 4,
                        tags$div(
                          style = "margin-bottom:24px;",
                          tags$span(icon("water", class = "fa-lg", style="color:#1db7c8; margin-right:8px;")),
                          tags$strong("Evapotranspiração"),
                          tags$div(
                            style = "font-size:14px; color:#888;",
                            "Índice: 0.557",
                            tags$span("55.7%", style="float:right; color:#1db7c8; font-weight:600;")
                          ),
                          tags$div(
                            style="background:#222; height:6px; border-radius:6px; margin:6px 0 6px 0; position:relative;",
                            tags$div(style="width:55.7%; background:#b5f2fa; height:6px; border-radius:6px;")
                          ),
                          tags$div("Regulação do microclima", style="font-size:13px; color:#b9b9b9;")
                        )
                      )
                    ),
                    fluidRow(
                      column(
                        width = 4,
                        tags$div(
                          style = "margin-bottom:24px;",
                          tags$span(icon("tint-slash", class = "fa-lg", style="color:#7647f9; margin-right:8px;")),
                          tags$strong("Consumo de Água"),
                          tags$div(
                            style = "font-size:14px; color:#888;",
                            "Índice: 0.846",
                            tags$span("84.6%", style="float:right; color:#7647f9; font-weight:600;")
                          ),
                          tags$div(
                            style="background:#222; height:6px; border-radius:6px; margin:6px 0 6px 0; position:relative;",
                            tags$div(style="width:84.6%; background:#e0d8fa; height:6px; border-radius:6px;")
                          ),
                          tags$div("Eficiência no uso da água", style="font-size:13px; color:#b9b9b9;")
                        )
                      ),
                      column(
                        width = 4,
                        tags$div(
                          style = "margin-bottom:24px;",
                          tags$span(icon("temperature-high", class = "fa-lg", style="color:#fa862c; margin-right:8px;")),
                          tags$strong("Temperatura"),
                          tags$div(
                            style = "font-size:14px; color:#888;",
                            "Índice: 0.612",
                            tags$span("61.2%", style="float:right; color:#fa862c; font-weight:600;")
                          ),
                          tags$div(
                            style="background:#222; height:6px; border-radius:6px; margin:6px 0 6px 0; position:relative;",
                            tags$div(style="width:61.2%; background:#ffe7c7; height:6px; border-radius:6px;")
                          ),
                          tags$div("Controle térmico urbano", style="font-size:13px; color:#b9b9b9;")
                        )
                      ),
                      column(
                        width = 4,
                        tags$div(
                          style = "margin-bottom:24px;",
                          tags$span(icon("bolt", class = "fa-lg", style="color:#a847f9; margin-right:8px;")),
                          tags$strong("Pegada de Carbono"),
                          tags$div(
                            style = "font-size:14px; color:#888;",
                            "Índice: 0.908",
                            tags$span("90.8%", style="float:right; color:#a847f9; font-weight:600;")
                          ),
                          tags$div(
                            style="background:#222; height:6px; border-radius:6px; margin:6px 0 6px 0; position:relative;",
                            tags$div(style="width:90.8%; background:#efd5fb; height:6px; border-radius:6px;")
                          ),
                          tags$div("Emissões per capita", style="font-size:13px; color:#b9b9b9;")
                        )
                      )
                    )
                  )
                )
              )
      ),
      
      tabItem(tabName = "tab_tweet_wall",
              h2("Conteúdo do Ranking RAs")
      ),
      
      tabItem(tabName = "tab_pic_tweets",
              h2("Conteúdo Sobre ISU-DF")
      )
    )
  )
)