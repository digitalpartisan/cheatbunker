Scriptname CheatBunker:Version:Display extends Quest
{In previous iterations of this library, this extended the CheatBunker:Version:Static script, but a composite solution ended up being preferred to prevent bugs from duplicated data disagreeing.}

CheatBunker:Version:Static Property VersionData Auto Const
{The actual version used for comparisons.}
Message Property VersionString Auto Const
{Because this is the closest thing we're going to get to actual text substitution in a terminal token.  Other Form types were tried, but none worked as well, sadly.}
