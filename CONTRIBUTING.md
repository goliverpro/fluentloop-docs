# 🤝 Como Contribuir com a Documentação

Obrigado por querer contribuir com o FluentLoop Docs!

## Estrutura

```
docs/
├── product/        # Visão e estratégia de produto
├── requirements/   # Requisitos funcionais e não-funcionais
├── architecture/   # Decisões técnicas e diagramas
├── adr/            # Architecture Decision Records
├── design/         # UX, wireframes e design system
├── testing/        # Estratégia e planos de teste
└── deployment/     # Infraestrutura e CI/CD
```

## Fluxo de Contribuição

1. Abra uma **Issue** descrevendo a mudança proposta
2. Crie uma branch com o padrão: `docs/<secao>/<descricao-curta>`
   - Ex: `docs/requirements/rf-chat`
3. Faça as alterações nos arquivos `.md` em `docs/`
4. Abra um **Pull Request** apontando para `main`
5. Aguarde revisão

## Convenções

- Títulos em português
- Linguagem clara e objetiva
- Use os admonitions do MkDocs Material para destaques:
  - `!!! note` — informação adicional
  - `!!! tip` — dica
  - `!!! warning` — atenção
  - `!!! danger` — risco crítico

## Rodando localmente

```bash
pip install mkdocs-material
mkdocs serve
```

Acesse em `http://localhost:8000`
