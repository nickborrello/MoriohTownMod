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
            this.Monitor.Log("Morioh-cho Mod loaded — Welcome to Morioh-cho, S-City, M-Prefecture (1999 Bizarre Summer)!", LogLevel.Info);

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
            this.Monitor.Log("Registering Morioh-cho assets, landmarks, and travel routes...", LogLevel.Debug);

            // TODO: Register custom map locations (MoriohCho, BoingBoingRock, TrattoriaTrussardi, KameyuDeptStore)
            // TODO: Register warp points (e.g., Train Station / Bus Stop / Coastal Road to Morioh-cho)
            // TODO: Integrate with Content Patcher pack for dialogues & sprites
        }

        /// <summary>Raised after a save is loaded.</summary>
        private void OnSaveLoaded(object? sender, SaveLoadedEventArgs e)
        {
            this.Monitor.Log("Save loaded — checking Morioh-cho access & unlock status.", LogLevel.Debug);

            // TODO: Check if player has unlocked Morioh-cho (e.g., Morioh Radio Broadcast event)
            // TODO: Enable travel route based on unlock state
        }

        /// <summary>Raised after the player warps to a new location.</summary>
        private void OnWarped(object? sender, WarpedEventArgs e)
        {
            if (e.NewLocation.Name == "MoriohCho")
            {
                this.Monitor.Log("Player arrived in Morioh-cho! (Gureto daze!)", LogLevel.Info);
                // TODO: Trigger Morioh arrival cutscene & play Morioh Radio BGM
            }
        }
    }
}
