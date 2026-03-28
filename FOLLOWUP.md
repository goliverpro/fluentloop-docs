# Followup — Próxima Sessão

> Atualize este arquivo ao final de cada sessão.
> Leia-o antes de qualquer coisa ao retomar.

---

## Status atual (2026-03-27 — sessão 2)

### Concluído nesta sessão

**PRs mergeados:**
- Backend `goliverpro/fluentloop-core#1` — mergeado via squash
- Frontend `goliverpro/fluentloop-web#1` — mergeado via squash
- Mudanças locais (bugfixes + redesign) commitadas direto no main de cada repo

**Backend (fluentloop-core):**
- README atualizado com comando Git Bash: `.venv/Scripts/uvicorn app.main:app --reload`

**Frontend (fluentloop-web):**
- TTS implementado: após cada resposta da IA, chama `POST /v1/speech/tts` e toca o áudio
  - `audioRef` para parar áudio anterior antes de tocar novo
  - TTS usa texto limpo (sem bloco `<corrections>`)
- Bug de correções corrigido:
  - Bloco `<corrections>...</corrections>` ocultado durante o streaming
  - Removido do texto visível ao finalizar
  - Fallback: extrai correções do texto acumulado se evento `[CORRECTIONS]` falhar
- Filtro PRO adicionado na tela de cenários:
  - Aparece apenas para usuários PRO (inferido da lista retornada pela API)
  - Destaque visual em amber

**Cenários (Supabase):**
- `seed_free_scenarios.sql` — **já executado no banco**
  - 8 cenários free: 4×A2, 4×B1 (incluindo os 2 existentes), 0×B2 free
  - Fix: `Casual Small Talk` corrigido para `is_free = true`
- `seed_pro_scenarios.sql` — **PENDENTE de execução no banco**
  - 10 cenários PRO com prompts de nível profundo
  - A2: Phone Call Reservation, Returning an Item, Airport Check-in
  - B1: Salary Negotiation, Renting an Apartment, Presenting a Project
  - B2: Investor Pitch, Crisis Communication, Thesis Defense, Contract Negotiation
  - Cada prompt tem: regras linguísticas por nível, vocabulário-alvo, fluxo de cenário e posições de negociação realistas

### Concluído em sessões anteriores (2026-03-27 — sessão 1)

**Backend — bugs corrigidos:**
- `list_sessions`: normalizou `scenarios(name)` → `scenario_name`
- `list_sessions`: conta mensagens ao vivo para sessões ativas
- `update_session_stats`: recalcula stats após cada mensagem em tempo real
- Bug crítico de error_rate: corrigido `message_id` (usava ID da IA, agora usa ID do usuário)
- `end_session`: simplificado para reutilizar `update_session_stats`
- `user_levels` insert: envolvido em try/except
- System prompt de correções: reescrito com lista explícita de erros obrigatórios

**Frontend — concluído:**
- Tela de perfil redesenhada seguindo o design system
- Bug do botão branco corrigido

### Concluído em sessões anteriores (2026-03-26)

- Redesign completo do frontend — design system com `#006DB2` como cor primária
- Tela de login: split layout, logo com ∞
- TopNav substituiu Sidebar
- Todas as telas internas estilizadas
- Componentes UI reescritos com inline styles
- Spinner corrigido, tela de loading com logo pulsando
- Documentação visual completa em `DESIGN.md`

### Concluído em sessões anteriores

- Aplicação rodando ponta a ponta — fluxo: login → criar sessão → chat → correção → encerrar
- LLM: `gpt-4o-mini` (OpenAI), STT: Whisper, TTS: OpenAI `tts-1` voz `alloy`
- Backend e frontend implementados e mergeados no main

---

## Pendente para a próxima sessão

### 1. Executar seed PRO no Supabase (PRIORIDADE)
```
Supabase Dashboard → SQL Editor → New query
→ colar conteúdo de supabase/seed_pro_scenarios.sql
```

### 2. Testar fluxo de correções
- Enviar uma frase com erro (ex: "she have") e verificar:
  - Bloco `<corrections>` não aparece como texto cru
  - Painel vermelho de correções aparece abaixo da mensagem

### 3. Testar TTS
- Verificar se o áudio toca após cada resposta da IA
- Verificar se o texto falado está limpo (sem XML)

### 4. Migrar STT para Azure Speech (pós-MVP)
- Habilitar feedback de pronúncia palavra a palavra
- Ver guia em `DECISIONS.md` → DT-06

### 5. Próximas features a definir
- Dashboard com métricas reais (progresso, error_rate ao longo do tempo)
- Onboarding: seleção de nível inicial
- Billing/Stripe completo

---

## Como subir o ambiente local

**Backend (Git Bash):**
```bash
cd /c/Users/gabri/Documents/IA/fluentloop-core
.venv/Scripts/uvicorn app.main:app --reload
```

**Frontend:**
```bash
cd /c/Users/gabri/Documents/IA/fluentloop-web
npm run dev
```

> O `.venv` e `node_modules` já existem — não precisa reinstalar.

---

## Ordem sugerida para a próxima sessão

1. Executar `seed_pro_scenarios.sql` no Supabase
2. Testar correções e TTS com o app rodando
3. Decidir próxima feature (dashboard, onboarding ou billing)
