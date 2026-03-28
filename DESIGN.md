# FluentLoop — Design System

> Referência de todas as decisões visuais do projeto.
> Atualize ao final de cada sessão de design.

---

## Identidade Visual

### Logo — `LoopIcon` / `NavLogo`

**Conceito:** Speech bubble com símbolo do infinito (∞) no interior.
- Bolha = conversa
- Infinito = loop de prática contínua

**Versão painel azul** (login, tela de loading):
- Bolha: `fill="white" fillOpacity="0.15"` + `stroke="white" strokeOpacity="0.5"` — semitransparente sobre fundo azul
- Símbolo ∞: `stroke="white"`, `strokeWidth="2.5"`, `fill="none"`

**Versão TopNav** (sobre fundo escuro `#111D35`):
- Bolha: `fill="#006DB2"` sólido
- Símbolo ∞: `stroke="white"`, `strokeWidth="2.5"`, `fill="none"`

**SVG path da bolha:** `M4 2H40C42.2 2 44 3.8 44 6V28C44 30.2 42.2 32 40 32H24L12 42V32H4C1.8 32 0 30.2 0 28V6C0 3.8 1.8 2 4 2Z`
**SVG path do ∞:** `M22 17C19 11 9 11 9 17C9 23 19 23 22 17C25 11 35 11 35 17C35 23 25 23 22 17Z`
**ViewBox:** `0 0 44 44`

**Wordmark:** "FluentLoop" — Inter Bold, `fontSize: 1rem`, `letterSpacing: -0.01em`, branco

---

## Paleta de Cores

### Primária
| Token | Hex | Uso |
|---|---|---|
| `primary` | `#006DB2` | Botões, links ativos, destaques, bolha do usuário no chat |
| `primary-dark` | `#005490` | Hover de botões primários |
| `primary-light` | `#0088DC` | Links |
| `primary-subtle` | `#E6F3FA` | Backgrounds sutis |
| `primaryBg` (inline) | `rgba(0,109,178,0.10)` | Fundo de ícones, nav ativo |

### Dark Theme — tokens em uso (inline styles)
| Nome | Hex | Uso |
|---|---|---|
| `bg` | `#0B1426` | Fundo base de todas as páginas internas |
| `surface` | `#111D35` | Cards, TopNav, header do chat, balão IA |
| `elevated` | `#162040` | Input do chat, inputs dark |
| `border` | `#1E3050` | Bordas de cards, divisores, trilha do spinner |
| `text` | `#F1F5F9` | Texto principal |
| `muted` | `#94A3B8` | Labels, subtítulos, placeholder, texto secundário |

### Semânticas
| Token | Hex | Uso |
|---|---|---|
| `success` | `#10B981` | Taxa de erros baixa, correções certas, dificuldade A2 |
| `successBg` | `rgba(16,185,129,0.10)` | Fundo ícone Cenários |
| `error` | `#EF4444` | Erros, taxa alta, hover do logout |
| `warning` | `#F59E0B` | Taxa média, dificuldade B2, badge Pro |

---

## Tipografia

- **Família:** Inter (via `next/font/google`)
- **Mono:** JetBrains Mono (feedback de pronúncia, código)
- **Padrão de tamanhos:**
  - Título de página: `1.5rem`, `fontWeight: 700`
  - Subtítulo: `0.875rem`, `color: muted`
  - Card title: `0.9375rem`, `fontWeight: 600`
  - Texto corrido: `0.875rem`
  - Labels / badges: `0.6875rem–0.75rem`

---

## Animações (`globals.css`)

```css
@keyframes spin  { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
@keyframes pulse { 0%, 100% { opacity: 1; } 50% { opacity: 0; } }
```

- `spin` — usado no `Spinner` e no loading dos botões
- `pulse` — usado no cursor de streaming do chat e na logo da tela de loading

---

## Layout das Páginas Internas

### Estrutura geral
```
<div style="minHeight:100vh; background:#0B1426; display:flex; flexDirection:column">
  <TopNav />                          ← height: 56px, sticky
  <main style="flex:1; overflow:hidden">
    {children}                        ← cada página centra seu conteúdo
  </main>
</div>
```

### Container de conteúdo (Dashboard, Cenários, Histórico)
```
maxWidth: 860px
margin: 0 auto
padding: 2rem 1.5rem
width: 100%
```

### Tela de Chat
```
height: calc(100vh - 56px)   ← 56px = altura do TopNav
display: flex
flexDirection: column
```
- Mensagens centralizadas: `maxWidth: 700px, margin: 0 auto`
- Input centralizado: `maxWidth: 700px, margin: 0 auto`

---

## Componentes

### `TopNav` (`src/components/layout/TopNav.tsx`)
- Height: `56px`, `position: sticky`, `top: 0`, `zIndex: 50`
- Background: `#111D35`, `borderBottom: 1px solid #1E3050`
- Logo à esquerda, links de nav no centro, logout à direita
- Link ativo: `color: #006DB2`, `background: rgba(0,109,178,0.12)`, `borderRadius: 8px`
- Link inativo: `color: #94A3B8`, hover muda para `#F1F5F9`
- Logout hover: `color: #EF4444`, `background: rgba(239,68,68,0.08)`

### `Button` (`src/components/ui/Button.tsx`)
- 100% inline styles — não depende do Tailwind para estilos críticos
- Hover via `useState` + `onMouseEnter/Leave`
- `size="lg"` tem `width: 100%`
- Primary: `#006DB2` → hover `#005490`
- Secondary: `#162040` → hover `#1a2a4a`, borda `#1e3050`

### `Input` (`src/components/ui/Input.tsx`)
- Props: `variant` ("light" | "dark"), `leftIcon`, `label`, `error`
- Foco gerenciado por `useState`: borda azul + `box-shadow: 0 0 0 3px rgba(0,109,178,0.15)`
- Ícone esquerdo muda para `#006DB2` no foco
- **Light** (auth): bg `#ffffff`, borda `#d1d5db`
- **Dark** (app): bg `#162040`, borda `#1e3050`

### `Spinner` (`src/components/ui/Spinner.tsx`)
- SVG inline com trilha `#1E3050` e arco `#006DB2`
- `strokeDasharray="22 66"` para efeito de arco parcial
- Animação via `@keyframes spin` do `globals.css`
- Sizes: sm=16px, md=24px, lg=36px

### `SessionCard` (`src/components/session/SessionCard.tsx`)
- Surface `#111D35`, borda `#1E3050` → hover borda `rgba(0,109,178,0.4)`
- Badge de pilar: bg `rgba(0,109,178,0.12)`, texto `#006DB2`
- Taxa de erros: verde (<20%), amarelo (<40%), vermelho (≥40%)

### `ScenarioCard` (`src/components/scenarios/ScenarioCard.tsx`)
- Mesmo padrão do SessionCard
- Badge Pro: bg `rgba(245,158,11,0.12)`, texto `#F59E0B`
- Dificuldade A2=verde, B1=amarelo, B2=vermelho

### `ChatMessage` (`src/components/chat/ChatMessage.tsx`)
- Usuário: bg `#006DB2`, texto branco, `borderRadius: 16px 16px 4px 16px`
- IA: bg `#111D35`, borda `#1E3050`, `borderRadius: 16px 16px 16px 4px`
- Bloco de correções: borda `rgba(239,68,68,0.25)`, erro riscado → correto verde

### `ChatInput` (`src/components/chat/ChatInput.tsx`)
- Container: bg `#162040`, borda `#1E3050`, `borderRadius: 14px`
- Botão enviar: azul quando ativo, `rgba(0,109,178,0.25)` quando desabilitado

---

## Telas de Auth

### Login (`src/app/(auth)/login/page.tsx`)
- Split layout `display:flex flexDirection:row` — inline styles (não depende do Tailwind)
- **Esquerda (branco):** título + inputs light + botão Entrar + GoogleButton + "Crie agora"
- **Direita (`#006DB2`):** logo + wordmark + slogan + dots decorativos
- Painel direito: `hidden` abaixo de `md` (768px)

### Google Button
- Fundo `#ffffff` → hover `#f1f5f9`
- Borda `1.5px solid #d1d5db`
- Sombra: repouso `0 1px 3px rgba(0,0,0,0.06)`, hover `0 2px 8px rgba(0,0,0,0.10)`
- Logo G SVG 4 cores oficiais (#4285F4, #34A853, #FBBC05, #EA4335)

---

## Loading / Transições

### `loading.tsx` (`src/app/(app)/loading.tsx`)
- Ativado automaticamente pelo Next.js App Router durante navegação
- Logo FluentLoop com animação `pulse`
- Texto "Carregando..." em `#94A3B8`
- Fundo herdado do layout (`#0B1426`)

---

## Histórico de Alterações

| Data | Arquivo | Mudança |
|---|---|---|
| 2026-03-26 | `tailwind.config.ts` | Paleta primária: roxo `#4F46E5` → azul `#006DB2` |
| 2026-03-26 | `globals.css` | CSS vars + dark theme tokens + `@keyframes spin/pulse` + placeholder |
| 2026-03-26 | `(auth)/login/page.tsx` | Split layout inline; logo bolha + ∞; painel azul à direita |
| 2026-03-26 | `components/ui/Button.tsx` | Reescrito com inline styles + hover por state |
| 2026-03-26 | `components/ui/Input.tsx` | Inline styles, leftIcon, variant light/dark, foco por state |
| 2026-03-26 | `components/ui/Spinner.tsx` | SVG inline trilha+arco, azul `#006DB2`, sem Tailwind |
| 2026-03-26 | `components/auth/LoginForm.tsx` | Ícones Mail/Lock; GoogleButton dedicado; removido divider "ou" |
| 2026-03-26 | `components/layout/TopNav.tsx` | **Novo** — substitui Sidebar; nav horizontal sticky 56px |
| 2026-03-26 | `(app)/layout.tsx` | Sidebar removida; TopNav + main flex-col |
| 2026-03-26 | `(app)/loading.tsx` | **Novo** — tela de transição com logo pulsando |
| 2026-03-26 | `(app)/dashboard/page.tsx` | Inline styles; stats cards; cards de ação; sessões recentes |
| 2026-03-26 | `(app)/scenarios/page.tsx` | Inline styles; filtros com azul ativo; grid 2 colunas |
| 2026-03-26 | `(app)/history/page.tsx` | Inline styles; lista paginada |
| 2026-03-26 | `(app)/chat/[sessionId]/page.tsx` | `calc(100vh-56px)`; mensagens e input centralizados 700px |
| 2026-03-26 | `components/session/SessionCard.tsx` | Inline styles; badge pilar azul; cor por taxa de erros |
| 2026-03-26 | `components/scenarios/ScenarioCard.tsx` | Inline styles; badges sem dependência de Tailwind |
| 2026-03-26 | `components/chat/ChatMessage.tsx` | Bolhas assimétricas; azul usuário, surface IA |
| 2026-03-26 | `components/chat/ChatInput.tsx` | Inline styles; botão enviar com estado visual |
