Scriptname CheatBunker:Container extends ObjectReference Const

Event OnClose(ObjectReference akActionRef)
	CheatBunker:Logger.containerReset(self)
	Reset()
EndEvent
