local a = {
[15512] = {pokemons = {"Lopunny"}
}
}
  
 
         
function onUse(cid, item, frompos, item2, topos)
         local b = a[item.itemid]                                    
               if not b then return true end
         local pokemon = b.pokemons[math.random(#b.pokemons)]
               if not pokes[pokemon] then return true end  
         setPlayerStorageValue(cid, 99999999, 1)
         doPlayerSendTextMessage(cid, 27, "Voce abriu um Easter Egg e ganhou um Lopunny +50 e a outfit do coelho da pascoa.")
     doPlayerSendTextMessage(cid, 27, "The prize pokemon was a "..pokemon..", congratulations!")
     doSendMagicEffect(getThingPos(cid), 29)

         addPokeToPlayer(cid, pokemon, 50, nil, btype)     --alterado v1.9                                                 
         doRemoveItem(item.uid, 1)
                   if useOTClient then
		        doCreatureExecuteTalkAction(cid, "~Feliz Pascoa~")
    end
    
return true
end