# Casos de Uso

> **Versão:** 1.0.0 | **Data:** 2026-03-21 | **Status:** ✅ Aprovado

---

## Atores

| Ator | Descrição |
|---|---|
| **Usuário Free** | Usuário cadastrado no plano gratuito |
| **Usuário Pro** | Usuário com assinatura ativa |
| **IA (Claude)** | Serviço de inteligência artificial de conversação |
| **Sistema** | A aplicação FluentLoop em si |

---

## UC-01 — Cadastro e Primeiro Acesso

**Ator principal:** Usuário Free
**Pré-condição:** Usuário não possui conta
**Pós-condição:** Usuário autenticado e na tela principal

### Fluxo Principal
1. Usuário acessa o FluentLoop pela primeira vez
2. Sistema exibe tela de boas-vindas com opções de cadastro
3. Usuário escolhe cadastro com e-mail ou Google
4. **[E-mail]** Usuário preenche nome, e-mail e senha → Sistema envia e-mail de verificação
5. **[Google]** Sistema redireciona para OAuth do Google → Usuário autoriza
6. Sistema cria conta e redireciona para onboarding
7. Onboarding: usuário informa nível de inglês (A2 / B1 / B2)
8. Sistema exibe tela principal com acesso ao chat

### Fluxos Alternativos
- **FA1 — E-mail já cadastrado:** Sistema exibe mensagem e sugere login ou recuperação de senha
- **FA2 — Verificação de e-mail pendente:** Sistema exibe aviso e permite reenvio do e-mail

---

## UC-02 — Iniciar Sessão de Conversação Livre

**Ator principal:** Usuário Free ou Pro
**Pré-condição:** Usuário autenticado e com limite diário disponível
**Pós-condição:** Sessão de chat iniciada

### Fluxo Principal
1. Usuário acessa a tela de chat
2. Sistema exibe campo de mensagem e histórico vazio (nova sessão)
3. Usuário digita mensagem em inglês e envia
4. Sistema exibe indicador de "digitando..."
5. IA processa e retorna resposta em inglês
6. Sistema exibe resposta da IA e, abaixo da mensagem do usuário, a correção (se houver erros)
7. Usuário continua a conversa (repete passos 3–6)
8. Usuário encerra a sessão
9. Sistema salva a sessão e exibe resumo de erros da sessão

### Fluxos Alternativos
- **FA1 — Limite atingido (Free):** Ao enviar a 11ª mensagem, sistema bloqueia e exibe modal de upgrade
- **FA2 — Erro na API de IA:** Sistema exibe mensagem amigável e sugere tentar novamente
- **FA3 — Conexão perdida:** Sistema salva o progresso e permite retomar ao reconectar

---

## UC-03 — Iniciar Sessão de Roleplay

**Ator principal:** Usuário Free ou Pro
**Pré-condição:** Usuário autenticado; plano Free tem acesso a 2 cenários
**Pós-condição:** Sessão de roleplay iniciada com contexto definido

### Fluxo Principal
1. Usuário acessa a seção de Roleplay
2. Sistema exibe lista de cenários disponíveis
3. Usuário seleciona um cenário (ex: "Check-in em hotel")
4. Sistema exibe descrição do cenário e do papel que a IA irá assumir
5. Usuário confirma e inicia a sessão
6. IA assume o personagem e abre a conversa com a primeira linha do roleplay
7. Usuário responde e a conversa segue (mesmo fluxo do UC-02)
8. Usuário encerra ou reinicia o cenário

### Fluxos Alternativos
- **FA1 — Cenário bloqueado (Free):** Sistema exibe cadeado no cenário e CTA para upgrade Pro
- **FA2 — Usuário reinicia o cenário:** Sistema descarta a sessão atual e recomeça do passo 6

---

## UC-04 — Visualizar Histórico de Sessões

**Ator principal:** Usuário Free ou Pro
**Pré-condição:** Usuário possui ao menos uma sessão salva
**Pós-condição:** Usuário visualiza detalhes da sessão

### Fluxo Principal
1. Usuário acessa a seção de Histórico
2. Sistema exibe lista de sessões ordenadas por data (mais recente primeiro)
3. Cada item exibe: data, tipo (livre/roleplay), cenário e duração
4. Usuário clica em uma sessão
5. Sistema exibe o transcript completo da conversa
6. Sistema exibe o resumo de erros da sessão

### Fluxos Alternativos
- **FA1 — Nenhuma sessão:** Sistema exibe estado vazio com CTA para iniciar primeiro chat
- **FA2 — Usuário deleta sessão:** Sistema solicita confirmação e remove permanentemente

---

## UC-05 — Assinar Plano Pro

**Ator principal:** Usuário Free
**Pré-condição:** Usuário autenticado no plano Free
**Pós-condição:** Plano atualizado para Pro, acesso liberado

### Fluxo Principal
1. Usuário clica em "Upgrade para Pro" (via CTA ou menu de conta)
2. Sistema exibe página de planos com comparativo Free x Pro
3. Usuário seleciona plano mensal ou anual
4. Sistema redireciona para checkout do Stripe
5. Usuário preenche dados de cartão e confirma
6. Stripe processa pagamento e notifica o sistema via webhook
7. Sistema atualiza o plano do usuário para Pro
8. Sistema envia e-mail de confirmação
9. Usuário é redirecionado para a tela principal com acesso Pro ativo

### Fluxos Alternativos
- **FA1 — Pagamento recusado:** Stripe exibe erro no checkout; sistema não altera o plano
- **FA2 — Usuário abandona o checkout:** Sistema mantém plano Free sem alterações

---

## UC-06 — Recuperar Senha

**Ator principal:** Usuário com conta por e-mail
**Pré-condição:** Usuário não consegue fazer login
**Pós-condição:** Senha redefinida, usuário autenticado

### Fluxo Principal
1. Usuário clica em "Esqueci minha senha" na tela de login
2. Sistema exibe campo para informar e-mail
3. Usuário informa o e-mail e confirma
4. Sistema envia e-mail com link de redefinição (válido por 1 hora)
5. Usuário clica no link e é redirecionado para tela de nova senha
6. Usuário define nova senha e confirma
7. Sistema atualiza a senha e redireciona para login

### Fluxos Alternativos
- **FA1 — E-mail não cadastrado:** Sistema exibe mensagem genérica (sem revelar se existe ou não)
- **FA2 — Link expirado:** Sistema exibe aviso e permite solicitar novo link
