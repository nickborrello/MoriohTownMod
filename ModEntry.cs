using StardewModdingAPI;
using StardewModdingAPI.Events;

namespace StardewIslandMod
{
    /// <summary>The main entry point for the Stardew Island Mod.</summary>
    public class ModEntry : Mod
    {
        /*********
        ** Public Methods
        *********/

        /// <summary>The mod entry point, called after the mod is first loaded.</summary>
        /// <param name="helper">Provides simplified APIs for writing mods.</param>
        public override void Entry(IModHelper helper)
        {
            this.Monitor.Log("Morioh Island Mod loaded — Welcome to Morioh Town (1999 Bizarre Summer)!", LogLevel.Info);

            // Subscribe to events
            helper.Events.GameLoop.GameLaunched += this.OnGameLaunched;
            helper.Events.GameLoop.SaveLoaded += this.OnSaveLoaded;
            helper.Events.Player.Warped += this.OnWarped;
        }

        /*********
        ** Private Methods
        *********/

        /// <summary>Raised after the game is launched, right before the first update tick.</summary>
        private void OnGameLaunched(object? sender, GameLaunchedEventArgs e)
        {
            this.Monitor.Log("Registering Morioh Town assets, landmarks, and ferry warps...", LogLevel.Debug);

            // TODO: Register custom map locations (MoriohIsland, BoingBoingRock, TrattoriaTrussardi)
            // TODO: Register warp points (e.g., from Beach Dock / Ferry to Morioh Port)
            // TODO: Integrate with Content Patcher pack for dialogues & sprites
        }

        /// <summary>Raised after a save is loaded.</summary>
        private void OnSaveLoaded(object? sender, SaveLoadedEventArgs e)
        {
            this.Monitor.Log("Save loaded — checking Morioh Town ferry ticket & unlock status.", LogLevel.Debug);

            // TODO: Check if player has unlocked Morioh Town (e.g., Ferry Ticket or TV Broadcast)
            // TODO: Enable warp based on unlock state
        }

        /// <summary>Raised after the player warps to a new location.</summary>
        private void OnWarped(object? sender, WarpedEventArgs e)
        {
            if (e.NewLocation.Name == "MoriohIsland")
            {
                this.Monitor.Log("Player arrived in Morioh Town! (Gureto daze!)", LogLevel.Info);
                // TODO: Trigger Morioh arrival cutscene & play Morioh Radio BGM
            }
        }
    }
}
