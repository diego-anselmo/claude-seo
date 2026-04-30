#!/usr/bin/env bash
set -euo pipefail

main() {
    REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    TARGET_DIR="${HOME}/.hermes/skills/claude-seo-orchestrator"

    echo "════════════════════════════════════════"
    echo "║   Claude SEO for Hermes             ║"
    echo "║   Hermes Skill Installer            ║"
    echo "════════════════════════════════════════"
    echo

    mkdir -p "${TARGET_DIR}"
    cp "${REPO_ROOT}/hermes/claude-seo-orchestrator/SKILL.md" "${TARGET_DIR}/SKILL.md"

    echo "✓ Skill instalada em: ${TARGET_DIR}"
    echo
    echo "Uso sugerido:"
    echo "  hermes -s claude-seo-orchestrator"
    echo "  ou /skill claude-seo-orchestrator"
    echo
    echo "Depois peça em linguagem natural, por exemplo:"
    echo "  Faça uma auditoria SEO completa de https://example.com usando o repositório claude-seo"
}

main "$@"
