Scriptname CheatBunker:Importer:Injector extends injecttec:injector Hidden

FormList flTarget = None

Bool Function canLoadTarget()
	return true
EndFunction

Function clear()
{Doesn't call parent.clear() to avoid warning in debug logs.  Nothing to clear because the target is dynamically loaded.  Do not override this method.}
EndFunction

Bool Function canVerify()
	return true
EndFunction

Function unrunBehavior()
    {Override this to }
EndFunction