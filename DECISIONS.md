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

---

## Decisões Técnicas

> *Ainda não definidas — próxima fase é Arquitetura Técnica.*

### DT-01 — Stack
- **Status:** Pendente
- **Decisões em aberto:** frontend framework, backend language, banco de dados, provedor de STT, provedor de TTS, modelo de LLM

### DT-02 — Provedor de IA (LLM)
- **Status:** Pendente
- **Contexto:** Precisa suportar conversas longas com contexto, correção de erros e adaptação de nível

### DT-03 — Provedor de STT (Speech-to-Text)
- **Status:** Pendente
- **Requisito:** Acurácia ≥ 85% para inglês com sotaque brasileiro

### DT-04 — Provedor de TTS (Text-to-Speech)
- **Status:** Pendente
- **Requisito:** Voz neural (não robótica), latência ≤ 3s, suporte a velocidade variável

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
| Arquitetura técnica | `docs/architecture/` | ⏳ Próxima fase |
| Design e wireframes | `docs/design/` | ⏳ Pendente |
| Testes | `docs/testing/` | ⏳ Pendente |
| Deploy | `docs/deployment/` | ⏳ Pendente |

---

## Repositório

- **Docs:** https://github.com/goliverpro/fluentloop-docs
- **Core (backend + IA):** a criar
- **Web (frontend):** a criar

---

## Próximos Passos

1. **Arquitetura Técnica** — definir stack, provedores de STT/TTS/LLM, banco de dados, modelo de deploy
2. **Design / Wireframes** — fluxos de tela e protótipo
3. **Criação dos repositórios** de código (`fluentloop-core` e `fluentloop-web`)
