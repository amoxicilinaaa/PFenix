function onUse(cid, item, frompos, item2, topos)

local time = 1200 -- Tempo que durar� em segundos
local texto = 'Voc� est� com o triplo da experi�ncia por 20 minutos.' -- Texto que ir� receber ao usar a potion.
textofinal = 'Sua po��o de triplo xp acabou.' -- Texto que ir� receber quando o efeito da potion acabar.
local exp = 3 -- O quanto que voc� quer que dobre sua experiencia, por exemplo 2 � 2x as rates do seu server.
expfinal = 1 --N�o mude, isso � para a experiencia voltar ao normal.
local stor = 12132

if item.itemid == 7443 then
doRemoveItem(item.uid, 1)
doPlayerSetExperienceRate(cid, exp)
doSendMagicEffect(frompos, 13)
doPlayerSendTextMessage(cid, 22, texto)
addEvent(potion, time * 1000, cid)
setPlayerStorageValue(cid, stor, os.time() + time)
end
end



function potion(pos, cid)
doPlayerSetExperienceRate(pos, expfinal)
doPlayerSendTextMessage(pos,22, textofinal)
end