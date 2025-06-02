function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Aromatherapy")

return true
end