Scriptname CheatBunker:Development:Build extends Quest Hidden

Message Property Explanation Auto Const Mandatory
Message Property DisplayLevels Auto Const Mandatory
Message Property Author Auto Const Mandatory

Message Function getExplanation()
	return Explanation
EndFunction

Message Function getAuthor()
	return Author
EndFunction

message function getDisplayLevels()
	return DisplayLevels
endfunction

Function apply(int progressionPercentage = 100)

EndFunction

bool function hasProgressionOptions()
	return false
endfunction

int function getLevelCount()
	return -1
endfunction

int function getTargetLevel(int progressionPercentage = 100)
	int totalLevels = getLevelCount()
	if (-1 == totalLevels)
		return -1
	endif

	if (1 > progressionPercentage || 100 < progressionPercentage)
		progressionPercentage = 100
	endif

	if (100 == progressionPercentage)
		return totalLevels
	endif

	return Math.Ceiling(totalLevels * ((progressionPercentage as float) / 100.0))
endfunction
