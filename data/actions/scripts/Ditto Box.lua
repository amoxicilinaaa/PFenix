local a = {
[16407] = {pokemons = {"Ditto"}}}
     
local happy = 1000 
         
function onUse(cid, item, frompos, item2, topos)
         local b = a[item.itemid]                                    
               if not b then return true end
         local pokemon = b.pokemons[math.random(#b.pokemons)]
               if not pokes[pokemon] then return true end  
         
         doPlayerSendTextMessage(cid, 27, "You opened a pokemon prize box +"..item.itemid - (11637).."!")
     doPlayerSendTextMessage(cid, 27, "The prize pokemon was a "..pokemon..", congratulations!")
     doSendMagicEffect(getThingPos(cid), 29)
               
         addPokeToPlayer(cid, pokemon, 0, nil, btype)     --alterado v1.9                                                 
         doRemoveItem(item.uid, 1)
                   if useOTClient then
		        doCreatureExecuteTalkAction(cid, "/salvar")
    end
    
return true
end