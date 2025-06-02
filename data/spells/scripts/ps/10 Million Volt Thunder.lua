function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "10 Million Volt Thunder")

return true
end