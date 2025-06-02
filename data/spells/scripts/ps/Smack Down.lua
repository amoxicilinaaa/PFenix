function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Smack Down")

return true
end