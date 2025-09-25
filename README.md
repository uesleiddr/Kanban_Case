# Case Técnico – Sistema Kanban

Este repositório contém o case técnico desenvolvido para o processo seletivo da **Distu**.  
O objetivo é criar um **sistema Kanban** que permita gerenciar diferentes tipos de processos através de **workflows personalizados**.

---

##  Épico
Criar um sistema Kanban que permita gerenciar workflows personalizados.

---

##  Plano de Trabalho

### Etapa 1 — Configuração inicial do projeto + Banco de Dados
- Criar projeto Phoenix (`mix phx.new kanban_app`)
- Instalar dependências (`mix deps.get`)
- Configurar **PostgreSQL** no projeto (ajustes em `config/dev.exs`)
- Criar e migrar banco vazio (`mix ecto.create`)
- Rodar servidor local (`mix phx.server`)

**Entregável:** Projeto Phoenix rodando em localhost com banco configurado e pronto para receber migrations.

---

### Etapa 2 — Estrutura da aplicação
- Criar módulo **LiveView** para exibir workflows
- Definir **dados mockados** para workflows e tarefas (sem persistência inicial)

**Entregável:** Página inicial exibindo workflows mockados com suas etapas.

---

### Etapa 3 — Protótipo da interface
- Criar **layout estilo Kanban** (colunas representando etapas e cards representando tarefas)
- Adicionar estilização básica com **TailwindCSS**

**Entregável:** Protótipo navegável da tela de workflows em formato Kanban.

---

### Etapa 4 — Persistência e integração com banco
- Criar migrations para **Workflows**, **Stages** e **Tarefas**
- Adaptar **LiveView** para carregar dados diretamente do banco
- Popular banco com **seeds** de exemplo para a demo

**Entregável:** Workflows persistidos e exibidos dinamicamente no Board.

---

### Etapa 5 — Funcionalidades adicionais
- Criar **CRUD** de workflows
- Adicionar **CRUD** de tarefas
- Implementar movimentação simples de tarefas entre colunas (botões ← / →)
- Adicionar testes unitários básicos para contextos (Ecto)

**Entregável:** Sistema Kanban funcional com persistência e movimentação de tarefas.

---

### Próximas evoluções (roadmap futuro)
- Implementar **drag & drop** de tarefas entre colunas  
- Criar sistema de **usuários e permissões**  
- Adicionar histórico de movimentações (auditoria)  
- Explorar integrações externas via **API**  

---

## 🛠️ Tecnologias utilizadas
- **Elixir** (linguagem)
- **Phoenix Framework**
- **Phoenix LiveView**
- **TailwindCSS**
- **PostgreSQL + Ecto**
