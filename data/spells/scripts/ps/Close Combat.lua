function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Close Combat")

return true
end