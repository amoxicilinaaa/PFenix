function onUse(cid, item, fromPosition, item2, toPosition)

	local teleport = {x=1873, y=1032, z=8}-- Coordenadas para onde o player irá ser teleportado.
	local item1 = 2090 -- ID do item1 que o player precisa para ser teleportado.
	
	if getPlayerItemCount(cid,item1) >= 1 then
				doPlayerRemoveItem(cid, item1, 1)
				doTeleportThing(cid, teleport)
			else
				doPlayerSendTextMessage(cid, 23, "Sorry, you need a "..getItemNameById(item1).." to enter.")
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
				return true
			end
end
