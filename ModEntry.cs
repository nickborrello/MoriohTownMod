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
            this.Monitor.Log("Stardew Island Mod loaded — Mystic Isle awaits!", LogLevel.Info);

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
            this.Monitor.Log("Registering Mystic Isle assets and warps...", LogLevel.Debug);

            // TODO: Register custom map locations
            // TODO: Register warp points (e.g., from the beach or boat dock)
            // TODO: Integrate with Content Patcher pack if present
        }

        /// <summary>Raised after a save is loaded.</summary>
        private void OnSaveLoaded(object? sender, SaveLoadedEventArgs e)
        {
            this.Monitor.Log("Save loaded — checking Mystic Isle unlock status.", LogLevel.Debug);

            // TODO: Check if player has met island unlock conditions
            // TODO: Add/remove warp based on unlock state
        }

        /// <summary>Raised after the player warps to a new location.</summary>
        private void OnWarped(object? sender, WarpedEventArgs e)
        {
            if (e.NewLocation.Name == "MysticIsle")
            {
                this.Monitor.Log("Player arrived at Mystic Isle!", LogLevel.Info);
                // TODO: Trigger first-visit event/cutscene
            }
        }
    }
}
