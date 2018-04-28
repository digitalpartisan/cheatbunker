Scriptname CheatBunker:Version:Stored extends Chronicle:Version:Stored Conditional
{This script was left the way it is because of the need to preserve state following the integration of Chronicle in to the Cheat Bunker's codebase.
Making certain that each package knows for sure what version it is currently at is critical to being able to perform in-situ updates that do not
require uninstalling and reinstalling every time a release occurs.  Certain high-level aspects of Chronicle were designed as extentions of existing
Cheat Bunker logic and the stored version script is identical in its relevant variable names, so this extension ensures a seemless transition from
pre-1.8.0 cheat bunker installations to the Chronicle-based 1.8.0 upgrade.}