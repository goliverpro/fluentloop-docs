# Requisitos Não-Funcionais

> **Versão:** 1.0.0 | **Data:** 2026-03-21 | **Status:** ✅ Aprovado

---

## RNF-01 — Performance

| ID | Requisito | Meta |
|---|---|---|
| RNF-01.1 | Tempo de resposta da IA (text) | ≤ 5 segundos (P95) |
| RNF-01.2 | Tempo de carregamento inicial da aplicação | ≤ 3 segundos em 4G |
| RNF-01.3 | Tempo de resposta de APIs internas (auth, histórico) | ≤ 500ms (P95) |
| RNF-01.4 | A aplicação deve ser funcional em conexões de 3G estável | — |

---

## RNF-02 — Escalabilidade

| ID | Requisito | Meta |
|---|---|---|
| RNF-02.1 | A arquitetura deve suportar crescimento sem redesenho estrutural | — |
| RNF-02.2 | O backend deve ser capaz de atender 1.000 usuários simultâneos no MVP | — |
| RNF-02.3 | O serviço de IA deve usar rate limiting por usuário para controlar custos | — |

---

## RNF-03 — Segurança

| ID | Requisito | Detalhes |
|---|---|---|
| RNF-03.1 | Todas as comunicações devem usar HTTPS/TLS 1.2+ | — |
| RNF-03.2 | Senhas devem ser armazenadas com hash bcrypt (custo ≥ 12) | — |
| RNF-03.3 | Tokens de autenticação devem expirar em 24h (access) e 30 dias (refresh) | — |
| RNF-03.4 | A API deve validar e sanitizar todos os inputs do usuário | Prevenção de XSS e injection |
| RNF-03.5 | Rate limiting deve ser aplicado nos endpoints de autenticação | Prevenção de brute force |
| RNF-03.6 | Chaves de API de terceiros (IA, Stripe) não devem ser expostas no frontend | — |
| RNF-03.7 | Dados de conversas devem ser armazenados criptografados em repouso | — |

---

## RNF-04 — Disponibilidade

| ID | Requisito | Meta |
|---|---|---|
| RNF-04.1 | SLA de disponibilidade da aplicação | ≥ 99% (exclui janelas de manutenção) |
| RNF-04.2 | Janelas de manutenção devem ser comunicadas com 24h de antecedência | — |
| RNF-04.3 | Em caso de indisponibilidade da API de IA, exibir mensagem amigável ao usuário | Sem crash da aplicação |

---

## RNF-05 — Usabilidade

| ID | Requisito | Detalhes |
|---|---|---|
| RNF-05.1 | A interface deve ser responsiva para desktop e mobile | Mobile-first |
| RNF-05.2 | O fluxo de onboarding deve ter no máximo 3 etapas até o primeiro chat | Reduzir fricção |
| RNF-05.3 | O sistema deve exibir feedback visual para todas as ações do usuário | Loading, sucesso, erro |
| RNF-05.4 | Mensagens de erro devem ser compreensíveis e orientar a ação do usuário | Sem jargão técnico |
| RNF-05.5 | A aplicação deve funcionar nos browsers modernos (Chrome, Firefox, Safari, Edge) | Últimas 2 versões |

---

## RNF-06 — Manutenibilidade

| ID | Requisito | Detalhes |
|---|---|---|
| RNF-06.1 | O código deve ter cobertura de testes de ao menos 70% nas funcionalidades críticas | Auth, chat, billing |
| RNF-06.2 | A aplicação deve ter logs estruturados para rastreamento de erros | — |
| RNF-06.3 | O ambiente de produção deve ter monitoramento e alertas configurados | Uptime + erros |
| RNF-06.4 | O deploy deve ser automatizado via CI/CD | GitHub Actions |

---

## RNF-07 — Privacidade e Compliance

| ID | Requisito | Detalhes |
|---|---|---|
| RNF-07.1 | O produto deve estar em conformidade com a LGPD | Dados de usuários brasileiros |
| RNF-07.2 | O usuário deve poder exportar seus dados e histórico | Direito de portabilidade |
| RNF-07.3 | O usuário deve poder excluir permanentemente sua conta e todos os dados | Direito ao esquecimento |
| RNF-07.4 | A política de privacidade deve ser clara e acessível antes do cadastro | — |
| RNF-07.5 | Conversas não devem ser usadas para treinar modelos sem consentimento explícito | — |
