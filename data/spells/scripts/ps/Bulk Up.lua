function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "bulk up")

return true
end