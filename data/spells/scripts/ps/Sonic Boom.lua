function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Sonic Boom")

return true
end