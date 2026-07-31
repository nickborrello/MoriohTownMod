#!/usr/bin/env bash
set -euo pipefail

# Default SMAPI log locations (macOS)
LOG_PATHS=(
    "$HOME/Library/Application Support/Steam/steamapps/common/Stardew Valley/ErrorLogs/SMAPI-latest.txt"
    "$HOME/.local/share/StardewValley/ErrorLogs/SMAPI-latest.txt"
)

SEVERITY="${1:-ERROR|WARN}"
MOD_FILTER="${2:-}"

# Find the log file
LOG_FILE=""
for path in "${LOG_PATHS[@]}"; do
    if [ -f "$path" ]; then
        LOG_FILE="$path"
        break
    fi
done

# Allow custom log path via environment variable
if [ -n "${SMAPI_LOG_PATH:-}" ]; then
    LOG_FILE="$SMAPI_LOG_PATH"
fi

if [ -z "$LOG_FILE" ] || [ ! -f "$LOG_FILE" ]; then
    echo "❌ SMAPI log not found."
    echo "   Searched: ${LOG_PATHS[*]}"
    echo "   Set SMAPI_LOG_PATH to specify a custom location."
    exit 1
fi

echo "==> Reading SMAPI log: $LOG_FILE"
echo "    Severity filter: $SEVERITY"
[ -n "$MOD_FILTER" ] && echo "    Mod filter: $MOD_FILTER"
echo ""

if [ -n "$MOD_FILTER" ]; then
    grep -E "\[($SEVERITY)\]" "$LOG_FILE" | grep -i "$MOD_FILTER" || echo "(no matching entries)"
else
    grep -E "\[($SEVERITY)\]" "$LOG_FILE" || echo "(no matching entries)"
fi

echo ""
echo "--- Log Summary ---"
echo "Errors: $(grep -c '\[ERROR\]' "$LOG_FILE" 2>/dev/null || echo 0)"
echo "Warnings: $(grep -c '\[WARN\]' "$LOG_FILE" 2>/dev/null || echo 0)"
