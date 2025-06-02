function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Refresh")

return true
end