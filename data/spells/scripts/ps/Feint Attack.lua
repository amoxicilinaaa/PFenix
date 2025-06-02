function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Feint Attack")

return true
end