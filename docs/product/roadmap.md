# Roadmap

Visão macro das entregas por fase. Detalhes de cada funcionalidade estão nos [Requisitos](../requirements/functional.md).

---

## 🗓️ Fases

### Fase 0 — Fundação ✅
**Objetivo:** Documentar e planejar antes de escrever uma linha de código.

- [x] Visão do produto
- [x] Personas
- [x] Levantamento de requisitos (funcionais, não-funcionais, casos de uso)
- [x] Arquitetura técnica (stack, SDD, modelo de dados, segurança)
- [x] Wireframes (14 telas)
- [x] Style guide (cores, tipografia, componentes)
- [x] Criação dos repositórios de código (`fluentloop-core`, `fluentloop-web`)

---

### Fase 1 — MVP 🔵 *(em desenvolvimento)*
**Objetivo:** Lançar a versão mínima com os três pilares funcionando — escrita, fala e compreensão.

**Backend (`fluentloop-core`):**
- [ ] Autenticação — validação de JWT via Supabase
- [ ] `GET /users/me` — perfil do usuário
- [ ] `POST /sessions` e `PATCH /sessions/{id}/end` — ciclo de vida da sessão
- [ ] `POST /chat/message` — SSE streaming com Claude
- [ ] `POST /speech/transcribe` — STT + avaliação de pronúncia (Azure Speech)
- [ ] `POST /speech/tts` — síntese de voz (OpenAI TTS)
- [ ] `GET /scenarios` — listagem de cenários
- [ ] `POST /billing/checkout` e webhook Stripe
- [ ] Rate limiting por usuário e por IP
- [ ] Nivelamento adaptativo (lógica de error_rate + sugestão de avanço)

**Frontend (`fluentloop-web`):**
- [ ] Landing page
- [ ] Cadastro e login (e-mail + Google OAuth)
- [ ] Onboarding (seleção de nível)
- [ ] Home / Dashboard
- [ ] Sessão de chat — modo texto (streaming)
- [ ] Sessão de chat — modo voz (PTT + transcrição + pronúncia)
- [ ] Sessão de chat — modo compreensão (player TTS)
- [ ] Seleção de cenários
- [ ] Encerramento + resumo de sessão
- [ ] Histórico de sessões
- [ ] Detalhe de sessão (transcript)
- [ ] Perfil e configurações
- [ ] Página de planos + modal de limite

**Infra:**
- [ ] Deploy do backend no Railway
- [ ] Deploy do frontend na Vercel
- [ ] Domínio + Cloudflare configurado
- [ ] Variáveis de ambiente configuradas em produção
- [ ] Supabase — tabelas criadas + RLS configurado

---

### Fase 2 — Engajamento 🔒 *(bloqueado pela Fase 1)*
**Objetivo:** Aumentar retenção e conversão Free → Pro.

- [ ] Dashboard de progresso por pilar
- [ ] Sistema de streak diário
- [ ] Conquistas (badges)
- [ ] Relatório semanal por e-mail
- [ ] Notificações push (PWA)

---

### Fase 3 — PWA 🔒
**Objetivo:** Transformar o web app em PWA instalável no celular.

- [ ] `manifest.json` configurado
- [ ] Service Worker (cache offline de assets)
- [ ] Ícone e splash screen
- [ ] Testado em iOS e Android

---

### Fase 4 — Expansão 🔒
**Objetivo:** Crescer base e explorar novos canais.

- [ ] Novos cenários de roleplay
- [ ] Dashboard de progresso avançado
- [ ] App mobile nativo (avaliar após tração)
- [ ] API pública para parceiros

---

!!! warning "Este roadmap é vivo"
    As prioridades podem mudar com base em feedback de usuários e métricas de produto. Atualizações são registradas via Pull Request com justificativa.
