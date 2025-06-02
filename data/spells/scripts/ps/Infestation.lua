function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Infestation")

return true
end