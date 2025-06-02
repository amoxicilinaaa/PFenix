function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Mist")

return true
end