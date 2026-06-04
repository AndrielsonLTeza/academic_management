# Registro de Prompts e Interações

Histórico das principais interações e comandos utilizados no auxílio do desenvolvimento da aplicação.

## 1. Configuração de Arquitetura e Banco de Dados
* **Contexto:** Inicialização do banco de dados SQLite e definição do fluxo de dados com Repository e Controller para a entidade de Cursos.
* **Prompt:** *"e o banco?"*
* **Resultado:** Explicação detalhada do fluxo do arquivo `app_database.dart` com o método `_onCreate` e o fluxo de inserção automatizado.

## 2. Correção de Ambiente de Execução (Web vs Mobile)
* **Contexto:** O aplicativo estava executando em ambiente Web (`localhost`), gerando incompatibilidade com o pacote `sqflite`.
* **Prompt:** Envio de capturas de tela demonstrando o log de dispositivos e emuladores disponíveis.
* **Resultado:** Identificação do erro de plataforma e orientação passo a passo para inicializar o emulador Android `Pixel_8_Pro` via terminal (`flutter emulators --launch Pixel_8_Pro`) e forçar a execução no alvo móvel correto.