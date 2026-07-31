#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "==> Building StardewIslandMod..."
cd "$PROJECT_DIR"

if ! command -v dotnet &>/dev/null; then
    echo "❌ .NET SDK not found. Install from https://dotnet.microsoft.com/download/dotnet/6.0"
    exit 1
fi

dotnet build --configuration Debug 2>&1
BUILD_EXIT=$?

if [ $BUILD_EXIT -eq 0 ]; then
    echo ""
    echo "✅ Build succeeded!"
    echo "   Output: $PROJECT_DIR/bin/Debug/net6.0/"
    
    # Check if mod was deployed
    CSPROJ_GAME_PATH=$(grep -oP '(?<=<GamePath>).*(?=</GamePath>)' "$PROJECT_DIR/StardewIslandMod.csproj" 2>/dev/null || true)
    if [ -n "$CSPROJ_GAME_PATH" ] && [ -d "$CSPROJ_GAME_PATH/Mods/StardewIslandMod" ]; then
        echo "   Deployed to: $CSPROJ_GAME_PATH/Mods/StardewIslandMod/"
    else
        echo "   ⚠️  Mod not deployed. Set <GamePath> in .csproj to your Stardew Valley installation."
    fi
else
    echo ""
    echo "❌ Build failed with exit code $BUILD_EXIT"
    exit $BUILD_EXIT
fi
