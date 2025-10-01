alias KanbanLive.Repo
alias KanbanLive.Boards.{Workflow, Stage, Card}

# Limpa as tabelas na ordem correta para evitar erros de chave estrangeira
Repo.delete_all(Card)
Repo.delete_all(Stage)
Repo.delete_all(Workflow)

# --- Workflow 1: Processo de Contratação ---
{:ok, contratacao} =
  Repo.insert(%Workflow{
    name: "Processo de Contratação"
  })

{:ok, s1} = Repo.insert(%Stage{name: "Candidatura", workflow_id: contratacao.id, position: 1})
{:ok, s2} = Repo.insert(%Stage{name: "Triagem", workflow_id: contratacao.id, position: 2})

{:ok, s3} =
  Repo.insert(%Stage{name: "Entrevista Final", workflow_id: contratacao.id, position: 3})

{:ok, s4} = Repo.insert(%Stage{name: "Aprovado", workflow_id: contratacao.id, position: 4})

Repo.insert!(%Card{title: "Julia", stage_id: s1.id})
Repo.insert!(%Card{title: "Bruno", stage_id: s2.id})
Repo.insert!(%Card{title: "Ana", stage_id: s2.id})
Repo.insert!(%Card{title: "Fernanda", stage_id: s3.id})
Repo.insert!(%Card{title: "Ueslei", stage_id: s4.id})

# --- Workflow 2: Desenvolvimento de Features ---
{:ok, dev} =
  Repo.insert(%Workflow{
    name: "Desenvolvimento de Features"
  })

{:ok, s2_1} = Repo.insert(%Stage{name: "Backlog", workflow_id: dev.id, position: 1})
{:ok, s2_2} = Repo.insert(%Stage{name: "Análise", workflow_id: dev.id, position: 2})
{:ok, s2_3} = Repo.insert(%Stage{name: "Desenvolvimento", workflow_id: dev.id, position: 3})
{:ok, s2_4} = Repo.insert(%Stage{name: "Code Review", workflow_id: dev.id, position: 4})
{:ok, s2_5} = Repo.insert(%Stage{name: "Deploy", workflow_id: dev.id, position: 5})

Repo.insert!(%Card{title: "Implementar board Kanban", stage_id: s2_3.id})
Repo.insert!(%Card{title: "Adicionar autenticação de usuários", stage_id: s2_1.id})
Repo.insert!(%Card{title: "Criar tela de login", stage_id: s2_2.id})
Repo.insert!(%Card{title: "Corrigir bug na home", stage_id: s2_4.id})

# --- Workflow 3: Atendimento ao Cliente ---
{:ok, atendimento} =
  Repo.insert(%Workflow{
    name: "Atendimento ao Cliente"
  })

{:ok, s3_1} = Repo.insert(%Stage{name: "Solicitação", workflow_id: atendimento.id, position: 1})
{:ok, s3_2} = Repo.insert(%Stage{name: "Em Análise", workflow_id: atendimento.id, position: 2})

{:ok, s3_3} =
  Repo.insert(%Stage{name: "Aguardando Cliente", workflow_id: atendimento.id, position: 3})

{:ok, s3_4} = Repo.insert(%Stage{name: "Resolvido", workflow_id: atendimento.id, position: 4})

Repo.insert!(%Card{title: "Ticket #1023 - Erro ao emitir nota", stage_id: s3_2.id})
Repo.insert!(%Card{title: "Ticket #1024 - Dúvida sobre fatura", stage_id: s3_3.id})

IO.puts("Banco de dados populado com sucesso!")
