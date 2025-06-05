# ---- Fuso horário padrão ----
tz_global <- function() {
  "America/Sao_Paulo"
}

# ---- Função auxiliar: hoje com fuso horário ----
today_tz <- function() {
  lubridate::today(tzone = tz_global())
}

# ---- Datas base do evento ----
.workshop_start   <- as.Date("2025-06-03")
.conference_start <- as.Date("2025-06-04")

# ---- Informações da conferência / app ----
META <- list(
  conf_org     = "Índice de Sustentabilidade Urbana do Distrito Federal",
  conf_abbrev  = "ISU-DF",
  conf_ano     = 2025,
  conf_inicio  = .conference_start,
  conf_fim     = .conference_start + lubridate::days(2),
  local        = "Brasília - DF",
  autores      = c("Fulano", "Beltrano", "Ciclana"),
  site_oficial = "https://infodf.ipe.df.gov.br/",
  # twitter      = "@confincrivel",
  contato      = "coea@ipe.df.gov.br",
  diretoria    = "Diretoria de Pequisas Ambientais e Terrioriais (DPAT)",
  descricao    = "Dashboard interativo para navegação e exploração dos resultados do ISU-DF."
)

# ---- Configuração do modo DEMO ----
DEMO <- list(
  relive_date = today_tz()
)

# ---- Ajuste de datas com base no relive_date ----
if (!is.null(DEMO$relive_date)) {
  DEMO$adjust_days <-
    difftime(today_tz(), DEMO$relive_date, units = "days") %>%
    as.numeric() %>%
    ceiling()
  
  .workshop_start   <<- as.Date(.workshop_start + lubridate::days(DEMO$adjust_days))
  .conference_start <<- as.Date(.conference_start + lubridate::days(DEMO$adjust_days))
}
