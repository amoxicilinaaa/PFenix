function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Squisky Licking")

return true
end