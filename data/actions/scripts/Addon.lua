function onUse(cid, item, fromPosition, itemEx, toPosition)
                local addons = {
                [21078] = {pokemon= "Togekiss" , looktype = 2909}
                [20559] = {pokemon= "Tangela" , looktype = 3157},
               }
 
                if #getCreatureSummons(cid) > 0 then
                                doPlayerSendCancel(cid, "Por favor, volte o seu pokémon para a pokebola.")
                                return false
                end     
                local numero = addons[item.itemid].looktype
 
                local pb = getPlayerSlotItem(cid, 8).uid
                local pk = addons[item.itemid].pokemon
 
                if getItemAttribute(pb,"poke") ~= pk then
                                doPlayerSendCancel(cid, "Desculpe, você não pode usar este addon neste poke.")
                return false
                end
 
                if getItemAttribute(pb,"addon") < 1 then
                                doRemoveItem(item.uid, 1)
                                doPlayerSendTextMessage(cid, 27, "Parabéns! Agora seu pokemon usará o addon.")
                                doSetItemAttribute(pb,"addon",numero)
                                return true
                end     
 
return true
end