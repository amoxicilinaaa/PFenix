function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Seismic Toss")

return true
end