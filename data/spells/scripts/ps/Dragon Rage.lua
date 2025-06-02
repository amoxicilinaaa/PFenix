function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Dragon Rage")

return true
end