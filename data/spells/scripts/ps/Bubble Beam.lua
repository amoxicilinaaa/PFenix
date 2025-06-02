function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Bubble Beam")

return true
end