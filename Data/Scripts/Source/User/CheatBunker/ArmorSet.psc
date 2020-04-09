Scriptname CheatBunker:ArmorSet extends Quest

FormList Property Sizes = None Auto Const

FormList Property Materials = None Auto Const

FormList Property Helmets = None Auto Const
FormList Property HelmetMods = None Auto Const

FormList Property Torsos = None Auto Const
FormList Property TorsoMods = None Auto Const

FormList Property Arms = None Auto Const
FormList Property ArmMods = None Auto Const

FormList Property Legs = None Auto Const
FormList Property LegMods = None Auto Const

Function clean()
	Jiffy:Utility:FormList.clean(Sizes)
	Jiffy:Utility:FormList.clean(Materials)
	Jiffy:Utility:FormList.clean(Helmets)
	Jiffy:Utility:FormList.clean(HelmetMods)
	Jiffy:Utility:FormList.clean(Torsos)
	Jiffy:Utility:FormList.clean(TorsoMods)
	Jiffy:Utility:FormList.clean(Arms)
	Jiffy:Utility:FormList.clean(ArmMods)
	Jiffy:Utility:FormList.clean(Legs)
	Jiffy:Utility:FormList.clean(LegMods)
EndFunction
