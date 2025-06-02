function onUse(cid, item, fromPosition, item2, toPosition)

local teleport = {x=669, y=643, z=8} -- Coordenadas para onde o player irá ser teleportado.
local item_id = 1964 -- ID do item que o player precisa para ser teleportado.
local qtd = 1 -- quantidade

if isPlayer(cid) == true and getPlayerStorageValue(cid, 33423) == 1 then
doTeleportThing(cid, teleport)
 doSendMagicEffect(getPlayerPosition(cid), 44)
 doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,"Voce foi teleportado!")
else



if getPlayerItemCount(cid,item_id) >= qtd then
        doTeleportThing(cid, teleport)
        doSendMagicEffect(getPlayerPosition(cid), 44)
        doPlayerRemoveItem(cid, item_id, qtd)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Voce foi teletransportado para o recinto das aves lendarias "..getItemNameById(item_id).."!")
		setPlayerStorageValue(cid,33423,1)
      else
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,"Voce precisa ter o Book Sagrado "..getItemNameById(item_id).." para saber onde estao as aves lendarias!")
		
		
      end
end

end