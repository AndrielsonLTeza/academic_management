# Diretrizes de Uso de IA

Este documento descreve as regras e combinados estabelecidos com a Inteligência Artificial para guiar o desenvolvimento do Sistema Acadêmico.

* **Foco no Escopo:** A IA deve se restringir aos requisitos de gerenciamento acadêmico e persistência local com SQLite, utilizando a arquitetura simplificada (Repository/Controller).
* **Validação de Ambiente:** Sempre validar se a execução está sendo direcionada para emuladores móveis ou dispositivos físicos, alertando sobre a incompatibilidade nativa do `sqflite` com ambientes Web.
* **Mensagens e Feedback:** Toda operação de escrita (inserção, edição e exclusão) deve obrigatoriamente retornar um feedback visual ao usuário via SnackBar ou Dialog de confirmação.