function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Belch")

return true
end