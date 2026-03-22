# Visão Geral da Arquitetura

> **Versão:** 1.0.0 | **Data:** 2026-03-21 | **Status:** ✅ Aprovado

---

## Stack Tecnológica

| Camada | Tecnologia | Justificativa |
|---|---|---|
| Frontend | Next.js (React) | Web app + PWA + landing page num único projeto, SEO nativo |
| Backend | Python + FastAPI | I/O bound, ecossistema AI nativo, asyncio para alto throughput |
| Banco de dados | Supabase (PostgreSQL) | DB + Auth + Storage no free tier, sem overhead de infra |
| Auth | Supabase Auth | E-mail/senha e Google OAuth inclusos |
| LLM | Claude — Anthropic API | Melhor para instrução nuançada, contexto longo, adaptação de nível |
| STT + Pronúncia | Azure Speech | Único com pronunciation assessment nativo por palavra e fonema |
| TTS | OpenAI TTS | Voz neural, custo baixo, fácil integração |
| Pagamentos | Stripe | Padrão de mercado para assinaturas recorrentes |
| Deploy Frontend | Vercel | Integração nativa com Next.js, free tier generoso |
| Deploy Backend | Railway | Free tier para MVP, suporte a containers FastAPI |

---

## Diagrama de Componentes

```
┌─────────────────────────────────────────────────────────┐
│                      USUÁRIO                            │
│              Browser / PWA (mobile)                     │
└────────────────────────┬────────────────────────────────┘
                         │ HTTPS
┌────────────────────────▼────────────────────────────────┐
│                   FRONTEND                              │
│              Next.js — Vercel                           │
│                                                         │
│  ┌─────────────┐  ┌──────────────┐  ┌───────────────┐  │
│  │  Chat UI    │  │  Roleplay UI │  │  Histórico UI │  │
│  └─────────────┘  └──────────────┘  └───────────────┘  │
└────────────────────────┬────────────────────────────────┘
                         │ REST / WebSocket
┌────────────────────────▼────────────────────────────────┐
│                   BACKEND                               │
│            Python + FastAPI — Railway                   │
│                                                         │
│  ┌──────────────┐  ┌─────────────┐  ┌───────────────┐  │
│  │ Chat Service │  │ STT Service │  │ TTS Service   │  │
│  └──────┬───────┘  └──────┬──────┘  └───────┬───────┘  │
│         │                 │                  │          │
│  ┌──────▼───────┐  ┌──────▼──────┐  ┌───────▼───────┐  │
│  │ LLM Service  │  │ Pronunciation│  │  Audio Store  │  │
│  │  (Claude)   │  │  Assessment  │  │   (Supabase)  │  │
│  └─────────────┘  └─────────────┘  └───────────────┘  │
└──────┬──────────────────┬───────────────────┬──────────┘
       │                  │                   │
┌──────▼──────┐  ┌────────▼────────┐  ┌───────▼──────────┐
│  Anthropic  │  │  Azure Speech   │  │   OpenAI TTS     │
│     API     │  │  STT + Pronúncia│  │                  │
└─────────────┘  └─────────────────┘  └──────────────────┘
       │
┌──────▼──────────────────────────────────────────────────┐
│                    SUPABASE                             │
│          PostgreSQL + Auth + Storage                    │
│                                                         │
│  ┌─────────────┐  ┌──────────────┐  ┌───────────────┐  │
│  │   Users     │  │   Sessions   │  │  Audio Files  │  │
│  │   Plans     │  │   Messages   │  │  (Storage)    │  │
│  └─────────────┘  └──────────────┘  └───────────────┘  │
└─────────────────────────────────────────────────────────┘
       │
┌──────▼──────┐
│   Stripe    │
│ Pagamentos  │
└─────────────┘
```

---

## Fluxo de Dados — Conversa por Texto

```
1. Usuário digita mensagem → Frontend
2. Frontend → POST /chat/message → Backend
3. Backend monta prompt com: histórico + nível + persona do cenário
4. Backend → Anthropic API (Claude) → resposta + correções
5. Backend salva mensagem + correções no Supabase
6. Backend → Frontend (streaming da resposta)
7. Frontend exibe resposta da IA + correção abaixo da mensagem do usuário
```

---

## Fluxo de Dados — Conversa por Voz

```
1. Usuário fala → Frontend captura áudio via microfone (Web Audio API)
2. Frontend → POST /speech/transcribe → Backend (áudio em chunks)
3. Backend → Azure Speech (STT + Pronunciation Assessment)
4. Azure retorna: transcrição + score por palavra + erros de pronúncia
5. Backend → Frontend: exibe transcrição para o usuário confirmar
6. Usuário confirma → Backend processa como mensagem de texto (fluxo acima)
7. Erros de pronúncia são exibidos junto com a correção gramatical
```

---

## Fluxo de Dados — Resposta em Áudio (TTS)

```
1. Backend recebe resposta da Claude (texto)
2. Backend → OpenAI TTS API → áudio gerado
3. Backend salva áudio temporariamente no Supabase Storage
4. Backend → Frontend: URL assinada do áudio
5. Frontend reproduz áudio com controles de velocidade (normal / lento)
```

---

## Separação de Responsabilidades

| Camada | Responsabilidade |
|---|---|
| Frontend (Next.js) | UI, captura de áudio, reprodução de áudio, autenticação via Supabase client |
| Backend (FastAPI) | Orquestração dos serviços de IA, rate limiting, lógica de negócio, persistência |
| Supabase | Persistência de dados, autenticação, storage de arquivos de áudio |
| Claude | Geração de resposta conversacional, correção de erros, adaptação de nível |
| Azure Speech | Transcrição de voz, avaliação de pronúncia |
| OpenAI TTS | Síntese de voz para respostas da IA |
| Stripe | Processamento de pagamentos, gestão de assinaturas via webhooks |

---

## Decisões de Arquitetura

| Decisão | Escolha | Motivo |
|---|---|---|
| Comunicação chat | REST + Streaming (SSE) | Simples, suportado nativamente pelo FastAPI e Next.js |
| Comunicação áudio | REST multipart | Áudio é enviado como arquivo, não requer WebSocket |
| Armazenamento de áudio TTS | Supabase Storage (temporário) | Evita reprocessar TTS para o mesmo conteúdo |
| Rate limiting | Backend (FastAPI middleware) | Controle centralizado por usuário e plano |
| Autenticação | JWT via Supabase | Frontend autentica direto no Supabase, backend valida o token |
