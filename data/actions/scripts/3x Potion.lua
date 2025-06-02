function onUse(cid, item, frompos, item2, topos)

local time = 1200 -- Tempo que durará em segundos
local texto = 'Você está com o triplo da experiência por 20 minutos.' -- Texto que irá receber ao usar a potion.
textofinal = 'Sua poção de triplo xp acabou.' -- Texto que irá receber quando o efeito da potion acabar.
local exp = 3 -- O quanto que você quer que dobre sua experiencia, por exemplo 2 é 2x as rates do seu server.
expfinal = 1 --Não mude, isso é para a experiencia voltar ao normal.
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