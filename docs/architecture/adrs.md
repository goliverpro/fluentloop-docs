# Decisões de Arquitetura (ADRs)

> **Versão:** 1.0.0 | **Data:** 2026-03-21 | **Status:** ✅ Aprovado

---

## ADR-001 — Framework Frontend

**Status:** ✅ Decidido
**Data:** 2026-03-21

### Decisão
Next.js 14 (App Router) com TypeScript e Tailwind CSS.

### Contexto
Precisávamos de um framework que cobrisse web app, PWA e landing page de marketing sem projetos separados.

### Alternativas consideradas
- React puro (Vite/CRA)
- Vue.js / Nuxt
- Remix

### Motivo da escolha
Next.js é desenvolvido pela Vercel — integração nativa, deploy automático por push e free tier generoso. App Router resolve SSR/SSG/CSR por rota. SEO nativo para aquisição orgânica. Caminho natural para PWA sem reescrita.

### Consequências
- Frontend, landing page e PWA em um único codebase.
- Deploy gratuito na Vercel durante o MVP.
- Mobile nativo avaliado apenas após tração (pós-Fase 3).

---

## ADR-002 — Banco de Dados e Auth

**Status:** ✅ Decidido
**Data:** 2026-03-21

### Decisão
Supabase (PostgreSQL + Auth + Storage).

### Contexto
Precisávamos de banco relacional, autenticação (e-mail + Google OAuth) e storage de áudio sem custo no MVP.

### Alternativas consideradas
- MySQL/RDS (AWS)
- MongoDB Atlas
- PlanetScale

### Motivo da escolha
Supabase entrega PostgreSQL + Auth + Storage em um único serviço com free tier que cobre o MVP inteiro. Gabriel tem familiaridade com MySQL — a diferença no SQL do dia a dia é mínima. RDS na AWS não tem free tier para escala de produção.

### Consequências
- Sem custo de banco durante o MVP.
- RLS (Row Level Security) nativo para segurança por linha.
- Se houver tração e receita, avaliar migração para RDS MySQL na AWS.

---

## ADR-003 — Provedor de LLM

**Status:** ✅ Decidido
**Data:** 2026-03-21

### Decisão
Claude (Anthropic API direta, sem Amazon Bedrock).

### Contexto
O LLM é o núcleo do produto — precisa corrigir erros sem interromper a conversa, adaptar nível, manter personagens e contexto longo.

### Alternativas consideradas
- GPT-4o (OpenAI)
- Gemini (Google)
- Claude via Amazon Bedrock

### Motivo da escolha
Claude é superior para instrução nuançada e contexto longo — características essenciais para um tutor de inglês. Anthropic API direta evita o custo adicional de infraestrutura AWS (Bedrock) no MVP.

### Consequências
- Pay per use — sem free tier, mas custo proporcional ao uso real.
- SSE (Server-Sent Events) para streaming das respostas em tempo real.

---

## ADR-004 — STT e Avaliação de Pronúncia

**Status:** ✅ Decidido
**Data:** 2026-03-21

### Decisão
Azure Speech Services (STT + Pronunciation Assessment).

### Contexto
O produto exige feedback de pronúncia palavra a palavra — não apenas transcrição.

### Alternativas consideradas
- OpenAI Whisper
- Amazon Transcribe
- Deepgram

### Motivo da escolha
Azure Speech é o único serviço com pronunciation assessment nativo (score por palavra e por fonema), que é requisito central do produto. Amazon Transcribe não tem esse recurso. 5 horas/mês gratuitas cobrem o MVP.

### Consequências
- Feedback de pronúncia detalhado (score por palavra) disponível desde o MVP.
- Dependência do Azure — monitorar custos após free tier.

---

## ADR-005 — TTS (Text-to-Speech)

**Status:** ✅ Decidido
**Data:** 2026-03-21

### Decisão
OpenAI TTS.

### Contexto
O pilar de Compreensão exige síntese de voz de alta qualidade para o usuário treinar escuta.

### Alternativas consideradas
- ElevenLabs
- Amazon Polly
- Azure TTS

### Motivo da escolha
Melhor custo-benefício: voz neural de qualidade, $15/1M caracteres, fácil integração. ElevenLabs tem qualidade superior mas é caro para escala. Áudio cacheado por sha256(texto+voz) por 24h para reduzir custos.

### Consequências
- TTS de qualidade com custo proporcional ao uso.
- Cache de áudio reduz chamadas repetidas significativamente.
- Reavaliação possível pós-MVP se qualidade for feedback recorrente dos usuários.

---

## ADR-006 — Framework Backend

**Status:** ✅ Decidido
**Data:** 2026-03-21

### Decisão
Python + FastAPI.

### Contexto
O backend orquestra chamadas para LLM, STT e TTS — workload predominantemente I/O bound.

### Alternativas consideradas
- Java + Spring Boot

### Motivo da escolha
Backend 90% I/O bound — o asyncio do Python lida com alto throughput sem que a vantagem de performance do Java seja relevante. Ecossistema Python para IA é dominante. Escala horizontalmente sem problema; o gargalo real será custo e rate limit das APIs externas.

### Consequências
- Componentes críticos podem ser extraídos como microsserviços futuramente se necessário.
- Gabriel mantém expertise em Java disponível para microsserviços específicos se houver necessidade.

---

## ADR-007 — Proteção DDoS e WAF

**Status:** ✅ Decidido
**Data:** 2026-03-21

### Decisão
Cloudflare como reverse proxy obrigatório na frente de Vercel e Railway.

### Contexto
slowapi opera na camada de aplicação — o servidor cairia antes de o rate limit atuar em um ataque volumétrico. Precisávamos de proteção na borda.

### Alternativas consideradas
- AWS Shield + WAF
- Vercel/Railway proteção nativa

### Motivo da escolha
Cloudflare free tier cobre DDoS L3/L4/L7, WAF, proteção contra bots e CDN global. Vercel e Railway não oferecem proteção DDoS suficiente nativamente. AWS Shield Standard é grátis mas WAF e Shield Advanced são pagos.

### Consequências
- Defesa em profundidade: Cloudflare → Vercel/Railway → FastAPI/slowapi → Supabase RLS.
- Sem custo adicional no MVP.
- Todo tráfego passa pela borda Cloudflare antes de chegar à aplicação.
