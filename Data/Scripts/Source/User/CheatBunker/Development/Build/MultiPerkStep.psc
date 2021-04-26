Scriptname CheatBunker:Development:Build:MultiPerkStep extends Quest

Perk[] property Perks Auto Const
Perk[] property PerksMale Auto Const
Perk[] property PerksFemale Auto Const 

Perk[] function getPerks()
	return Perks
endfunction

Perk[] function getMalePerks()
	return PerksMale
endfunction

Perk[] function getFemalePerks()
	return PerksFemale
endfunction
