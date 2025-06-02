local tempo = {

exhausted = 1000,

storage = 88448

}

 

 

function onSay(cid, words, param)

if not getExistNameCard(param) then

doShowTextDialgListCards(cid, 1397)

return true

end

if getPlayerPositionPz(cid) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Não e possivel invocar cards em pz")

return true

end

local playerlevelcard = getLevelCard(param)

if(getPlayerStorageValue(cid, tempo.storage) > os.time() and getPlayerStorageValue(cid, tempo.storage) < 100+os.time()) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Espere " .. getPlayerStorageValue(cid, tempo.storage) - os.time() .. ' second' .. ((getPlayerStorageValue(cid, tempo.storage) - os.time()) == 1 and "" or "s") .. " para invocar uma nova card.")

return true

end

if #getCreatureSummons(cid) >= 1 then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Retire o Summon diga /removecard para invocar outro")

return true

end

if getPlayerLevel(cid) < playerlevelcard then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa de "..playerlevelcard.." de level.")

return true

end

if getPlayerCard(cid, param) == 1 then

doPlayerStartCards(cid, param, getThingPos(cid))

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce invoco o "..param..".")

setPlayerStorageValue(cid, tempo.storage, os.time() + tempo.exhausted)

return true

end

return true

end

 

 

