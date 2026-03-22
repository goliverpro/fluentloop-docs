# 🏗️ Arquitetura Técnica

> **Versão:** 1.0.0 | **Data:** 2026-03-21 | **Status:** 🔄 Em andamento

---

## Documentos desta seção

| Documento | Descrição | Status |
|---|---|---|
| [Overview Técnico](overview.md) | Stack, diagrama de componentes e fluxos de dados | ✅ |
| [SDD](sdd.md) | Diagramas de sequência, contratos de API, erros e ciclo de vida | ✅ |
| [Modelo de Dados](data-model.md) | Diagrama ER e descrição das tabelas | ✅ |
| [Repositórios](repositories.md) | Estrutura dos repositórios do projeto | ✅ |
| [ADRs](../adr/index.md) | Architecture Decision Records | 🔄 Em andamento |

---

## Stack resumida

| Camada | Tecnologia |
|---|---|
| Frontend | Next.js (React) — Vercel |
| Backend | Python + FastAPI — Railway |
| Banco de dados + Auth + Storage | Supabase (PostgreSQL) |
| LLM | Claude — Anthropic API |
| STT + Pronúncia | Azure Speech |
| TTS | OpenAI TTS |
| Pagamentos | Stripe |
