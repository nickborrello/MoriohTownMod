# Morioh-cho Mod

A Stardew Valley expansion mod that adds **Morioh-cho** (杜王町) from *JoJo's Bizarre Adventure Part 4: Diamond is Unbreakable* (S-City, M-Prefecture) as an explorable coastal town destination.

---

## Features & Planned Landmarks

In JoJo's Bizarre Adventure lore, Morioh-cho is a coastal town located in S-City, M-Prefecture. This mod adds Morioh-cho as a town expansion accessible via transit from Pelican Town.

- **Morioh Station & Transit**: Travel between Pelican Town and Morioh-cho Station.
- **Boing-Boing Rock & Coastline**: Explore iconic locations along the coast including Boing-Boing Rock, Kameyu Department Store, Café Deux Magots, and Morioh Radio Station.
- **Trattoria Trussardi**: Visit Tonio Trussardi's restaurant for specialized dishes and health restoration.
- **Morioh Radio Audio & Atmosphere**: Background audio, dialogue, and environment inspired by 1999 Bizarre Summer.
- **Town Residents & Quests**: Custom NPCs, dialogues, heart events, and Stand-inspired features.

---

## Requirements

- **Stardew Valley** 1.6+
- **SMAPI** 4.0+
- **Content Patcher** 2.0+
- **.NET 6 SDK** (for building from source)

---

## Building and Installation

### 1. Prerequisites
Ensure Stardew Valley 1.6+, SMAPI 4.0+, and the .NET 6 SDK are installed.

### 2. Clone the Repository
```bash
git clone https://github.com/nickborrello/MoriohTownMod.git
cd MoriohTownMod
```

### 3. Build & Auto-Deploy
Run the build script:
```bash
./scripts/build-mod.sh
```

This compiles the C# SMAPI mod and copies both the assembly and the Content Patcher pack into your Stardew Valley `Mods/` directory:
- `Mods/StardewIslandMod/`
- `Mods/[CP] StardewIslandMod/`

### 4. Launch Stardew Valley
Launch Stardew Valley via SMAPI. The SMAPI console will log:
```
[INFO  SMAPI] Morioh-cho Mod loaded — Welcome to Morioh-cho, S-City, M-Prefecture (1999 Bizarre Summer)!
```

---

## Developer Tooling

| Script | Command | Purpose |
|--------|---------|---------|
| Build & Deploy | `./scripts/build-mod.sh` | Compiles .NET 6 assembly & copies mod + Content Pack to `Mods/` |
| Validate Manifests | `./scripts/validate-manifests.sh` | Validates JSON syntax and required manifest/content fields |
| Check SMAPI Logs | `./scripts/read-smapi-errors.sh` | Parses SMAPI logs for errors and warnings |
| Package Release | `./scripts/package-release.sh` | Creates a release ZIP archive in `releases/` |

---

## Project Structure

```
focused-faraday/
├── StardewIslandMod.csproj        # .NET 6 C# project configuration
├── manifest.json                  # SMAPI mod manifest (NickBorrello.MoriohChoMod)
├── ModEntry.cs                    # C# SMAPI entry point & event handlers
├── AGENT.md                       # Developer & AI Agent guidance
├── README.md                      # Repository overview & setup guide
├── [CP] StardewIslandMod/         # Content Patcher content pack
│   ├── manifest.json              # Content Patcher manifest
│   └── content.json               # Content Patcher patch definitions
├── assets/                        # Custom maps, tilesets, sprites, portraits, dialogue
│   ├── maps/
│   ├── tilesets/
│   ├── sprites/
│   ├── portraits/
│   └── dialogue/
└── scripts/                       # Build & test automation scripts
```

---

## License

This project is licensed under the [MIT License](LICENSE).
