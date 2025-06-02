function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Fling")

return true
end