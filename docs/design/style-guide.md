# Guia de Estilo

> **Versão:** 1.0.0 | **Data:** 2026-03-21 | **Status:** ✅ Aprovado

---

## Princípios de Design

| Princípio | Descrição |
|---|---|
| **Calma** | O usuário expõe seus erros — o design não pode intimidar. Espaço em branco generoso, sem poluição visual. |
| **Clareza** | Feedback de pronúncia e correções precisam ser legíveis e rápidos de escanear. |
| **Foco** | Durante a sessão de prática, a UI some — o conteúdo é a conversa. |
| **Confiança** | Produto de IA com dados de voz — visual profissional e limpo transmite segurança. |

---

## 1. Paleta de Cores

### Cores Primárias

| Nome | Token | Hex | Uso |
|---|---|---|---|
| Primary | `--color-primary` | `#4F46E5` | CTAs principais, links, elementos interativos |
| Primary Dark | `--color-primary-dark` | `#3730A3` | Hover em botões primários |
| Primary Light | `--color-primary-light` | `#818CF8` | Bordas de foco, highlights sutis |
| Primary Subtle | `--color-primary-subtle` | `#EEF2FF` | Background de elementos selecionados |

### Cores de Acento

| Nome | Token | Hex | Uso |
|---|---|---|---|
| Accent | `--color-accent` | `#06B6D4` | Indicadores de voz, elementos de áudio, destaque |
| Accent Dark | `--color-accent-dark` | `#0891B2` | Hover em elementos de acento |
| Accent Subtle | `--color-accent-subtle` | `#ECFEFF` | Background de cards de compreensão |

### Cores Semânticas

| Nome | Token | Hex | Uso |
|---|---|---|---|
| Success | `--color-success` | `#10B981` | Pronúncia correta, nível avançado, confirmações |
| Success Subtle | `--color-success-subtle` | `#D1FAE5` | Background de badges de acerto |
| Error | `--color-error` | `#EF4444` | Erros de pronúncia, campos inválidos |
| Error Subtle | `--color-error-subtle` | `#FEE2E2` | Background de correções e erros |
| Warning | `--color-warning` | `#F59E0B` | Limite próximo (8/10 interações), score médio |
| Warning Subtle | `--color-warning-subtle` | `#FEF3C7` | Background de alertas de limite |

### Escala de Neutros

| Nome | Token | Hex | Uso |
|---|---|---|---|
| Gray 50 | `--color-gray-50` | `#F9FAFB` | Background da página |
| Gray 100 | `--color-gray-100` | `#F3F4F6` | Background de cards e inputs |
| Gray 200 | `--color-gray-200` | `#E5E7EB` | Bordas, divisores |
| Gray 400 | `--color-gray-400` | `#9CA3AF` | Placeholder, textos secundários |
| Gray 600 | `--color-gray-600` | `#4B5563` | Textos de suporte |
| Gray 800 | `--color-gray-800` | `#1F2937` | Texto principal |
| Gray 900 | `--color-gray-900` | `#111827` | Background dark mode |

### Modo Escuro

| Elemento | Light | Dark |
|---|---|---|
| Background | `#F9FAFB` | `#111827` |
| Surface (cards) | `#FFFFFF` | `#1F2937` |
| Texto principal | `#1F2937` | `#F9FAFB` |
| Texto secundário | `#4B5563` | `#9CA3AF` |
| Borda | `#E5E7EB` | `#374151` |

---

## 2. Tipografia

**Fonte:** [Inter](https://fonts.google.com/specimen/Inter) — Google Fonts, gratuita.
Escolhida por ser o padrão do mercado para SaaS, excelente legibilidade em telas e suporte completo a acentos do português.

### Escala Tipográfica

| Nome | Tamanho | Peso | Line Height | Uso |
|---|---|---|---|---|
| `display` | 48px | 700 | 1.1 | Hero da landing page |
| `h1` | 36px | 700 | 1.2 | Títulos de página |
| `h2` | 30px | 600 | 1.3 | Seções principais |
| `h3` | 24px | 600 | 1.4 | Subtítulos, títulos de cards |
| `h4` | 20px | 500 | 1.4 | Labels de seção |
| `body-lg` | 18px | 400 | 1.6 | Texto de destaque, leads |
| `body` | 16px | 400 | 1.6 | Texto padrão da interface |
| `body-sm` | 14px | 400 | 1.5 | Textos secundários, metadados |
| `caption` | 12px | 400 | 1.4 | Legendas, timestamps |
| `label` | 14px | 500 | 1.4 | Labels de formulários, badges |
| `code` | 14px | 400 | 1.5 | Fonemas, exemplos de pronúncia (fonte mono) |

### Fonte Mono

**`JetBrains Mono`** ou **`Fira Code`** — usada exclusivamente para:
- Transcrições fonéticas (ex: `/θriː/`)
- Exemplos de pronúncia
- Trechos de código (documentação)

---

## 3. Espaçamento

Baseado em múltiplos de **4px** (escala padrão do Tailwind CSS).

| Token | Valor | Uso típico |
|---|---|---|
| `space-1` | 4px | Espaço mínimo entre elementos inline |
| `space-2` | 8px | Padding interno de badges e chips |
| `space-3` | 12px | Gap entre ícone e texto |
| `space-4` | 16px | Padding interno de inputs e botões |
| `space-6` | 24px | Padding de cards |
| `space-8` | 32px | Espaço entre seções internas |
| `space-12` | 48px | Espaço entre seções da landing page |
| `space-16` | 64px | Espaço entre blocos maiores |

---

## 4. Bordas e Sombras

| Token | Valor | Uso |
|---|---|---|
| `radius-sm` | 6px | Badges, chips, tags |
| `radius-md` | 10px | Inputs, botões |
| `radius-lg` | 16px | Cards, modais |
| `radius-xl` | 24px | Balões de mensagem |
| `radius-full` | 9999px | Avatares, botão de voz (circular) |

| Token | Valor | Uso |
|---|---|---|
| `shadow-sm` | `0 1px 2px rgba(0,0,0,0.05)` | Cards em repouso |
| `shadow-md` | `0 4px 6px rgba(0,0,0,0.07)` | Cards com hover |
| `shadow-lg` | `0 10px 15px rgba(0,0,0,0.10)` | Modais, dropdowns |
| `shadow-focus` | `0 0 0 3px rgba(79,70,229,0.3)` | Foco em inputs (acessibilidade) |

---

## 5. Componentes

### Botões

```
Primário:     [  Começar grátis  ]   bg: #4F46E5  text: white  hover: #3730A3
Secundário:   [  Ver cenários    ]   bg: white    text: #4F46E5  border: #4F46E5
Ghost:        [  Cancelar        ]   bg: transparent  text: #4B5563  hover: gray-100
Destrutivo:   [  Excluir conta   ]   bg: white    text: #EF4444  border: #EF4444
```

**Tamanhos:**

| Tamanho | Padding | Font | Uso |
|---|---|---|---|
| `sm` | 8px 16px | 14px | Ações secundárias em cards |
| `md` | 12px 24px | 16px | Ações padrão |
| `lg` | 16px 32px | 18px | CTAs principais |
| `icon` | 10px | — | Botões apenas com ícone |

**Estados:**

| Estado | Visual |
|---|---|
| Default | Cor base |
| Hover | Escurece 10%, cursor pointer |
| Focus | `shadow-focus` + outline visível |
| Loading | Spinner + texto "Aguarde..." + desabilitado |
| Disabled | Opacidade 50%, cursor not-allowed |

---

### Inputs de Texto

```
Label          ← 14px, weight 500, gray-800
[____________] ← border gray-200, radius-md, padding 12px 16px
Hint text      ← 12px, gray-400
Erro           ← 12px, error (#EF4444)
```

**Estados:**
- **Default:** borda `gray-200`
- **Focus:** borda `primary` + `shadow-focus`
- **Error:** borda `error` + mensagem de erro abaixo
- **Disabled:** background `gray-100`, opacidade 60%

---

### Balões de Mensagem

```
Usuário (direita):
  ┌──────────────────────────────────┐
  │  I want to make a check in.     │  bg: #4F46E5, text: white
  └──────────────────────────────────┘  radius: 16px 16px 4px 16px

IA (esquerda):
  ┌──────────────────────────────────┐
  │  Of course! Could I have your   │  bg: white, text: gray-800
  │  name, please?                  │  border: gray-200
  └──────────────────────────────────┘  radius: 16px 16px 16px 4px
```

**Card de correção** (abaixo do balão do usuário):
```
  ┌──────────────────────────────────┐
  │  ✏️  "I want to" → "I'd like to" │  bg: #FEF3C7 (warning-subtle)
  │  Mais natural em contextos       │  border-left: 3px solid #F59E0B
  │  formais.              [Entendi] │  radius: 8px
  └──────────────────────────────────┘
```

**Card de erro de pronúncia:**
```
  ┌──────────────────────────────────┐
  │  🔴 "tree" → "three"            │  bg: #FEE2E2 (error-subtle)
  │  O som /θ/ é diferente de /t/.  │  border-left: 3px solid #EF4444
  └──────────────────────────────────┘  radius: 8px
```

---

### Badges

```
Nível A2:   [ A2 ]   bg: #ECFEFF   text: #0891B2   Cyan
Nível B1:   [ B1 ]   bg: #EEF2FF   text: #4F46E5   Indigo
Nível B2:   [ B2 ]   bg: #F0FDF4   text: #059669   Green

FREE:       [ FREE ]  bg: gray-100  text: gray-600
PRO:        [ PRO ★ ] bg: #4F46E5  text: white

Score alto (≥80):  [ 94pts ]  bg: success-subtle   text: success
Score médio (50-79):[ 67pts ]  bg: warning-subtle   text: warning
Score baixo (<50): [ 38pts ]  bg: error-subtle     text: error
```

---

### Botão de Voz (Push-to-Talk)

```
Repouso:
  ┌──────┐
  │  🎙️  │   circular, 72px, bg: primary (#4F46E5), shadow-md
  └──────┘   texto abaixo: "Segurar para falar"

Gravando:
  ┌──────┐
  │  ⏹   │   circular, 72px, bg: error (#EF4444)
  └──────┘   animação de pulse no border
             texto abaixo: "Gravando... 00:04"
             visualização de onda sonora acima
```

---

### Player de Áudio (TTS)

```
  ┌────────────────────────────────────────────────┐
  │  ▶  ──────────────●──────────── 0:04 / 0:07   │
  │                                                │
  │  [🐢 Lento]  [Normal ●]  [🐇 Rápido]          │
  │                               [🔁 Repetir]     │
  └────────────────────────────────────────────────┘
  bg: gray-50, border: gray-200, radius: 12px, padding: 16px
```

---

### Cards de Sessão (Histórico)

```
  ┌───────────────────────────────────────────────────┐
  │  🎭  Check-in em hotel                            │
  │  🎙️ Voz  ·  12 min  ·  18 msgs  ·  16% erros     │
  │  Hoje, 14h03                            [Ver →]  │
  └───────────────────────────────────────────────────┘
  bg: white, border: gray-200, radius: 12px, padding: 20px
  hover: shadow-md, cursor pointer
```

---

### Barra de Navegação (Mobile)

```
  ┌─────────────────────────────────────────────────┐
  │  🏠 Home   📋 Histórico   👤 Perfil             │
  │   ●                                             │  ← item ativo
  └─────────────────────────────────────────────────┘
  bg: white, border-top: gray-200, height: 64px
  ícone ativo: primary (#4F46E5)
  ícone inativo: gray-400
```

---

## 6. Ícones

**Biblioteca:** [Lucide Icons](https://lucide.dev/) — open source, consistente, disponível para React.

| Elemento | Ícone |
|---|---|
| Chat / Conversa livre | `MessageSquare` |
| Roleplay / Cenário | `Theater` ou `Layers` |
| Microfone / Voz | `Mic` |
| Parar gravação | `Square` |
| Áudio / Som | `Volume2` |
| Compreensão / Escuta | `Headphones` |
| Histórico | `ClockHistory` ou `History` |
| Perfil | `User` |
| Configurações | `Settings` |
| Nível / Progressão | `TrendingUp` |
| Correção / Edição | `PenLine` |
| Pronúncia correta | `CheckCircle` |
| Pronúncia errada | `XCircle` |
| Cadeado (PRO) | `Lock` |
| Upgrade / Pro | `Zap` |
| Notificações | `Bell` |
| Encerrar sessão | `LogOut` |
| Repetir áudio | `RotateCcw` |

---

## 7. Animações e Transições

**Princípio:** Animações devem ter propósito — indicar estado, guiar atenção, dar feedback. Nunca decorativas.

| Elemento | Animação | Duração |
|---|---|---|
| Hover em botões | `background-color ease` | 150ms |
| Hover em cards | `box-shadow ease` | 200ms |
| Abertura de modal | `fade-in + scale(0.95→1)` | 200ms |
| Fechamento de modal | `fade-out + scale(1→0.95)` | 150ms |
| Streaming de texto (IA) | Cursor piscando no fim do texto | — |
| Botão de voz (gravando) | `pulse` no border (border-color + scale) | 1.5s loop |
| Toast / notificação | `slide-in-from-top` | 300ms |
| Barra de progresso de áudio | `width linear` | tempo real |
| Troca de página | `fade` entre rotas | 200ms |

**Regra de acessibilidade:** Todas as animações devem respeitar `prefers-reduced-motion`:
```css
@media (prefers-reduced-motion: reduce) {
  * { animation: none !important; transition: none !important; }
}
```

---

## 8. Acessibilidade

| Requisito | Implementação |
|---|---|
| Contraste mínimo | AA (4.5:1 para texto, 3:1 para UI) — verificado com a paleta definida |
| Foco visível | `shadow-focus` em todos os elementos interativos |
| Labels em inputs | Sempre presentes — nunca usar apenas placeholder |
| Textos alternativos | `aria-label` em botões de ícone e controles de áudio |
| Ordem de foco | Tab order lógica em todos os formulários e modais |
| Mensagens de erro | Associadas ao input via `aria-describedby` |
| Controles de áudio | Teclado: Space = play/pause, ← → = seek, +/- = volume |

---

## 9. Responsividade

**Abordagem:** Mobile-first. Breakpoints baseados no Tailwind CSS.

| Breakpoint | Largura | Layout |
|---|---|---|
| `sm` | 640px | Mobile — nav bottom bar, layout 1 coluna |
| `md` | 768px | Tablet — layout 1-2 colunas |
| `lg` | 1024px | Desktop — sidebar lateral (se necessário) |
| `xl` | 1280px | Desktop wide — conteúdo max-width: 1200px |

**Regras principais:**
- Chat ocupa 100% da altura da viewport em mobile (`100dvh`)
- Botão de voz sempre fixo e acessível com o polegar em mobile
- Texto mínimo de 16px em mobile (evita zoom automático do iOS)
- Player de áudio adaptado para gestos touch
