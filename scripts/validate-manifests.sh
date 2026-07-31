#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "==> Validating mod manifests..."
ERRORS=0

validate_json() {
    local file="$1"
    if ! python3 -m json.tool "$file" >/dev/null 2>&1; then
        echo "❌ Invalid JSON: $file"
        python3 -m json.tool "$file" 2>&1 | head -5
        ERRORS=$((ERRORS + 1))
        return
    fi
    echo "✅ Valid JSON: $file"
}

check_manifest_fields() {
    local file="$1"
    local required_fields=("Name" "Author" "Version" "UniqueID")
    for field in "${required_fields[@]}"; do
        if ! python3 -c "import json,sys; d=json.load(open(sys.argv[1])); assert '$field' in d" "$file" 2>/dev/null; then
            echo "   ⚠️  Missing required field '$field' in $file"
            ERRORS=$((ERRORS + 1))
        fi
    done
}

# Find and validate all manifest.json files
while IFS= read -r -d '' manifest; do
    echo ""
    echo "--- $(basename "$(dirname "$manifest")")/manifest.json ---"
    validate_json "$manifest"
    check_manifest_fields "$manifest"
done < <(find "$PROJECT_DIR" -name "manifest.json" -not -path "*/node_modules/*" -not -path "*/bin/*" -not -path "*/obj/*" -print0)

# Find and validate all content.json files
while IFS= read -r -d '' content; do
    echo ""
    echo "--- $(basename "$(dirname "$content")")/content.json ---"
    validate_json "$content"
    
    # Check Content Patcher specific fields
    if python3 -c "import json,sys; d=json.load(open(sys.argv[1])); assert 'Format' in d and 'Changes' in d" "$content" 2>/dev/null; then
        echo "   ✅ Has Format and Changes fields"
    else
        echo "   ⚠️  Missing 'Format' or 'Changes' field"
        ERRORS=$((ERRORS + 1))
    fi
done < <(find "$PROJECT_DIR" -name "content.json" -not -path "*/node_modules/*" -not -path "*/bin/*" -not -path "*/obj/*" -print0)

echo ""
if [ $ERRORS -eq 0 ]; then
    echo "✅ All manifests valid!"
else
    echo "❌ Found $ERRORS error(s)"
    exit 1
fi
