# Requisitos Funcionais

> **Versão:** 2.0.0 | **Data:** 2026-03-21 | **Status:** ✅ Aprovado

Requisitos organizados por módulo, usando a classificação **MoSCoW**:

- **M** — Must have (essencial para o MVP)
- **S** — Should have (importante, mas não bloqueia o lançamento)
- **C** — Could have (desejável, entra se houver tempo)
- **W** — Won't have (fora do escopo atual)

---

## Os Três Pilares do FluentLoop

O produto é estruturado em torno de três habilidades fundamentais da aprendizagem de idiomas:

| Pilar | Canal | Módulos |
|---|---|---|
| ✍️ **Escrita** | Chat por texto | Módulos 2, 3, 4 |
| 🎙️ **Fala** | Entrada de voz + feedback de pronúncia | Módulo 8 |
| 👂 **Compreensão** | Saída em áudio da IA + exercícios de escuta | Módulo 9 |

Todos os três pilares fazem parte do **MVP**. Conversar apenas por texto não é suficiente — o usuário precisa treinar falar e entender inglês falado.

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

## Módulo 2 — Conversação por Texto *(Pilar: Escrita)*

| ID | Requisito | Prioridade |
|---|---|---|
| RF-07 | O sistema deve oferecer um chat de texto em inglês com IA | M |
| RF-08 | A IA deve responder de forma natural, contextualizada e fluida | M |
| RF-09 | O sistema deve suportar sessões de conversa com histórico contínuo | M |
| RF-10 | O sistema deve permitir que o usuário encerre e inicie novas sessões | M |
| RF-11 | O sistema deve exibir indicador de "digitando..." enquanto a IA processa | S |
| RF-12 | O sistema deve permitir que o usuário copie mensagens da conversa | C |

---

## Módulo 3 — Correção de Erros *(Pilares: Escrita e Fala)*

| ID | Requisito | Prioridade |
|---|---|---|
| RF-13 | A IA deve identificar erros gramaticais e de vocabulário após cada mensagem de texto | M |
| RF-14 | A IA deve identificar erros de pronúncia após cada mensagem de voz | M |
| RF-15 | A correção deve sugerir a forma correta sem interromper o fluxo da conversa | M |
| RF-16 | O sistema deve classificar o tipo de erro (gramática, vocabulário, pronúncia) | S |
| RF-17 | O sistema deve acumular erros frequentes e exibi-los em resumo ao final da sessão | S |
| RF-18 | O usuário deve poder desativar a exibição de correções temporariamente | C |

---

## Módulo 4 — Roleplay e Cenários *(Pilares: Escrita, Fala e Compreensão)*

| ID | Requisito | Prioridade |
|---|---|---|
| RF-19 | O sistema deve oferecer ao menos 3 cenários de roleplay no MVP | M |
| RF-20 | O usuário deve poder escolher o cenário antes de iniciar a sessão | M |
| RF-21 | A IA deve assumir um personagem/papel correspondente ao cenário escolhido | M |
| RF-22 | O sistema deve exibir descrição do cenário e do papel da IA antes de iniciar | M |
| RF-23 | Cada cenário deve suportar os três modos: texto, voz e compreensão | M |
| RF-24 | O sistema deve permitir reiniciar o cenário sem sair da sessão | S |
| RF-25 | O sistema deve oferecer novos cenários progressivamente conforme o roadmap | C |

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
| RF-26 | O sistema deve salvar todas as sessões de conversa do usuário | M |
| RF-27 | O usuário deve poder visualizar sessões anteriores | M |
| RF-28 | O sistema deve exibir data, duração, cenário e pilar praticado por sessão | S |
| RF-29 | O usuário deve poder deletar sessões do histórico | S |
| RF-30 | O sistema deve exibir os erros mais frequentes consolidados por sessão | S |

---

## Módulo 6 — Planos e Limites (Free vs Pro)

| ID | Requisito | Prioridade |
|---|---|---|
| RF-31 | O plano Free deve ser limitado a 10 interações por dia (texto ou voz) | M |
| RF-32 | O plano Free deve dar acesso a apenas 2 cenários de roleplay | M |
| RF-33 | O sistema deve exibir aviso quando o usuário estiver próximo do limite diário | M |
| RF-34 | O sistema deve bloquear envio ao atingir o limite e exibir CTA de upgrade | M |
| RF-35 | O plano Pro deve ter acesso ilimitado a interações, cenários e histórico completo | M |
| RF-36 | O sistema deve processar pagamentos via Stripe | M |
| RF-37 | O sistema deve enviar e-mail de confirmação após assinatura | S |

---

## Módulo 7 — Nivelamento e Progressão

| ID | Requisito | Prioridade |
|---|---|---|
| RF-38 | O sistema deve coletar o nível de inglês do usuário no onboarding (A2 / B1 / B2) | M |
| RF-39 | A IA deve adaptar vocabulário, complexidade gramatical e ritmo ao nível do usuário | M |
| RF-40 | O sistema deve monitorar a taxa de erros por sessão para inferir a evolução do usuário | M |
| RF-41 | O sistema deve sugerir avanço de nível após 5 sessões com taxa de erro abaixo de 20% | S |
| RF-42 | O usuário deve poder aceitar ou recusar a sugestão de avanço de nível | S |
| RF-43 | O usuário deve poder ajustar manualmente seu nível nas configurações de perfil | S |
| RF-44 | O sistema deve registrar o histórico de evolução de nível do usuário | S |
| RF-45 | Os cenários de roleplay devem ter variantes de dificuldade ajustadas ao nível do usuário | C |

**Níveis suportados:**

| Nível | Descrição | Comportamento da IA |
|---|---|---|
| **A2** | Iniciante-intermediário | Frases curtas, vocabulário básico, ritmo lento, tolerância maior a erros |
| **B1** | Intermediário | Frases completas, vocabulário cotidiano, correção ativa |
| **B2** | Intermediário-avançado | Expressões idiomáticas, ritmo natural, correção rigorosa |

---

## Módulo 8 — Fala *(Pilar: Fala)* — MVP

| ID | Requisito | Prioridade |
|---|---|---|
| RF-46 | O sistema deve aceitar entrada de voz do usuário via microfone | M |
| RF-47 | O sistema deve transcrever a fala do usuário para texto (speech-to-text) | M |
| RF-48 | A transcrição deve ser exibida ao usuário antes de ser enviada à IA | M |
| RF-49 | O usuário deve poder corrigir a transcrição antes de confirmar o envio | S |
| RF-50 | O sistema deve identificar erros de pronúncia com base na transcrição e no contexto | M |
| RF-51 | O sistema deve indicar quais palavras foram pronunciadas de forma incorreta | S |
| RF-52 | O sistema deve sugerir a pronúncia correta com exemplos fonéticos (IPA ou áudio) | S |
| RF-53 | O usuário deve poder alternar entre modo texto e modo voz na mesma sessão | M |

---

## Módulo 9 — Compreensão Auditiva *(Pilar: Compreensão)* — MVP

| ID | Requisito | Prioridade |
|---|---|---|
| RF-54 | O sistema deve gerar respostas da IA em áudio (text-to-speech) | M |
| RF-55 | O usuário deve poder controlar a velocidade de reprodução do áudio (normal / lento) | M |
| RF-56 | O usuário deve poder repetir o áudio da última fala da IA | M |
| RF-57 | O sistema deve oferecer modo "só escuta": IA fala, usuário escuta e responde por voz | S |
| RF-58 | O sistema deve oferecer exercícios de compreensão: IA fala e usuário digita o que entendeu | S |
| RF-59 | O sistema deve validar a resposta do exercício e indicar o que foi compreendido corretamente | S |
| RF-60 | O usuário deve poder escolher o sotaque da IA (Americano / Britânico) | C |

---

## Critérios de Aceitação — Funcionalidades Core

### RF-08 — Qualidade da resposta da IA

- A IA responde em até 5 segundos em condições normais de rede
- Respostas mantêm coerência com o contexto dos últimos 10 turnos da conversa
- A IA não abandona o idioma inglês, salvo quando explicitamente solicitado pelo usuário

### RF-13 / RF-14 — Correção de erros

- A correção aparece abaixo da mensagem do usuário, visualmente diferenciada
- A correção nunca substitui a resposta principal da IA na mesma mensagem
- Erros de pronúncia são destacados com a palavra incorreta e a sugestão de correção

### RF-47 — Speech-to-text

- Acurácia mínima de 85% para inglês com sotaque brasileiro em condições normais de microfone
- Latência de transcrição de até 3 segundos após o usuário parar de falar
- O sistema deve informar quando não conseguiu entender a fala e pedir para repetir

### RF-54 — Text-to-speech

- Áudio gerado em até 3 segundos após a resposta da IA estar pronta
- Qualidade de voz natural (não robótica) — preferencialmente voz neural
- Velocidade padrão compatível com fala nativa em nível B1–B2

### RF-31 / RF-34 — Limites do plano Free

- O contador reseta à meia-noite no fuso do usuário (America/Sao_Paulo como padrão)
- O aviso de limite aparece ao atingir 8 interações (80% do limite)
- O bloqueio ao atingir 10 interações exibe modal com opção de upgrade para Pro
