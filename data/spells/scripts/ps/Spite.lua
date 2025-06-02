function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Spite")

return true
end