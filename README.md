# Morioh-cho Mod

A Stardew Valley expansion mod adding Morioh-cho from *JoJo's Bizarre Adventure Part 4: Diamond is Unbreakable*.

---

## Roadmap

### Locations
- **Morioh-cho Main Map**: Town center, residential district, and commercial zone.
- **Morioh Station**: Transit hub connecting Pelican Town to Morioh-cho.
- **Coastal District**: Boing-Boing Rock and seaside paths.
- **Kameyu Department Store**: Commercial shopping area.
- **Trattoria Trussardi**: Italian restaurant serving specialized buff dishes.
- **Café Deux Magots**: Outdoor cafe and meeting spot.
- **Morioh Radio Station**: Broadcast tower and studio.

### Characters
- **Josuke Higashikata**
- **Okuyasu Nijimura**
- **Rohan Kishibe**
- **Jotaro Kujo**
- **Koichi Hirose**
- **Tonio Trussardi**
- **Reimi Sugimoto**
- **Yoshikage Kira**

### Audio and Music
- **Morioh Radio OST**: Background music tracks for day, night, and seasons.
- Custom sound effects for character interactions and locations.

### Gameplay Mechanics
- **Trattoria Trussardi Dining**: Meals providing unique status effects and health restoration.
- **Custom Quests**: Storyline events and village tasks.
- **Heart Events**: Individual character progression and cutscenes.

---

## Requirements

- **Stardew Valley** 1.6+
- **SMAPI** 4.0+
- **Content Patcher** 2.0+
- **.NET 6 SDK** (for building from source)

---

## Building and Installation

### 1. Clone Repository
```bash
git clone https://github.com/nickborrello/MoriohTownMod.git
cd MoriohTownMod
```

### 2. Build and Deploy
```bash
./scripts/build-mod.sh
```

The build script compiles the C# assembly and copies the mod and Content Patcher pack into your Stardew Valley `Mods/` directory.

### 3. Launch Game
Launch Stardew Valley via SMAPI.

---

## Repository Structure

```
focused-faraday/
├── StardewIslandMod.csproj        # C# project configuration
├── manifest.json                  # SMAPI mod manifest
├── ModEntry.cs                    # C# SMAPI entry point
├── AGENT.md                       # Developer guidelines
├── README.md                      # Repository documentation
├── [CP] StardewIslandMod/         # Content Patcher pack
├── assets/                        # Maps, tilesets, sprites, portraits, dialogue
└── scripts/                       # Build and validation scripts
```

---

## License

MIT License
