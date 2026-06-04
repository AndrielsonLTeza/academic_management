# Sistema de Gestão Acadêmica 🎓

Este é um aplicativo desenvolvido em Flutter para a gestão de cursos institucionais. O projeto adota uma arquitetura estruturada dividida em **Models, Repositories e Controllers**, utilizando o **SQLite** para garantir a persistência local dos dados em dispositivos móveis.

## 🚀 Funcionalidades Demonstradas

O aplicativo cobre o ciclo completo de gerenciamento de dados (CRUD):
* **Adicionar Curso:** Cadastro de cursos informando Nome, Duração (em semestres), Coordenador e Descrição.
* **Listar Cursos:** Exibição dinâmica dos cursos salvos diretamente do banco de dados.
* **Editar Curso:** Alteração de dados de registros existentes com atualização em tempo real.
* **Excluir Curso:** Remoção de registros com alerta de confirmação (`AlertDialog`) e feedback visual.
* **Persistência Local Permanente:** Os dados permanecem salvos com segurança no dispositivo mesmo após o fechamento completo do aplicativo[cite: 1].

---

## 🛠️ Tecnologias e Pacotes Utilizados

* **Flutter & Dart**
* **sqflite:** Para criação e gerenciamento do banco de dados relacional local.
* **path:** Para manipulação e localização correta dos caminhos de diretórios do banco no dispositivo.

---

## 📂 Estrutura do Projeto

A organização dos arquivos segue as boas práticas de separação de conceitos propostas para a atividade:

```
lib/
├── database/
│   └── app_database.dart      # Inicialização do SQLite e criação das tabelas
├── controllers/
│   └── course_controller.dart # Gerenciamento de estado da UI e regras de negócio
├── models/
│   └── course.dart            # Modelagem da entidade Curso e mapeamento Map/JSON
├── repositories/
│   └── course_repository.dart # Comunicação direta e consultas SQL ao banco de dados
├── views/
│   └── course_page.dart       # Interface do usuário (UI), formulários e listagem
└── main.dart                  # Ponto de entrada e inicialização do app
```


💻 Como Executar o Projeto
Como o banco de dados sqflite é focado em armazenamento nativo mobile, o projeto deve ser executado obrigatoriamente em um Emulador Android/iOS ou Celular Físico conectado via USB[cite: 1].

Clone o repositório:

```
   git clone [https://github.com/AndrielsonLTeza/academic_management.git](https://github.com/AndrielsonLTeza/academic_management.git)
   cd academic_management
```
Instale as dependências do Flutter:

```
   flutter pub get
```
Inicie o seu emulador configurado (Ex: Pixel_8_Pro):

```
   flutter emulators --launch Pixel_8_Pro
```
Execute o aplicativo no dispositivo móvel:


   flutter run
🤖 Uso de Inteligência Artificial (Atividade 2)
Este projeto contou com o auxílio de IA no processo de pareamento de código, refinamento da arquitetura local e diagnóstico de compatibilidade de plataformas (Web vs. Mobile).

Toda a documentação exigida contendo as diretrizes, prompts e reflexões críticas encontra-se organizada na pasta:

docs/ia/GUIDELINES.md

docs/ia/PROMPTS.md

docs/ia/REFLEXAO.md
