# Case Técnico – Sistema Kanban

Este repositório contém o case técnico desenvolvido para o processo seletivo da Distu.  
O objetivo é criar um sistema Kanban que permita gerenciar diferentes tipos de processos através de workflows personalizados.

---

## Épico
Criar um sistema Kanban que permita gerenciar workflows personalizados com persistência real de dados.

---

## Plano de Trabalho

### Etapa 1 — Configuração inicial do projeto + Banco de Dados
- Criar projeto Phoenix LiveView: `mix phx.new kanban_live --live --database postgres`
- Instalar dependências: `mix deps.get`
- Configurar PostgreSQL no projeto (`config/dev.exs`)
- Criar e migrar banco vazio: `mix ecto.create`
- Rodar servidor local: `mix phx.server`

**Entregável:** Projeto Phoenix rodando em localhost com banco configurado.

---

### Etapa 2 — Estrutura de dados e migrations
- Criar contextos e schemas para:
  - `Workflow` (nome)  
  - `Stage` (nome, posição, workflow_id)  
  - `Card` (título, posição, stage_id)  
- Criar migrations correspondentes e migrar banco

**Entregável:** Banco estruturado com migrations para Workflows, Stages e Cards.

---

### Etapa 3 — Popular banco de dados
- Criar `seeds.exs` para popular o banco com exemplos reais de workflows, stages e cards
- Rodar `mix ecto.setup` para limpar e popular tabelas

**Entregável:** Banco com dados persistentes prontos para uso na interface.

---

### Etapa 4 — Implementação do LiveView
- Criar LiveView `BoardLive` para exibir os workflows com suas stages e cards
- Carregar dados do banco em tempo real com `Repo.all` e `preload`
- Implementar movimentação de cards entre stages usando botões (`phx-click`)
- Ordenar stages e cards por posição para manter consistência visual

**Entregável:** Interface Kanban totalmente funcional, com dados persistentes e movimentação de cards.

---

### Etapa 5 — Estilização
- Criar layout Kanban com colunas representando stages e cards
- Adicionar cores e estilos diferentes para cada stage com TailwindCSS

**Entregável:** Interface agradável, clara e navegável, refletindo os dados reais do banco.

---

## Roadmap Futuro
- Drag & drop de cards entre colunas  
- Sistema de usuários e permissões  
- Histórico de movimentações (auditoria)  
- Integrações externas via API

---

##  Tecnologias Utilizadas
- Elixir  
- Phoenix Framework  
- Phoenix LiveView  
- TailwindCSS  
- PostgreSQL + Ecto
