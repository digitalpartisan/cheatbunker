Scriptname CheatBunker:Setting:GivePerk extends CheatBunker:Setting

Perk Property MyPerk Auto Const Mandatory

Function startupLogic()
    Game.GetPlayer().AddPerk(MyPerk)
EndFunction

Function shutdownLogic()
    Game.GetPlayer().RemovePerk(MyPerk)
EndFunction
