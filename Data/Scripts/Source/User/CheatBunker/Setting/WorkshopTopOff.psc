Scriptname CheatBunker:Setting:WorkshopTopOff extends CheatBunker:Setting Conditional

WorkshopParentScript Property WorkshopParent Auto Const Mandatory
{Autofill.}
WorkshopScript Property HomePlateWorkshop Auto Const Mandatory
{The Home Plate workshop reference.}
FormList Property CheatBunkerPackageBaseSettingWorkshopTopOffForms Auto Const Mandatory
{Autofill.}
Int Property TopOffThreshold = 100 Auto Const

String sStateBusy = "Busy" Const

Function goToBusy()
    GoToState(sStateBusy)
EndFunction

Function logTopOff(WorkshopScript targetWorkshop, String asDetails) DebugOnly
    CheatBunker:Logger:Settings.log(self + " topping off workshop " + targetWorkshop + ", " + asDetails)
EndFunction

Function topOffLogic(WorkshopScript targetWorkshop)
    goToBusy()

    if (!targetWorkshop || !CheatBunkerPackageBaseSettingWorkshopTopOffForms || !CheatBunkerPackageBaseSettingWorkshopTopOffForms.getSize() || TopOffThreshold < 1)
        logTopOff(targetWorkshop, "invalid workshop or forms data")
        return
    endif

    logTopOff(targetWorkshop, "refilling one or more forms")
    Int iSize = CheatBunkerPackageBaseSettingWorkshopTopOffForms.getSize()
    Int iCounter = 0
    Form resource = None
    ObjectReference targetContainer = targetWorkshop.GetContainer()
    while (iCounter < iSize)
        resource = CheatBunkerPackageBaseSettingWorkshopTopOffForms.getAt(iCounter)
        if (targetContainer.GetItemCount(resource) < TopOffThreshold)
            targetContainer.AddItem(resource, TopOffThreshold)
        endif

        iCounter += 1
    endWhile

    goToActivated()
EndFunction

Function topOff(WorkshopScript targetWorkshop)
    topOffLogic(targetWorkshop)
EndFunction

Event ObjectReference.OnWorkshopMode(ObjectReference akSender, Bool abStart)
    if (abStart)
        topOff(akSender as WorkshopScript)
    endif
EndEvent

Event ObjectReference.OnWorkshopObjectPlaced(ObjectReference akSender, ObjectReference akReference)
    topOff(akSender as WorkshopScript)
EndEvent

Event ObjectReference.OnWorkshopObjectRepaired(ObjectReference akSender, ObjectReference akReference)
    topOff(akSender as WorkshopScript)
EndEvent

Function logWatchingWorkshop(WorkshopScript targetWorkshop) DebugOnly
    CheatBunker:Logger:Settings.log(self + " is watching workshop " + targetWorkshop)
EndFunction

Function watchWorkshop(WorkshopScript targetWorkshop)
    ;logWatchingWorkshop(targetWorkshop)
    RegisterForRemoteEvent(targetWorkshop, "OnWorkshopMode")
    RegisterForRemoteEvent(targetWorkshop, "OnWorkshopObjectPlaced")
    RegisterForRemoteEvent(targetWorkshop, "OnWorkshopObjectRepaired")
EndFunction

Function watchAllWorkshops()
    Int iCounter = 0
    while (iCounter < WorkshopParent.Workshops.Length)
        watchWorkshop(WorkshopParent.Workshops[iCounter])
        iCounter += 1
    endWhile

    watchWorkshop(HomePlateWorkshop)
EndFunction

Function startupLogic()
    watchAllWorkshops()
EndFunction

Function loadLogic()
    watchAllWorkshops()
EndFunction

Function stopWatchingWorkshop(WorkshopScript targetWorkshop)
    UnregisterForRemoteEvent(targetWorkshop, "OnWorkshopMode")
    UnregisterForRemoteEvent(targetWorkshop, "OnWorkshopObjectPlaced")
    UnregisterForRemoteEvent(targetWorkshop, "OnWorkshopObjectRepaired")
EndFunction

Function stopWatchingAllWorkshops()
    Int iCounter = 0
    while (iCounter < WorkshopParent.Workshops.Length)
        stopWatchingWorkshop(WorkshopParent.Workshops[iCounter])
        iCounter += 1
    endWhile

    stopWatchingWorkshop(HomePlateWorkshop)
EndFunction

Function shutdownLogic()
    stopWatchingAllWorkshops()
EndFunction

Bool Function isActivated()
    return false ; because the compiler won't allow this method to be overridden even if its already in the parent script's empty state
EndFunction

State Busy
    Event OnQuestShutdown()
        goToDeactivated()
    EndEvent

    Function topOff(WorkshopScript targetWorkshop)

    EndFunction

    Bool Function isActivated()
        return true
    EndFunction
EndState
