function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Payback")

return true
end