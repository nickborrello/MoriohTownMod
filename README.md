# Stardew Island Mod — Mystic Isle

Adds a new explorable island — **Mystic Isle** — to Stardew Valley with custom maps, NPCs, and quests.

## Requirements

- **Stardew Valley** 1.6+
- **SMAPI** 4.0+
- **.NET 6 SDK**
- **Content Patcher**

## Installation & Building from Source

1. Clone or download this repository.
2. Open `StardewIslandMod.csproj` and set your `GamePath` property (if not detected automatically):
   ```xml
   <GamePath>/path/to/Stardew Valley</GamePath>
   ```
3. Build the project using the .NET CLI:
   ```bash
   dotnet build
   ```
   Or run the build script:
   ```bash
   ./scripts/build-mod.sh
   ```
4. `Pathoschild.Stardew.ModBuildConfig` will automatically deploy the built mod files into your Stardew Valley `Mods/StardewIslandMod/` directory.

## Development Workflow

1. Set `GamePath` in `StardewIslandMod.csproj`.
2. Run `dotnet build` (or `./scripts/build-mod.sh`).
3. `ModBuildConfig` auto-deploys to `Mods/StardewIslandMod/`.
4. Launch Stardew Valley via SMAPI.
5. Check `SMAPI-latest.txt` for logs and errors.
6. Use Content Patcher debug commands in the SMAPI console:
   - `patch summary`
   - `patch reload YourName.StardewIslandMod`

## Project Structure

```
.
├── .gitignore
├── README.md
├── StardewIslandMod.csproj
├── manifest.json
└── ModEntry.cs
```

## License

This project is licensed under the [MIT License](LICENSE).
