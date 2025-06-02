local btype = "normalball"
local pokemon = "Metang"
 
local storage = 747474 -- storage
 
 
function onUse(cid, item, frompos, item2, topos)
if pokemon == "" then return true end
if getPlayerStorageValue(cid, storage) <= 0 then
addPokeToPlayer(cid, pokemon, 0, nil, btype)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce Terminou a Quest e Pegou Seu "..pokemon.."!!")
doSendMagicEffect(getThingPos(cid), 29)
doSendMagicEffect(getThingPos(cid), 27)
doSendMagicEffect(getThingPos(cid), 29)
setPlayerStorageValue(cid, storage, 1)
else
doPlayerSendCancel(cid, "Você já pegou seu Pokémon")
end
return TRUE
end