# 📋 Decisões do Projeto FluentLoop

> Arquivo de referência para retomada de contexto.
> Atualize este arquivo a cada decisão relevante tomada.

---

## Como usar este arquivo

Ao iniciar uma nova sessão com a IA, compartilhe este arquivo e diga:
> *"Estamos construindo o FluentLoop. Leia o DECISIONS.md e me ajude a continuar de onde paramos."*

---

## Visão Geral do Produto

**O que é:** App web de prática de conversação em inglês com IA, voltado para brasileiros no nível intermediário (B1–B2) que travam na hora de falar.

**Diferencial:** Foca em conversação real — fala, escuta e escrita — não em vocabulário ou gamificação.

**Público-alvo principal:** Analistas de TI, designers, profissionais que precisam de inglês no trabalho ou em viagens. Nível B1–B2.

---

## Decisões de Produto

### DP-01 — Três pilares no MVP (não pós-MVP)
**Decisão:** Escrita, Fala e Compreensão fazem parte do MVP.
**Motivo:** Só texto não quebra o platô do B1. O produto precisa treinar as três habilidades desde o início.
**Impacto:** STT, TTS e feedback de pronúncia são Must Have, não Won't Have.

### DP-02 — Nivelamento adaptativo obrigatório
**Decisão:** A IA adapta vocabulário, complexidade e ritmo ao nível do usuário (A2/B1/B2).
**Motivo:** Sem progressão, o app vira chatbot genérico. O nível é coletado no onboarding e monitorado por taxa de erros.
**Critério de avanço:** 5 sessões consecutivas com taxa de erro abaixo de 20%.

### DP-03 — Modelo Freemium
**Decisão:** Free (10 interações/dia, 2 cenários) e Pro (R$29,90/mês ou R$249,00/ano, ilimitado).
**Motivo:** Reduz barreira de entrada e monetiza usuários engajados.
**Detalhe:** O plano Free inclui todos os pilares (escrita, fala, compreensão), mas com limite diário.

### DP-04 — Cenários de Roleplay no MVP
**Decisão:** 3 cenários no lançamento: Check-in em hotel, Daily standup em inglês, Small talk casual.
**Motivo:** Cobre os três contextos mais citados pelas personas (trabalho, viagem, dia a dia).

### DP-05 — Feedback de pronúncia palavra a palavra
**Decisão:** O sistema identifica quais palavras específicas foram pronunciadas incorretamente.
**Motivo:** Feedback genérico ("você errou") não ajuda. O usuário precisa saber exatamente onde errou.

### DP-06 — Controle de velocidade no áudio da IA
**Decisão:** O usuário pode ouvir a resposta da IA em velocidade normal ou lenta.
**Motivo:** Compreensão auditiva é uma habilidade separada da conversação. Velocidade lenta é essencial para iniciantes.

### DP-07 — Escolha de sotaque da IA
**Decisão:** Americano ou Britânico (Could Have — não bloqueia MVP).
**Motivo:** Demanda real, mas não crítica para o lançamento.

### DP-08 — Interface: Web App → PWA (sem mobile nativo no MVP)
**Decisão:** Web App com Next.js primeiro, PWA na sequência. Mobile nativo fora do escopo do MVP.
**Motivo:** Mobile nativo é alto investimento para validar o produto. Next.js resolve web, PWA e landing page num único codebase. PWA com microfone atende os três pilares sem fricção.

---

## Decisões Técnicas

### DT-01 — Backend: Python + FastAPI
- **Status:** ✅ Decidido
- **Alternativa considerada:** Java (Spring Boot)
- **Motivo:** Backend 90% I/O bound — orquestra chamadas para LLM, STT e TTS. O asyncio do Python lida com alto throughput sem que a vantagem de performance do Java seja relevante. Ecossistema Python para IA é dominante.
- **Sobre escalabilidade:** Escala horizontalmente sem problema. O gargalo real serão custos e rate limits das APIs de IA. Componentes críticos podem ser extraídos como microsserviços futuramente.

### DT-02 — Frontend: Next.js (React)
- **Status:** ✅ Decidido
- **Motivo:** Resolve web app, PWA e landing page de marketing num único projeto. SEO nativo para aquisição orgânica. Caminho natural para PWA sem reescrita.

### DT-03 — Banco de Dados: Supabase (PostgreSQL)
- **Status:** ✅ Decidido
- **Alternativas consideradas:** MySQL/RDS (AWS), MongoDB
- **Motivo:** Entrega PostgreSQL + Auth (e-mail e Google OAuth) + Storage de áudio num único serviço. Free tier generoso cobre o MVP inteiro sem custo. Gabriel tem familiaridade com MySQL — a diferença no SQL do dia a dia é mínima.
- **Nota:** Se houver tração e receita, avaliar migração para RDS MySQL na AWS.

### DT-04 — Auth: Supabase Auth
- **Status:** ✅ Decidido
- **Motivo:** Incluso no Supabase. Suporta e-mail/senha e Google OAuth prontos, sem configuração adicional.

### DT-05 — LLM: Claude (Anthropic API)
- **Status:** ✅ Decidido
- **Alternativas consideradas:** GPT-4o (OpenAI), Gemini (Google), Claude via Amazon Bedrock
- **Motivo:** Melhor para instrução nuançada — corrigir erros sem interromper conversa, adaptar nível, assumir personagens, manter contexto longo. Anthropic API direto (sem Bedrock) para evitar custo adicional de infraestrutura AWS no MVP.

### DT-06 — STT + Pronúncia: Azure Speech
- **Status:** ✅ Decidido
- **Alternativas consideradas:** OpenAI Whisper, Amazon Transcribe, Deepgram
- **Motivo:** Único serviço com pronunciation assessment nativo (score por palavra e por fonema) — requisito central dos RFs 50 e 51. Amazon Transcribe não tem esse recurso. 5h/mês gratuitas para MVP.

### DT-07 — TTS: OpenAI TTS
- **Status:** ✅ Decidido
- **Alternativas consideradas:** ElevenLabs, Amazon Polly, Azure TTS
- **Motivo:** Melhor custo-benefício — voz neural de qualidade, barato ($15/1M caracteres), fácil integração. ElevenLabs tem qualidade superior mas é caro para escala. Reavaliação possível pós-MVP se qualidade for feedback recorrente.

### DT-08 — Pagamentos: Stripe
- **Status:** ✅ Decidido
- **Motivo:** Padrão do mercado, SDK robusto, suporte a assinaturas recorrentes e webhooks. Gratuito até processar pagamentos.

### DT-09 — Deploy Frontend: Vercel
- **Status:** ✅ Decidido
- **Motivo:** Next.js é desenvolvido pela Vercel — integração nativa, deploy automático por push, free tier generoso para MVP.

### DT-10 — Deploy Backend: Railway
- **Status:** ✅ Decidido
- **Motivo:** Free tier disponível, suporte a containers Python/FastAPI, simples de configurar. Alternativa: Render.

---

## Stack Final — MVP

| Camada | Tecnologia | Custo MVP |
|---|---|---|
| Frontend | Next.js | Grátis (Vercel) |
| Backend | Python + FastAPI | Grátis (Railway) |
| Banco de dados + Auth + Storage | Supabase | Grátis (free tier) |
| LLM | Claude (Anthropic API) | Pay per use |
| STT + Pronúncia | Azure Speech | 5h/mês grátis |
| TTS | OpenAI TTS | Pay per use |
| Pagamentos | Stripe | Grátis até processar |
| DDoS / WAF / CDN | Cloudflare | Grátis |

---

## Estado Atual da Documentação

| Fase | Documento | Status |
|---|---|---|
| Visão do produto | `docs/product/vision.md` | ✅ Concluído |
| Personas | `docs/product/personas.md` | ✅ Concluído |
| Roadmap | `docs/product/roadmap.md` | ✅ Concluído |
| Requisitos funcionais | `docs/requirements/functional.md` | ✅ Concluído |
| Requisitos não-funcionais | `docs/requirements/non-functional.md` | ✅ Concluído |
| Casos de uso | `docs/requirements/use-cases.md` | ✅ Concluído |
| Arquitetura técnica | `docs/architecture/` | 🔄 Em andamento |
| Design e wireframes | `docs/design/` | ⏳ Pendente |
| Testes | `docs/testing/` | ⏳ Pendente |
| Deploy | `docs/deployment/` | ⏳ Pendente |

---

## Repositórios

- **Docs:** https://github.com/goliverpro/fluentloop-docs
- **Core (backend + IA):** a criar — `fluentloop-core`
- **Web (frontend):** a criar — `fluentloop-web`

---

## Próximos Passos

1. **Arquitetura Técnica** — diagrama de componentes, fluxo de dados, modelo de dados
2. **Design / Wireframes** — fluxos de tela e protótipo
3. **Criação dos repositórios** de código (`fluentloop-core` e `fluentloop-web`)
