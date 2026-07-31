# AGENT.md — Developer & AI Agent Guidelines

This repository contains **Morioh-cho Mod**, a hybrid Stardew Valley mod (C# SMAPI mod + Content Patcher pack) adding **Morioh-cho** (S-City, M-Prefecture) from *JoJo's Bizarre Adventure Part 4: Diamond is Unbreakable*.

---

## Technical Stack

- **Game Target**: Stardew Valley 1.6+
- **API Framework**: SMAPI 4.0+
- **Target Runtime**: .NET 6 (`net6.0`)
- **Build Infrastructure**: `Pathoschild.Stardew.ModBuildConfig` 4.*
- **Asset Engine**: Content Patcher 2.0+

---

## Preference Hierarchy

1. **Content Patcher First**: Use Content Patcher JSON (`[CP] StardewIslandMod/content.json`) for maps (`Maps/MoriohCho`), sprite overlays, dialogue, location entries (`Data/Locations`), shop data, and audio cues.
2. **SMAPI APIs Second**: Use C# event handlers (`ModEntry.cs`) for warp triggers, custom mechanics, unlock flags, save state persistence, and cutscenes.
3. **Harmony Patches Last**: Use Harmony patches only if SMAPI APIs or Content Patcher cannot accomplish the task.

---

## Directory Structure

```
focused-faraday/
├── StardewIslandMod.csproj        # .NET 6 C# project configuration
├── manifest.json                  # SMAPI mod manifest (NickBorrello.MoriohChoMod)
├── ModEntry.cs                    # Main SMAPI entry point & event handlers
├── AGENT.md                       # Developer guidelines (this file)
├── README.md                      # Repository documentation
├── [CP] StardewIslandMod/         # Content Patcher pack
├── assets/                        # Custom maps, tilesets, sprites, portraits, dialogue
│   ├── maps/
│   ├── tilesets/
│   ├── sprites/
│   ├── portraits/
│   └── dialogue/
└── scripts/                       # Build & test automation scripts
```

---

## Development Rules

1. Inspect `manifest.json`, `StardewIslandMod.csproj`, and `content.json` before modifying data structures.
2. Make minimal, targeted edits.
3. Always run `./scripts/build-mod.sh` after code or asset changes.
4. Run `./scripts/validate-manifests.sh` whenever modifying JSON files.
5. Check `SMAPI-latest.txt` (or `./scripts/read-smapi-errors.sh`) for errors or missing asset warnings.
6. Never alter original game content files directly.
7. Never test on a primary save file.

---

## Commands

```bash
./scripts/build-mod.sh          # Build C# mod & deploy mod + CP pack
./scripts/validate-manifests.sh # Validate JSON syntax and manifest fields
./scripts/read-smapi-errors.sh # Parse SMAPI error logs
./scripts/package-release.sh   # Package release ZIP
```
