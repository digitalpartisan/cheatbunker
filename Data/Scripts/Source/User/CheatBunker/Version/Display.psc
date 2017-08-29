Scriptname CheatBunker:Version:Display extends Quest
{This script is a relic from a poitn in time where the static version forms did not have their version numbers as their name.  In order to avoid something horrendously bad in the way of upgrade issues from having upgraded the base package but not DLCor vice versa, this was left around so that the package script could detect what's what.

In previous iterations of this library, this extended the CheatBunker:Version:Static script, but a composite solution ended up being preferred to prevent bugs from duplicated data disagreeing.}

CheatBunker:Version:Static Property VersionData Auto Const
{The actual version used for comparisons.}
Message Property VersionString Auto Const
{Because this is the closest thing we're going to get to actual text substitution in a terminal token.  Other Form types were tried, but none worked as well, sadly.}
