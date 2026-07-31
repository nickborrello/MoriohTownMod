# AGENT.md — Developer & AI Agent Guidelines

This repository contains **Morioh Island Mod**, a hybrid Stardew Valley mod (C# SMAPI mod + Content Patcher content pack) that brings **Morioh Town** from *JoJo's Bizarre Adventure Part 4: Diamond is Unbreakable* to Stardew Valley.

---

## 🛠️ Stack & Standards

- **Game Target**: Stardew Valley 1.6+
- **API Framework**: SMAPI 4.0+
- **Target Runtime**: .NET 6 (`net6.0`)
- **Build Infrastructure**: `Pathoschild.Stardew.ModBuildConfig` 4.*
- **Asset Engine**: Content Patcher 2.0+

---

## 📐 Architecture & Preference Hierarchy

1. **Content Patcher First**: Use Content Patcher JSON (`[CP] StardewIslandMod/content.json`) for maps, sprite overlays, dialogue, location entries, shop data, and audio cues whenever possible.
2. **SMAPI APIs & Events Second**: Use C# event handlers (`ModEntry.cs`) for warp triggers, custom mechanics, unlock flags, save state persistence, and cutscene triggers.
3. **Harmony Patches Last**: Use Harmony patches **only** if SMAPI public APIs or Content Patcher cannot accomplish the task.

---

## 📁 Repository Directory Structure

```
focused-faraday/
├── AGENT.md                       # AI Agent / Dev guidelines (this file)
├── README.md                      # Human user documentation & setup guide
├── StardewIslandMod.csproj        # .NET 6 C# project configured with ModBuildConfig
├── manifest.json                  # SMAPI mod manifest (NickBorrello.MoriohIslandMod)
├── ModEntry.cs                    # Main SMAPI entry point & event handlers
├── [CP] StardewIslandMod/         # Content Patcher pack
│   ├── manifest.json              # CP manifest (NickBorrello.MoriohIslandMod.CP)
│   └── content.json               # Content Patcher patch definitions
├── assets/                        # Mod assets
│   ├── maps/                      # Tiled .tmx maps (e.g. MoriohIsland.tmx)
│   ├── tilesets/                  # Tileset PNG spritesheets
│   ├── sprites/                   # NPC, object, and vehicle sprites
│   ├── portraits/                 # NPC dialogue portraits
│   └── dialogue/                  # Dialogue JSON files
├── scripts/                       # Developer automation scripts
│   ├── build-mod.sh               # Build C# mod & deploy mod + CP pack to Mods/
│   ├── validate-manifests.sh      # Validate JSON syntax and required fields
│   ├── read-smapi-errors.sh       # Filter & read SMAPI error logs
│   └── package-release.sh         # Package release ZIP with matching versions
└── releases/                      # Built release ZIP archives (gitignored)
```

---

## 🔄 Required Workflow & Execution Rules

1. **Inspect Before Changing**: Read `manifest.json`, `StardewIslandMod.csproj`, and `content.json` before modifying data structures.
2. **Minimal Viable Edits**: Make target, localized edits. Do not refactor unrelated code.
3. **Build & Deploy**: Always run `./scripts/build-mod.sh` after code or asset changes.
4. **Validate JSON**: Run `./scripts/validate-manifests.sh` whenever modifying JSON manifests or `content.json`.
5. **Inspect SMAPI Logs**: Read `SMAPI-latest.txt` (or run `./scripts/read-smapi-errors.sh`) to verify there are no startup errors or missing asset warnings.
6. **Never Modify Game Originals**: Never alter or overwrite original game content files directly.
7. **Never Touch Primary Save**: Always test on clean or dev saves.

---

## 💻 C# & SMAPI Conventions

- **Entry Class**: Must inherit from `StardewModdingAPI.Mod`.
- **Lightweight `Entry()`**: Only subscribe to events and register services in `Entry()`. Do not perform heavy file or game operations here.
- **Event Subscriptions**: Clean up temporary event handlers when no longer needed.
- **Logging**: Use `this.Monitor.Log("message", LogLevel.Info/Debug/Warn/Error)`.
- **APIs**:
  - `this.Helper.Events` for game loops, player, and world events.
  - `this.Helper.GameContent` for loading/editing game assets.
  - `this.Helper.Data` for custom save data.
- **No Hallucinated Identifiers**: Verify item IDs, location names, and event IDs against official SDV 1.6 specifications before referencing them in C#.

---

## 🎭 Content Patcher Conventions

- Use `Format: "2.3.0"` or latest supported Content Patcher format.
- Every patch entry must include a clear, descriptive `LogName`.
- Use Content Patcher tokens (`{{Season}}`, `{{Day}}`, `{{Weather}}`, `{{HasFlag}}`, etc.) for conditions.
- Test patches in-game using SMAPI console commands:
  - `patch summary` — Lists all active patches and conditions.
  - `patch reload NickBorrello.MoriohIslandMod.CP` — Hot-reloads Content Patcher definitions without restarting the game.

---

## 🚀 Key Commands

```bash
# Build C# mod and deploy to Stardew Valley Mods folder:
./scripts/build-mod.sh

# Validate JSON manifests & content packs:
./scripts/validate-manifests.sh

# Read SMAPI warnings/errors:
./scripts/read-smapi-errors.sh

# Package release zip:
./scripts/package-release.sh
```
