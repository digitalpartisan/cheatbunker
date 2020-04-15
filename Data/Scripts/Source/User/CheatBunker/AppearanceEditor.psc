Scriptname CheatBunker:AppearanceEditor extends ObjectReference

Int Property BodyEdit = 10 Auto Const
Int Property FaceEdit = 11 Auto Const
String Property LooksMenu = "LooksMenu" Auto Const
Keyword Property AnimFaceArchetypePlayer Auto Const Mandatory
{Autofill}
Idle Property ElevatorFaceCamera Auto Mandatory
{Autofill}
Idle Property ElevatorBodyCamera Auto Mandatory
{Autofill}
ObjectReference Property CheatBunkerRaceMenuMarker Auto Const Mandatory
{Autofill}

InputEnableLayer RespecEnableLayer = None

Event OnActivate(ObjectReference akActionRef)
	Actor aPlayer = Game.GetPlayer()

	if (!aPlayer == akActionRef)
		return
	endif
	
	RegisterForMenuOpenCloseEvent(LooksMenu)
	RegisterForLooksMenuEvent()
	
	RespecEnableLayer = InputEnableLayer.Create()
	RespecEnableLayer.DisablePlayerControls(abCamSwitch = true)
	
	aPlayer.SetHasCharGenSkeleton()
	aPlayer.ChangeAnimFaceArchetype(None)
	aPlayer.MoveTo(CheatBunkerRaceMenuMarker)
	Utility.Wait(1)
	Game.ForceThirdPerson()
	Utility.Wait(1)
	aPlayer.PlayIdle(ElevatorFaceCamera)
	Utility.Wait(1)
	Game.ShowRaceMenu(uimode = 1)
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	if (LooksMenu == asMenuName && !abOpening)
		Actor aPlayer = Game.GetPlayer()
		RespecEnableLayer = None
		UnregisterForMenuOpenCloseEvent(LooksMenu)
		UnregisterForLooksMenuEvent()
		Game.ForceFirstPerson()
		aPlayer.SetHasCharGenSkeleton(False)
		aPlayer.ChangeAnimFaceArchetype(AnimFaceArchetypePlayer)
	endif
EndEvent

Event OnLooksMenuEvent(int aiFlavor)
	BodyEdit == aiFlavor && Game.GetPlayer().PlayIdle(ElevatorBodyCamera)
	FaceEdit == aiFlavor && Game.GetPlayer().PlayIdle(ElevatorFaceCamera)
EndEvent

Function DeleteMyInputLayer()
	RespecEnableLayer = none
EndFunction
