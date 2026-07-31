# 🏝️ Morioh Island Mod — JoJo Part 4 in Stardew Valley

**Morioh Island Mod** brings **Morioh Town** — the iconic coastal town from *JoJo's Bizarre Adventure Part 4: Diamond is Unbreakable* (1999 Bizarre Summer) — into **Stardew Valley** as a new explorable island destination!

---

## 🌟 Planned Landmarks & Features

- 🛳️ **Morioh Port & Ferry**: Travel from Pelican Town Beach dock across the sea to Morioh Town.
- 🪨 **Boing-Boing Rock & Landmark Spots**: Explore famous Morioh locations including Boing-Boing Rock, Kameyu Department Store, Café Deux Magots, and Morioh Radio Station.
- 🍝 **Trattoria Trussardi**: Visit Tonio Trussardi's restaurant for special culinary dishes and health-restoring meals.
- 📻 **Morioh Radio BGM**: Original atmosphere, dialogue, and sound design inspired by Morioh Town.
- 👥 **Characters & Quests**: Interact with Morioh residents with custom dialogue and cutscenes.

---

## 📦 Requirements

- **Stardew Valley** 1.6+
- **SMAPI** 4.0+
- **Content Patcher** 2.0+
- **.NET 6 SDK** (for building from source)

---

## 🚀 Quick Start (Building & Playing)

### 1. Prerequisites
Ensure you have **Stardew Valley 1.6+**, **SMAPI 4.0+**, and **.NET 6 SDK** installed on your system.

### 2. Clone the Repository
```bash
git clone https://github.com/nickborrello/MoriohIslandMod.git
cd MoriohIslandMod
```

### 3. Build & Auto-Deploy
Run the build script:
```bash
./scripts/build-mod.sh
```
This script compiles the C# SMAPI mod using `Pathoschild.Stardew.ModBuildConfig` and deploys both the **C# SMAPI Mod** and the **Content Patcher Pack** directly into your Stardew Valley `Mods/` directory:
- `Mods/StardewIslandMod/`
- `Mods/[CP] StardewIslandMod/`

### 4. Launch Stardew Valley
Launch Stardew Valley using **SMAPI**. You will see the mod load in the SMAPI console:
```
[INFO  SMAPI] Morioh Island Mod loaded — Welcome to Morioh Town (1999 Bizarre Summer)!
```

---

## 🛠️ Developer Tooling

This repository includes a set of dev automation scripts:

| Script | Command | Purpose |
|--------|---------|---------|
| **Build & Deploy** | `./scripts/build-mod.sh` | Compiles .NET 6 assembly & copies mod + Content Pack to `Mods/` |
| **Validate Manifests** | `./scripts/validate-manifests.sh` | Validates JSON syntax and required manifest/content fields |
| **Check SMAPI Logs** | `./scripts/read-smapi-errors.sh` | Parses SMAPI logs for errors and warnings |
| **Package Release** | `./scripts/package-release.sh` | Creates a release ZIP archive in `releases/` |

---

## 📂 Project Architecture

```
MoriohIslandMod/
├── StardewIslandMod.csproj        # .NET 6 C# project configuration
├── manifest.json                  # SMAPI mod manifest
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

## 📄 License

This project is open-source and licensed under the [MIT License](LICENSE).
