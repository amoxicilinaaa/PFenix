local TP = {x=694, y=579, z=8}

function onUse(cid, item, frompos, topos)
if (item.uid == 15004) and getPlayerItemCount(cid, 10313) == 1 and getPlayerItemCount(cid, 10316) ==1 and getPlayerItemCount(cid,10364) ==1 then
--doPlayerRemoveItem(cid, 10313, 1)
--doPlayerRemoveItem(cid, 10316, 1)
--doPlayerRemoveItem(cid, 10364, 1)
doTeleportThing(cid,TP)
return doPlayerSendTextMessage(cid, 23, "Voce conseguiu encontrar os itens supremos, continue por esse caminho. Poucos sairao vivos")
else
       doPlayerSendTextMessage(cid, 23, "Voce nao possui todos os itens necessarios para passar.")
return true
end
end
