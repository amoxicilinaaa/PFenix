function onUse(cid, item, fromPosition, itemEx, toPosition)
   if getPlayerLevel(cid) >= 250 and getPlayerStorageValue(cid, 977710) == 1 and getPlayerStorageValue(cid, 977711) == 1 and getPlayerStorageValue(cid, 977712) == 1 then
        doTeleportThing(cid, {x=1564,y=1760,z=11})
      else
         doPlayerSendTextMessage(cid,22,"Você precisa tocar o corpo congelado dos três lendários treinadores anciões localizados nessa ilha subterrania para poder entrar nesse local gélido pois aqui se esconde um misterio perigoso.")
       end
     return true 
end