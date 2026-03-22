# Repositórios

> **Versão:** 1.0.0 | **Data:** 2026-03-21 | **Status:** ✅ Aprovado

---

## Visão geral

O FluentLoop é dividido em três repositórios com responsabilidades bem separadas:

| Repositório | Tecnologia | URL |
|---|---|---|
| `fluentloop-docs` | MkDocs + Material | [github.com/goliverpro/fluentloop-docs](https://github.com/goliverpro/fluentloop-docs) |
| `fluentloop-core` | Python + FastAPI | [github.com/goliverpro/fluentloop-core](https://github.com/goliverpro/fluentloop-core) |
| `fluentloop-web` | Next.js + React | [github.com/goliverpro/fluentloop-web](https://github.com/goliverpro/fluentloop-web) |

---

## `fluentloop-core` — Backend

**Responsabilidade:** Toda a lógica de negócio e orquestração de serviços de IA.

```
fluentloop-core/
├── app/
│   ├── main.py           # FastAPI entry point, CORS, rate limiting
│   ├── config.py         # Settings via pydantic-settings (.env)
│   ├── db/
│   │   └── supabase.py   # Cliente Supabase singleton
│   ├── middleware/
│   │   └── auth.py       # Validação de JWT em toda requisição autenticada
│   ├── routers/          # Endpoints por domínio
│   │   ├── users.py      # GET /me, PATCH /me, PATCH /me/level
│   │   ├── sessions.py   # CRUD de sessões + encerramento
│   │   ├── chat.py       # POST /message (SSE streaming com Claude)
│   │   ├── speech.py     # POST /transcribe (Azure STT) + /tts (OpenAI)
│   │   ├── scenarios.py  # GET /scenarios
│   │   └── billing.py    # Stripe checkout + webhook
│   ├── services/         # Lógica de negócio e integrações externas
│   └── models/           # Schemas Pydantic (request/response)
├── tests/
├── .env.example
├── Dockerfile
└── requirements.txt
```

**O que NÃO faz:**
- Não serve assets estáticos
- Não gerencia autenticação (delega ao Supabase Auth)
- Não processa pagamentos diretamente (delega ao Stripe)

---

## `fluentloop-web` — Frontend

**Responsabilidade:** Interface do usuário e experiência de conversação.

```
fluentloop-web/
├── src/
│   ├── app/
│   │   ├── (auth)/           # Rotas públicas: login, cadastro
│   │   │   ├── login/
│   │   │   └── register/
│   │   ├── (app)/            # Rotas protegidas (requerem auth)
│   │   │   ├── dashboard/
│   │   │   ├── chat/
│   │   │   ├── history/
│   │   │   ├── profile/
│   │   │   └── scenarios/
│   │   ├── onboarding/       # Seleção de nível (pós-cadastro)
│   │   ├── layout.tsx        # Layout raiz
│   │   ├── page.tsx          # Landing page
│   │   └── globals.css
│   ├── components/
│   │   ├── ui/               # Primitivos: Button, Input, Badge, Modal
│   │   ├── chat/             # MessageBubble, CorrectionCard, ChatInput
│   │   ├── voice/            # PushToTalkButton, AudioPlayer, WaveVisualizer
│   │   └── layout/           # BottomNav, Header, PageWrapper
│   ├── lib/
│   │   ├── supabase.ts       # Cliente Supabase (browser)
│   │   └── api.ts            # Fetch wrapper com JWT automático
│   ├── hooks/                # useSession, useChat, useVoice, useAudio
│   └── types/
│       └── index.ts          # Tipos TypeScript de todo o domínio
├── tailwind.config.ts        # Design tokens do style guide
├── tsconfig.json
└── package.json
```

**O que NÃO faz:**
- Não chama APIs de IA diretamente (passa sempre pelo backend)
- Não guarda chaves de API (apenas as chaves públicas do Supabase e Stripe)

---

## Comunicação entre repositórios

```
fluentloop-web  ──HTTPS──►  fluentloop-core  ──►  Anthropic API
                                             ──►  Azure Speech
                                             ──►  OpenAI TTS
                                             ──►  Stripe

fluentloop-web  ──HTTPS──►  Supabase Auth (direto, sem passar pelo backend)
fluentloop-core ──────────►  Supabase DB + Storage (service role key)
```

**Regra importante:** O frontend nunca chama APIs de IA diretamente. Todo tráfego de IA passa pelo backend, onde ficam as chaves secretas e o rate limiting.

---

## Variáveis de ambiente

**`fluentloop-core` (Railway — nunca expostas):**

| Variável | Serviço |
|---|---|
| `SUPABASE_URL` + `SUPABASE_SERVICE_ROLE_KEY` | Supabase |
| `ANTHROPIC_API_KEY` | Claude |
| `AZURE_SPEECH_KEY` + `AZURE_SPEECH_REGION` | Azure Speech |
| `OPENAI_API_KEY` | OpenAI TTS |
| `STRIPE_SECRET_KEY` + `STRIPE_WEBHOOK_SECRET` | Stripe |

**`fluentloop-web` (Vercel — apenas chaves públicas):**

| Variável | Serviço |
|---|---|
| `NEXT_PUBLIC_SUPABASE_URL` + `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase |
| `NEXT_PUBLIC_API_URL` | Backend |
| `NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY` | Stripe |
