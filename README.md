# Case Técnico – Sistema Kanban

Este repositório contém o case técnico desenvolvido para o processo seletivo da **Distu**.  
O objetivo é criar um **sistema Kanban** que permita gerenciar diferentes tipos de processos através de **workflows personalizados**.

---

## Épico
Criar um sistema Kanban que permita gerenciar workflows personalizados.

---

## Plano de Trabalho

### Etapa 1 — Configuração inicial do projeto
- Criar projeto Phoenix (`mix phx.new kanban_app`)
- Instalar dependências (`mix deps.get`)
- Rodar servidor local (`mix phx.server`)  
**Entregável:** Projeto Phoenix rodando em localhost.

---

### Etapa 2 — Estrutura da aplicação
- Criar módulo **LiveView** para exibir workflows.
- Definir **dados mockados** (sem banco de dados, inicialmente).  
**Entregável:** Tela inicial mostrando workflows e suas etapas.

---

### Etapa 3 — Protótipo da interface
- Criar **layout de colunas Kanban** para visualizar etapas.
- Adicionar estilos básicos (**Tailwind**).  
**Entregável:** Protótipo navegável da tela de workflows.

---

### Etapa 4 — Banco de dados
- Configurar **PostgreSQL** com **Ecto**.
- Criar tabelas para workflows e tarefas.
- Exibir dados do banco no LiveView.  
**Entregável:** Workflows persistidos no banco.

---

### Etapa 5 — Incrementos futuros
- Criar **CRUD** de workflows.
- Adicionar **CRUD** de tarefas.
- Implementar **drag & drop** das tarefas entre colunas.  
**Entregável:** Sistema Kanban funcional e dinâmico.

---

## 🛠️ Tecnologias utilizadas
- **Elixir** (linguagem)
- **Phoenix Framework** (backend + frontend)
- **Phoenix LiveView** (interface em tempo real)
- **TailwindCSS** (estilização)
- **PostgreSQL + Ecto** (persistência, opcional)
