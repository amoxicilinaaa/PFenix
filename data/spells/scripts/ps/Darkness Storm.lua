function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Darkness Storm")

return true
end