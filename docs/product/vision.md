# 🧭 Visão do Produto

> **Versão:** 1.0.0 | **Data:** 2026-03-21 | **Status:** ✅ Aprovado

---

## Elevator Pitch

**Para** brasileiros no nível intermediário de inglês (B1–B2) **que** têm dificuldade de praticar conversação por falta de um parceiro acessível e disponível, **o FluentLoop** é um aplicativo web de prática conversacional com IA **que** simula diálogos reais, corrige erros em tempo real e oferece cenários de roleplay contextualizados.

**Diferente de** apps como Duolingo ou Babbel, **nosso produto** foca exclusivamente em conversação fluida e natural, não em exercícios de vocabulário ou gramática isolados.

---

## O Problema

### Contexto

O Brasil tem milhões de estudantes de inglês no nível intermediário — pessoas que entendem o idioma, conseguem se comunicar, mas travam na hora de manter uma conversa espontânea. Esse bloqueio é conhecido como **o platô do B1**.

### Dores do Usuário

| Dor | Impacto |
|---|---|
| Professores particulares são caros (R$80–R$200/hora) | Prática limitada a 1–2x por semana |
| Plataformas de troca de idioma dependem de disponibilidade alheia | Conversas irregulares e sem estrutura |
| Medo de errar na frente de outras pessoas | Inibição que trava o aprendizado |
| Apps gamificados ensinam vocabulário, não conversação | Gap entre saber palavras e saber conversar |
| Falta de feedback imediato e didático | Erros se solidificam sem correção |

---

## A Solução

O FluentLoop oferece um parceiro de conversação com IA disponível 24/7 estruturado em **três pilares de aprendizagem**:

| Pilar | O que o usuário pratica |
|---|---|
| ✍️ **Escrita** | Expressar ideias em inglês por texto, com correção gramatical e de vocabulário em tempo real |
| 🎙️ **Fala** | Pronunciar inglês corretamente, com feedback de pronúncia palavra a palavra |
| 👂 **Compreensão** | Entender inglês falado em velocidade natural, com controle de ritmo e exercícios de escuta |

Os três pilares estão presentes no MVP — conversar apenas por texto não é suficiente para quebrar o platô do B1.

---

## Público-Alvo

### Persona Principal

!!! info "Lucas, 27 anos — Analista de TI, São Paulo"
    - **Nível:** B1–B2 (intermediário)
    - **Objetivo:** Participar de reuniões em inglês e se virar em viagens internacionais
    - **Frustração:** Sabe gramática, mas trava quando precisa falar de verdade
    - **Comportamento:** Prefere sessões curtas de 10–20 minutos no celular ou computador
    - **Disposição a pagar:** Pagaria se visse progresso real

---

## Funcionalidades

### MVP (Lançamento)

| Pilar | Funcionalidade | Descrição |
|---|---|---|
| ✍️ Escrita | Chat por texto | Conversa livre com IA em inglês |
| ✍️ Escrita | Correção em tempo real | Sinaliza erros gramaticais e de vocabulário após cada mensagem |
| 🎙️ Fala | Entrada por voz | Usuário fala, sistema transcreve e IA responde |
| 🎙️ Fala | Feedback de pronúncia | Identifica erros de pronúncia e sugere a forma correta |
| 👂 Compreensão | Saída em áudio | IA responde também em voz com controle de velocidade |
| 👂 Compreensão | Exercícios de escuta | IA fala, usuário digita o que entendeu |
| — | Roleplay com cenários | Usuário escolhe cenário e pratica nos três modos |
| — | Nivelamento adaptativo | IA ajusta dificuldade ao nível A2/B1/B2 do usuário |
| — | Histórico de sessões | Registro das conversas e erros frequentes |
| — | Autenticação | Login com e-mail ou Google |

### Roadmap Pós-MVP

| Funcionalidade | Prioridade |
|---|---|
| 📈 Dashboard de progresso por pilar | Alta |
| 🏆 Sistema de conquistas e streak | Média |
| 🌍 Novos cenários de roleplay | Média |
| 📱 App mobile (PWA) | Média |

---

## Cenários de Roleplay (V1)

=== "🏢 Trabalho e Reuniões"
    - Apresentação em reunião internacional
    - Negociação com fornecedor estrangeiro
    - Daily standup em inglês
    - E-mail formal de follow-up

=== "✈️ Viagem e Turismo"
    - Check-in no hotel
    - Pedido em restaurante
    - Perguntar por direções
    - Situações no aeroporto

=== "☕ Dia a Dia"
    - Small talk com colegas
    - Marcar encontro com amigos
    - Falar sobre hobbies
    - Conversa casual sobre filmes e séries

---

## Modelo de Negócio

| Plano | Limites | Preço |
|---|---|---|
| **Free** | 10 interações/dia, 2 cenários, todos os pilares (com limite) | Grátis |
| **Pro** | Ilimitado, todos os cenários, todos os pilares, dashboard | R$29,90/mês |
| **Anual** | Tudo do Pro | R$249,00/ano |

---

## Métricas de Sucesso

!!! tip "North Star Metric"
    **Minutos de conversação praticados por semana por usuário ativo**

| Métrica | Meta (3 meses pós-lançamento) |
|---|---|
| Usuários cadastrados | 1.000 |
| DAU | 200 |
| Retenção D7 | > 30% |
| Conversão Free → Pro | > 5% |
| NPS | > 40 |

---

## Riscos

| Risco | Probabilidade | Mitigação |
|---|---|---|
| Custo de API de IA inviabilizar o free tier | Alta | Rate limiting rigoroso no plano free |
| Usuários desistirem por falta de engajamento | Média | Streak, metas diárias, notificações |
| Concorrente lançar feature similar | Média | Foco em nicho B1–B2 e UX pedagógico |
| Qualidade de voz insatisfatória | Baixa | Testes de usabilidade antes do lançamento |
