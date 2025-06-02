function onSay(cid, words, param, channel)

if param == "" then
return sendMsgToPlayer(cid, 20, "Estao faltam os parametros! [clan name], [rank]")
end
local t = string.explode(param, ",")
local clans = {'Volcanic', 'Seavell', 'Orebound', 'Wingeon', 'Malefic', 'Gardestrike', 'Psycraft', 'Naturia', 'Raibolt'}
if not isInArray(clans, t[1]) then
   return sendMsgToPlayer(cid, 20, t[1].." nao é um clan valido!")
elseif not tonumber(t[2]) then
   return sendMsgToPlayer(cid, 20, "Parametros errados! [clan name], [rank].")
end

local rank = tonumber(t[2])
local clan = t[1]

    if getPlayerStorageValue(cid, 92823) < 1 then -- 7575 -- 92823
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Voce mudou de clan com sucesso.")
        doPlayerSendTextMessage(cid, 27, "Agora você pertence ao clan "..clan..", rank: "..rank.."")
        setPlayerClan(cid, clan)
        setPlayerClanRank(cid, rank)
    else
        if getPlayerItemCount(cid, 2160) < 10 then
            return doPlayerSendCancel(cid, "Você precisa de 10 THD (100k) para mudar de clan.")
        end
        if(getPlayerLevel(cid) < 120) then
            return doPlayerSendCancel(cid, "Você precisa estar no level 120 para ser de um clan.")
        end
        doPlayerSendTextMessage(cid, 27, "Agora você pertence ao clan "..clan..", rank: "..rank.."")
        doPlayerRemoveItem(cid, 2160, 10)
        setPlayerClan(cid, clan)
        setPlayerClanRank(cid, rank)
    end
    return true

end