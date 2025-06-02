function onSay(cid, words, param)

local config = {

bankSystemEnabled = getBooleanFromString(getConfigInfo('bankSystem')),

playerIsFighting = hasCondition(cid, CONDITION_INFIGHT)

}

if config.bankSystemEnabled == TRUE then

if config.playerIsFighting == FALSE then

if getPlayerItemCount(cid, 2160) >= 2000000001 then
doPlayerSendTextMessage(cid, 27, "Voce nao pode depositar 2000000001 ou mais de uma unica vez, tente valores menores")
return false
end

if getPlayerItemCount(cid, 15128) >= 21 then
doPlayerSendTextMessage(cid, 27, "Voce nao pode depositar 2000000001 ou mais de uma unica vez, tente valores menores")
return false
end

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Alright, you have added the amount of " .. getPlayerMoney(cid) .. " gold to your balance. You can withdraw your money anytime you want to.")

doPlayerDepositAllMoney(cid)

return TRUE

else

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Bank can not be used in fight.")

return TRUE

end

else

return FALSE

end

end