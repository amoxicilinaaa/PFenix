function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Foul Play")

return true
end