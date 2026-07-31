# 🏙️ Morioh Town Mod — JoJo Part 4 in Stardew Valley

**Morioh Town Mod** brings **Morioh Town** — the famous coastal town from *S-City, M-Prefecture* in *JoJo's Bizarre Adventure Part 4: Diamond is Unbreakable* (1999 Bizarre Summer) — into **Stardew Valley** as an expansive new town destination!

---

## 🌟 Lore Accuracy & Planned Landmarks

In JoJo's Bizarre Adventure lore, **Morioh Town** (杜王町, *Morioh-chō*) is a coastal town located within S-City, M-Prefecture on the Japanese mainland. This mod accurately models Morioh Town as a coastal town expansion accessible via coastal train/bus transit or harbor ferry from Pelican Town!

- 🚉 **Morioh Station & Coastal Transit**: Travel from Pelican Town to Morioh Station in S-City, M-Prefecture.
- 🪨 **Boing-Boing Rock & Coastal Coastline**: Explore famous Morioh landmarks including Boing-Boing Rock along the coast, Kameyu Department Store, Café Deux Magots, and Morioh Radio Station.
- 🍝 **Trattoria Trussardi**: Visit Tonio Trussardi's authentic Italian restaurant for special culinary dishes that cure fatigue and restore health.
- 📻 **Morioh Radio BGM**: Atmospheric audio, dialogue, and sound design inspired by Morioh's 1999 Bizarre Summer.
- 👥 **Town Residents & Quests**: Meet and interact with Morioh residents with custom dialogue, heart events, and Stand-inspired easter eggs.

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
git clone https://github.com/nickborrello/MoriohTownMod.git
cd MoriohTownMod
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
[INFO  SMAPI] Morioh Town Mod loaded — Welcome to Morioh Town, S-City, M-Prefecture (1999 Bizarre Summer)!
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
├── manifest.json                  # SMAPI mod manifest (NickBorrello.MoriohTownMod)
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
