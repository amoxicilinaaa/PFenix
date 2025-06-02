function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Stomping Tantrum")

return true
end