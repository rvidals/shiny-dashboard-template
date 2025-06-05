# 📊 Dashboard Simples com Shiny

Este repositório contém um projeto de dashboard interativo desenvolvido com o pacote [`shiny`](https://shiny.posit.co/) do R. A aplicação foi construída com base na separação de componentes (`ui.R`, `server.R`, `global.R`), promovendo organização, reuso e escalabilidade do código.

## 🚀 Tecnologias Utilizadas

- **R** (versão ≥ 4.0)
- **Shiny** — Aplicações web interativas com R
- **Estrutura modular com** `ui.R`, `server.R`, `global.R` e `00_settings.R`
- **Pacotes auxiliares**: `tidyverse`, `lubridate`, `shiny`, `shinydashboard`, entre outros

## 📁 Estrutura do Projeto

```text
📦 dashboard-shiny
├── 00_settings.R       # Definições globais de configurações e opções
├── app.R               # Inicializa a aplicação Shiny (carrega ui e server)
├── global.R            # Pré-processamento de dados e variáveis globais
├── server.R            # Lógica do servidor (back-end)
├── ui.R                # Interface do usuário (front-end)
├── data/               # Diretório de dados utilizados (opcional)
├── www/                # Arquivos estáticos (imagens, CSS, JS)
└── README.md           # Este arquivo
```

## ▶️ Como Executar

1. Clone este repositório:
   ```bash
   git clone https://github.com/rvidals/dashboard-shiny.git
   ```
   
2. Abra o projeto no RStudio.

3. Execute a aplicação rodando o app.R:

```bash
shiny::runApp()
```

Dica: certifique-se de que todos os pacotes necessários estão instalados.

---

## 🎯 Objetivos
Apresentar uma estrutura limpa e escalável para desenvolvimento com Shiny

Facilitar a leitura e manutenção do código

Servir como ponto de partida para dashboards mais completos

## 🌱 Próximos Passos
Melhorar responsividade da interface

Adicionar funcionalidades interativas (filtros, uploads, exportações)

Organizar scripts em módulos (se necessário)

Documentar funções específicas (caso existam)

## 🤝 Contribuições

Sinta-se à vontade para abrir issues, sugerir melhorias ou compartilhar dashboards inspiradores! 🚀

---

## 📩 Contato

👤 **Rogerio Vidal de Siqueira**  
📧 rogerio.siqueira@ipe.df.gov.br  
🔗 [LinkedIn](https://www.linkedin.com/in/rogerio-vidal-de-siqueira-9478aa136/) | [GitHub](https://github.com/rvidals)
