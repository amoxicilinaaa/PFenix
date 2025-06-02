function onDeath(cid)
	if getPlayerStorageValue(cid, 63215) >= 1 then
	setPlayerStorageValue(cid, 63215, 0)
	end

	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
	doCreatureSetLookDir(cid, SOUTH)
	doPlayerPopupFYI(cid, msg)
	doSendMagicEffect(getCreaturePosition(cid), 316)
	--doRemoveCreature(cid)

return true
end