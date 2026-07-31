#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Ensure dotnet binary path on macOS (including x64 location) is in PATH
export PATH="/usr/local/share/dotnet/x64:/usr/local/share/dotnet:$PATH"
export DOTNET_CLI_HOME="$PROJECT_DIR/scratch/.dotnet_home"
export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export DOTNET_NOLOGO=true
export DOTNET_MULTILEVEL_LOOKUP=0
mkdir -p "$PROJECT_DIR/scratch/.dotnet_home"

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
    CSPROJ_GAME_PATH=$(python3 -c "import xml.etree.ElementTree as ET; tree=ET.parse('$PROJECT_DIR/StardewIslandMod.csproj'); print(tree.find('.//GamePath').text)" 2>/dev/null || true)
    if [ -n "$CSPROJ_GAME_PATH" ] && [ -d "$CSPROJ_GAME_PATH/Mods/StardewIslandMod" ]; then
        echo "   Deployed SMAPI Mod to: $CSPROJ_GAME_PATH/Mods/StardewIslandMod/"
        if [ -d "$PROJECT_DIR/[CP] StardewIslandMod" ]; then
            echo "   Syncing Content Pack to: $CSPROJ_GAME_PATH/Mods/[CP] StardewIslandMod/"
            cp -R "$PROJECT_DIR/[CP] StardewIslandMod" "$CSPROJ_GAME_PATH/Mods/"
        fi
    else
        echo "   ⚠️  Mod not deployed. Set <GamePath> in .csproj to your Stardew Valley installation."
    fi
else
    echo ""
    echo "❌ Build failed with exit code $BUILD_EXIT"
    exit $BUILD_EXIT
fi
