function onSay(cid, words, param)
if words == "/eventoon" then
setGlobalStorageValue(8192, 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Evento aberto.")
end
if words == "/eventooff" then
setGlobalStorageValue(8192, -1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Evento fechado.")
end
return true
end