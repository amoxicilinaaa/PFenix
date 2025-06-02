function onSay(cid, words, param)

local config = {

bankSystemEnabled = getBooleanFromString(getConfigInfo('bankSystem')),

playerIsFighting = hasCondition(cid, CONDITION_INFIGHT)

}

if config.bankSystemEnabled == TRUE then

if config.playerIsFighting == FALSE then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Here you are, " .. getPlayerBalance(cid) .. " gold.")

--if getPlayerBalance (cid) >= 20000000001 then
--doPlayerSendTextMessage(cid, 27, "Voce nao pode retirar mais que 20kk de uma unica vez, tente com um valor menor")
--return false
--end

if m >= 2000000001 then
doPlayerSendTextMessage(cid, 27, "Voce nao pode retirar 2000000001 ou mais de uma unica vez, tente valores menores.")
return false
end

doPlayerWithdrawAllMoney(cid)

return TRUE

else

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Bank can not be used in fight.")

return TRUE

end

else

return FALSE

end

end