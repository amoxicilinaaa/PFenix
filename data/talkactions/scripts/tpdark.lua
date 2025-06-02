function onSay(cid, words, param)
local onde = {x= 1810, y = 1663, z = 6} --Pra onde o Player vai ao dizer o comando ?.
doTeleportThing(cid,onde)
doSendMagicEffect(getCreaturePosition(cid),19) -- 21 é o efeito você escolhe outro se quiser...
return true
end