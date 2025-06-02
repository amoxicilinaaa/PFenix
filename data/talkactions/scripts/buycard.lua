
function onSay(cid, words, param)

local playerlevelcard = getLevelCard(param)

 

if not getExistNameCard(param) then

doShowTextDialgListCards(cid, 1397)

return true

end

if not (doPlayerRemoveMoney(cid, getCardprice(param)) == TRUE) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa de "..getCardprice(param).." de price.")

return true

end

if getPlayerLevel(cid) < playerlevelcard then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa de "..playerlevelcard.." de level.")

return true

end

doPlayerAddNewCards(cid, param)

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sucesso voce comprou a card "..param..".")

return true

end