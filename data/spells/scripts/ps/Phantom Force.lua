function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Phantom Force")

return true
end