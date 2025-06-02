function onSay(cid, words, param)
if exhaustion.get(cid, 501) then
doPlayerSendCancel(cid, 'Você precisa espera 10 segundos para usar novamente.')
return true
end 

if getPlayerStorageValue(cid, 32001) == 1 then
        doPlayerSendCancel(cid, "Você não pode usar bike e correr ao mesmo tempo")
		return false
		end
		
		if getPlayerStorageValue(cid, 17000) == 1 then
        doPlayerSendCancel(cid, "Você não pode usar bike e correr ao mesmo tempo")
		return false
		end
		
		if getPlayerStorageValue(cid, 17001) == 1 then
        doPlayerSendCancel(cid, "Você não pode usar bike e correr ao mesmo tempo")
		return false
		end


if isCreature(cid) then
doCreatureSay(cid, "correr", TALKTYPE_ORANGE_1)
setPlayerStorageValue(cid, 19000, 1)
doChangeSpeed(cid, 1 * 200)
doSendMagicEffect(getPlayerPosition(cid), 1)
exhaustion.set(cid, 501, 10)
addEvent(function()
setPlayerStorageValue(cid, 19000, 0)
doRegainSpeed(cid)
end, 15000) -- Tempo que vai durar a talkaction
return true
end
end