Scriptname CheatBunker:Importer:Item extends Quest Hidden

Import InjectTec:Utility:HexidecimalLogic

InjectTec:Plugin Property MyPlugin Auto Const Mandatory

String sStateUnloaded = "Unloaded" Const
String sStateLoading = "Loading" Const
String sStateLoaded = "Loaded" Const

Function goToUnloaded()
	GoToState(sStateUnloaded)
EndFunction

Function goToLoading()
	GoToState(sStateLoading)
EndFunction

Function goToLoaded()
	GoToState(sStateLoaded)
EndFunction

Event OnQuestShutdown()
	goToUnloaded()
EndEvent

Function addFormList(ObjectReference akContainerRef, FormList targetList, Int iAmount = 1)
	if (!targetList || !targetList.GetSize() || !akContainerRef)
		return
	endIf
	
	Int iCounter = 0
	Int iSize = targetList.GetSize()
	while (iCounter < iSize)
		akContainerRef.AddItem(targetList.GetAt(iCounter), iAmount)
		iCounter += 1
	endWhile
EndFunction

Function addToContainer(ObjectReference containerRef)
	
EndFunction

Bool Function hasLoaded()
	return false
EndFunction

InjectTec:Plugin Function getPlugin()
	return MyPlugin
EndFunction

Bool Function meetsPluginRequirements()
	return MyPlugin && MyPlugin.isInstalled()
EndFunction

DigitSet[] Function getDigitSets()
	return None
EndFunction

Function reload()
	
EndFunction

Function unloadBehavior()

EndFunction

Bool Function loadBehavior()

EndFunction

Function addBehavior(ObjectReference containerRef)
	
EndFunction

Auto State Unloaded
	Event OnBeginState(String asOldState)
		unloadBehavior()
	EndEvent
	
	Event OnQuestInit()
		goToLoading()
	EndEvent
	
	Function goToUnloaded()
		
	EndFunction
EndState

State Loading
	Event OnBeginState(String asOldState)
		if (meetsPluginRequirements() && loadBehavior())
			goToLoaded()
		else
			Stop()
		endif
	EndEvent
	
	Function goToLoading()
		
	EndFunction
EndState

State Loaded
	Function reload()
		Stop()
		Start()
	EndFunction
	
	Bool Function hasLoaded()
		return true
	EndFunction
	
	Function addToContainer(ObjectReference containerRef)
		addBehavior(containerRef)
	EndFunction
	
	Function goToLoaded()
		
	EndFunction
EndState
