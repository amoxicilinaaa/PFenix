function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Leaf Tornado")

return true
end