function onSay(cid, words, param)
local onde = {x=1060,y=1045,z=6} --Pra onde o Player vai ao dizer o comando ?.
local exausted = getPlayerStorageValue(cid,985432) -- Storange que o player ganha, só mexa se tiver sendo usada por outro .script seu
local agora = os.time()
local tempo = 1 -- Quanta horas ele vai usar o comando novamente ? ali está 2 = 2 horas.
local config = tempo * (1*1)
local somatempo = agora + config

if exausted <= agora then
doPlayerSendTextMessage(cid,25,"Personagem Desbugado!") -- Mensagem que vai aparecer ao player, quando  usar o comando ?.
setPlayerStorageValue(cid, 17000, -1)
doRemoveCondition(cid, CONDITION_OUTFIT)
doRemoveCondition(cid, CONDITION_SPEED)
doTeleportThing(cid,onde)
doSendMagicEffect(getCreaturePosition(cid),19) -- 21 é o efeito você escolhe outro se quiser...
return true
end
end