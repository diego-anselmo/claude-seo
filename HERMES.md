# Claude SEO for Hermes

## Objetivo

Adaptar o repositório `claude-seo` para uso Hermes-first, com um único entrypoint operacional em vez de expor a árvore de agentes do Claude.

Entry point criado:
- `hermes/claude-seo-orchestrator/SKILL.md`

## O que muda conceitualmente

Antes:
- superfície principal pensada para Claude Code
- comandos `/seo ...`
- múltiplos subagents em `agents/`

Agora, para Hermes:
- um orquestrador único
- o diretório `agents/` vira referência opcional, não dependência de runtime
- as skills e scripts do repo viram backend operacional
- a delegação passa a ser decisão do Hermes, não requisito estrutural do produto

## Como usar no Hermes

Carregue a skill do orquestrador e peça em linguagem natural o trabalho desejado.

Exemplos:
- "Faça uma auditoria SEO completa de https://example.com usando o repositório claude-seo"
- "Analise tecnicamente https://example.com com o toolkit claude-seo"
- "Aplique FLOW optimize em https://example.com usando os prompts do repo"
- "Verifique backlinks de https://example.com usando o repo claude-seo"

## Mapeamento rápido

Comandos antigos do Claude Code:
- `/seo audit <url>`
- `/seo page <url>`
- `/seo technical <url>`
- `/seo content <url>`
- `/seo schema <url>`
- `/seo flow <stage> <url>`

Equivalente Hermes:
- pedir o objetivo em linguagem natural
- deixar o orquestrador decidir skill, scripts e eventual delegação

## Regra operacional

O Hermes deve:
1. localizar a raiz do repo
2. classificar a intenção
3. carregar só a skill específica necessária
4. usar os scripts do diretório `scripts/` como backend de execução
5. consolidar tudo em uma resposta final única

## Fontes principais

- `skills/seo/SKILL.md`
- `skills/seo-*/SKILL.md`
- `scripts/*.py`
- `skills/seo/references/*`
- `skills/seo-flow/references/*`

## Limite importante

Esta adaptação ainda não removeu nem reescreveu toda a documentação Claude-first do repo.

Ou seja:
- o repo já ganhou um entrypoint Hermes
- mas README, installers e docs continuam majoritariamente orientados a Claude Code

## Próxima fase recomendada

1. trocar a instalação para também suportar `~/.hermes/skills/...`
2. criar um instalador Hermes dedicado
3. revisar README para dual-mode ou Hermes-first
4. converter ou aposentar gradualmente `agents/*.md`
5. criar testes mínimos para a skill Hermes e para o fluxo de roteamento
