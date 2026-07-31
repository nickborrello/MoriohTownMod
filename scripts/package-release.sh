#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
RELEASE_DIR="$PROJECT_DIR/releases"

export PATH="/usr/local/share/dotnet/x64:/usr/local/share/dotnet:$PATH"
export DOTNET_CLI_HOME="$PROJECT_DIR/scratch/.dotnet_home"
export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
export DOTNET_NOLOGO=true
mkdir -p "$PROJECT_DIR/scratch/.dotnet_home"

# Extract version from manifest
VERSION=$(python3 -c "import json; print(json.load(open('$PROJECT_DIR/manifest.json'))['Version'])")
MOD_NAME="StardewIslandMod"

echo "==> Packaging $MOD_NAME v$VERSION..."

# Build release configuration
echo "--- Building Release ---"
cd "$PROJECT_DIR"
dotnet build --configuration Release

# Verify Content Patcher pack version matches
CP_VERSION=$(python3 -c "import json; print(json.load(open('$PROJECT_DIR/[CP] StardewIslandMod/manifest.json'))['Version'])")
if [ "$VERSION" != "$CP_VERSION" ]; then
    echo "❌ Version mismatch! SMAPI mod: $VERSION, Content Pack: $CP_VERSION"
    exit 1
fi

# Create release directory
mkdir -p "$RELEASE_DIR"

# Create release zip
ZIP_NAME="${MOD_NAME}_v${VERSION}.zip"
TMP_DIR=$(mktemp -d)

# Copy SMAPI mod files
mkdir -p "$TMP_DIR/$MOD_NAME"
cp "$PROJECT_DIR/bin/Release/net6.0/$MOD_NAME.dll" "$TMP_DIR/$MOD_NAME/"
cp "$PROJECT_DIR/manifest.json" "$TMP_DIR/$MOD_NAME/"

# Copy Content Patcher pack
cp -r "$PROJECT_DIR/[CP] StardewIslandMod" "$TMP_DIR/"

# Copy assets
if [ -d "$PROJECT_DIR/assets" ]; then
    cp -r "$PROJECT_DIR/assets" "$TMP_DIR/$MOD_NAME/"
fi

# Create zip
cd "$TMP_DIR"
zip -r "$RELEASE_DIR/$ZIP_NAME" . -x '*.DS_Store'

# Cleanup
rm -rf "$TMP_DIR"

echo ""
echo "✅ Release packaged: $RELEASE_DIR/$ZIP_NAME"
echo "   SMAPI Mod Version: $VERSION"
echo "   Content Pack Version: $CP_VERSION"
ls -lh "$RELEASE_DIR/$ZIP_NAME"
