# Requisitos Funcionais

> **Versão:** 1.0.0 | **Data:** 2026-03-21 | **Status:** ✅ Aprovado

Requisitos organizados por módulo, usando a classificação **MoSCoW**:

- **M** — Must have (essencial para o MVP)
- **S** — Should have (importante, mas não bloqueia o lançamento)
- **C** — Could have (desejável, entra se houver tempo)
- **W** — Won't have (fora do escopo atual)

---

## Módulo 1 — Autenticação e Conta

| ID | Requisito | Prioridade |
|---|---|---|
| RF-01 | O sistema deve permitir cadastro com e-mail e senha | M |
| RF-02 | O sistema deve permitir login com Google (OAuth 2.0) | M |
| RF-03 | O sistema deve enviar e-mail de verificação de conta | M |
| RF-04 | O sistema deve permitir recuperação de senha via e-mail | M |
| RF-05 | O sistema deve permitir que o usuário edite nome e foto de perfil | S |
| RF-06 | O sistema deve permitir exclusão de conta e dados pelo usuário | S |

---

## Módulo 2 — Conversação por Texto

| ID | Requisito | Prioridade |
|---|---|---|
| RF-07 | O sistema deve oferecer um chat de texto em inglês com IA | M |
| RF-08 | A IA deve responder de forma natural, contextualizada e fluida | M |
| RF-09 | O sistema deve suportar sessões de conversa com histórico contínuo | M |
| RF-10 | O sistema deve permitir que o usuário encerre e inicie novas sessões | M |
| RF-11 | O sistema deve exibir indicador de "digitando..." enquanto a IA processa | S |
| RF-12 | O sistema deve permitir que o usuário copie mensagens da conversa | C |

---

## Módulo 3 — Correção de Erros

| ID | Requisito | Prioridade |
|---|---|---|
| RF-13 | Após cada mensagem do usuário, a IA deve identificar erros gramaticais e de vocabulário | M |
| RF-14 | A correção deve sugerir a forma correta sem interromper o fluxo da conversa | M |
| RF-15 | O sistema deve classificar o tipo de erro (gramática, vocabulário, pronúncia) | S |
| RF-16 | O sistema deve acumular erros frequentes e exibi-los em resumo ao final da sessão | S |
| RF-17 | O usuário deve poder desativar a exibição de correções temporariamente | C |

---

## Módulo 4 — Roleplay e Cenários

| ID | Requisito | Prioridade |
|---|---|---|
| RF-18 | O sistema deve oferecer ao menos 3 cenários de roleplay no MVP | M |
| RF-19 | O usuário deve poder escolher o cenário antes de iniciar a sessão | M |
| RF-20 | A IA deve assumir um personagem/papel correspondente ao cenário escolhido | M |
| RF-21 | O sistema deve exibir descrição do cenário e do papel da IA antes de iniciar | M |
| RF-22 | O sistema deve permitir reiniciar o cenário sem sair da sessão | S |
| RF-23 | O sistema deve oferecer novos cenários progressivamente conforme o roadmap | C |

**Cenários do MVP:**

| ID | Cenário | Papel da IA |
|---|---|---|
| SC-01 | Check-in em hotel | Recepcionista |
| SC-02 | Daily standup em inglês | Colega de trabalho / facilitador |
| SC-03 | Small talk casual | Amigo nativo |

---

## Módulo 5 — Histórico de Sessões

| ID | Requisito | Prioridade |
|---|---|---|
| RF-24 | O sistema deve salvar todas as sessões de conversa do usuário | M |
| RF-25 | O usuário deve poder visualizar sessões anteriores | M |
| RF-26 | O sistema deve exibir data, duração e cenário de cada sessão | S |
| RF-27 | O usuário deve poder deletar sessões do histórico | S |
| RF-28 | O sistema deve exibir os erros mais frequentes consolidados por sessão | S |

---

## Módulo 6 — Planos e Limites (Free vs Pro)

| ID | Requisito | Prioridade |
|---|---|---|
| RF-29 | O plano Free deve ser limitado a 10 mensagens por dia | M |
| RF-30 | O plano Free deve dar acesso a apenas 2 cenários de roleplay | M |
| RF-31 | O sistema deve exibir aviso quando o usuário estiver próximo do limite diário | M |
| RF-32 | O sistema deve bloquear envio ao atingir o limite e exibir CTA de upgrade | M |
| RF-33 | O plano Pro deve ter acesso ilimitado a mensagens, cenários e histórico completo | M |
| RF-34 | O sistema deve processar pagamentos via Stripe | M |
| RF-35 | O sistema deve enviar e-mail de confirmação após assinatura | S |

---

## Módulo 7 — Voz *(Pós-MVP)*

| ID | Requisito | Prioridade |
|---|---|---|
| RF-36 | O sistema deve aceitar entrada de voz (speech-to-text) | W |
| RF-37 | O sistema deve gerar resposta em áudio (text-to-speech) | W |
| RF-38 | O sistema deve fornecer feedback de pronúncia | W |

---

## Critérios de Aceitação — Funcionalidades Core

### RF-08 — Qualidade da resposta da IA

- A IA responde em até 5 segundos em condições normais de rede
- Respostas mantêm coerência com o contexto dos últimos 10 turnos da conversa
- A IA não abandona o idioma inglês, salvo quando explicitamente solicitado pelo usuário

### RF-13 — Correção de erros

- A correção aparece abaixo da mensagem do usuário, visualmente diferenciada
- A correção nunca substitui a resposta principal da IA na mesma mensagem
- Erros menores (artigos, preposições) são assinalados mas não bloqueiam o fluxo da conversa

### RF-29 / RF-32 — Limites do plano Free

- O contador de mensagens reseta à meia-noite no fuso horário do usuário (America/Sao_Paulo como padrão)
- O aviso de limite aparece ao atingir 8 mensagens (80% do limite)
- O bloqueio ao atingir 10 mensagens exibe modal com opção de upgrade para Pro
