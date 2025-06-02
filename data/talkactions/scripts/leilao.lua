function onSay(cid, words, param)
config = {
acess = 4,
time = 5,
storage = {25601,25602,650213}
}
function getWinnerLeilao()
local w = tostring(getGlobalStorageValue(config.storage[1])):gsub(':', ''):explode(',')
if not getPlayerByNameWildcard(w[4]) then
local item = doCreateItemEx(w[1]-1, w[2])
local x = doItemSetAttribute(item, "description", "Item comprado em leilão por "..w[3].." gps.")
doPlayerSendMailByName(w[4], item)
else
local x = doPlayerAddItem(getPlayerByNameWildcard(w[4]), w[1], w[2])
doItemSetAttribute(x, "description", "Item comprado em leilão por "..w[3].." gps.")
end
doBroadcastMessage("O item ["..getItemNameById(w[1]).." : "..w[2].."] Foi vendido para o jogador "..w[4].." por "..w[3].." gps!")
setGlobalStorageValue(config.storage[1],-1)
setGlobalStorageValue(config.storage[2],-1)
for _, pid in pairs(getPlayersOnline()) do
setPlayerStorageValue(pid, config.storage[3], -1)
end
return db.executeQuery("DELETE FROM `player_storage` WHERE `key` = "..config.storage[3])
end
if words == "/leilao" then
if getPlayerAccess(cid) < config.acess then
doPlayerSendTextMessage(cid, 28, "Você não pode executar essa ação.") return true
end
local t = string.explode(param, ",")
if not tonumber(getGlobalStorageValue(config.storage[1])) then
doPlayerSendTextMessage(cid, 27, "Já há um leilão ativo no momento.") return true
elseif not tonumber(t[1]) or not tonumber(t[2]) or not tonumber(t[3]) then
doPlayerSendTextMessage(cid, 28, "Faltou parametro.")return true
elseif not isItemMovable(t[1]) then
doPlayerSendTextMessage(cid, 28, "Você não pode adicionar esse item no leilão.")return true
end
setGlobalStorageValue(config.storage[1], ":"..t[1]..",:"..(isItemStackable(t[1]) and t[2] or 1)..",:"..t[3]..",:"..getCreatureName(cid))
setGlobalStorageValue(config.storage[2], os.time()+ config.time*60)
doBroadcastMessage("[Leilão] O item ["..getItemNameById(t[1]).." : "..(isItemStackable(t[1]) and t[2] or 1).."] Está em leilão até "..os.date("%X ", getGlobalStorageValue(config.storage[2])).."\nLance Minimo: "..t[3].." gps.")
addEvent(getWinnerLeilao, config.time*1000*60)
elseif words == "!lance" then
if tonumber(getGlobalStorageValue(config.storage[1])) then
doPlayerSendTextMessage(cid, 27, "Não tem nenhum leilão ativo no momento.") return true
end
local s = tostring(getGlobalStorageValue(config.storage[1])):gsub(':', ''):explode(',')
if param == "lista" then
doShowTextDialog(cid,s[1], "Item: "..getItemNameById(s[1]).."\n\nQuantidade: "..s[2].."\n\nMaior lance atual: "..s[3].."\n\nJogador: "..s[4].."\n\nPrazo Final: "..os.date("%X ", getGlobalStorageValue(config.storage[2]))) return true
elseif not tonumber(param) or tonumber(param) <= 0 or tonumber(param) > 9999999 then
doPlayerSendTextMessage(cid, 28, "digite um número válido.") return true
end
local li = getPlayerStorageValue(cid, config.storage[3]) < 0 and 0 or getPlayerStorageValue(cid, config.storage[3])
local conta = (li + tonumber(param))
if conta <= tonumber(s[3]) then
doPlayerSendTextMessage(cid, 28, "você tem que dar um lance maior que "..s[3].." gps") return true
elseif not doPlayerRemoveMoney(cid, tonumber(param)) then
doPlayerSendTextMessage(cid, 28, "você não tem gps suficientes para dar um lance") return true
end
setPlayerStorageValue(cid, config.storage[3], conta)
setGlobalStorageValue(config.storage[1], ":"..s[1]..",:"..s[2]..",:"..conta..",:"..getCreatureName(cid))
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parabéns, agora você deu o maior lance de "..conta.." gps no item [Nome: "..getItemNameById(s[1]).."] [Count: "..s[2].."]")
end
return true
end