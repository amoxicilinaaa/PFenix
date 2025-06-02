function onUse(cid, item, fromPosition, item2, toPosition)

	local teleport = {x=1839, y=1789, z=11}-- Coordenadas para onde o player irá ser teleportado.
	local item1 = 22050 -- ID do item1 que o player precisa para ser teleportado.
	local item2 = 22051 -- ID do item2 que o player precisa para ser teleportado.
	local item3 = 2151 -- ID do item3 que o player precisa para ser teleportado.
	
	if getPlayerItemCount(cid,item1) >= 100 then
		if getPlayerItemCount(cid,item2) >= 100 then
			if getPlayerItemCount(cid,item3) >= 100 then
				doPlayerRemoveItem(cid, item1, 100)
				doPlayerRemoveItem(cid, item2, 100)
				doPlayerRemoveItem(cid, item3, 100)
				doTeleportThing(cid, teleport)
			else
				doPlayerSendTextMessage(cid, 23, "Sorry, you need a "..getItemNameById(item3).." to enter.")
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
				return true
			end
		else
			doPlayerSendTextMessage(cid, 23, "Sorry, you need a "..getItemNameById(item2).." to enter.")
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
			return true
		end
	else
		doPlayerSendTextMessage(cid, 23, "Sorry, you need a "..getItemNameById(item3).." to enter.")
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
		return true
	end	
end
