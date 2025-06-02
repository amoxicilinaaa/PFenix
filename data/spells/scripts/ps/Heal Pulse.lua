function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Heal Pulse")

return true
end