function onSay(cid, words, param)
local onde = {x=1060,y=1045,z=6} --Pra onde o Player vai ao dizer o comando ?.
local exausted = getPlayerStorageValue(cid,985432) -- Storange que o player ganha, só mexa se tiver sendo usada por outro .script seu
local agora = os.time()
local tempo = 1 -- Quanta horas ele vai usar o comando novamente ? ali está 2 = 2 horas.
local config = tempo * (1*1)
local somatempo = agora + config
local configaa = {
robo = {lookType = 3811 },
}
local configb = {
robo1 = {lookType = 3950 },
}
local configc = {
robo2 = {lookType = 3810},
}




if exausted <= agora then
doPlayerSendTextMessage(cid,25,"Personagem Desbugado!") -- Mensagem que vai aparecer ao player, quando  usar o comando ?.
	doRemoveCondition(cid, CONDITION_OUTFIT)
	setPlayerStorageValue(cid, 17000, 0) --fly
	setPlayerStorageValue(cid, 17001, 0) --ride
	setPlayerStorageValue(cid, 63215, 0) --surf
	setPlayerStorageValue(cid, 32001, 0) --bike 
	setPlayerStorageValue(cid, 35454, -1) --pokerope
			 	doRegainSpeed(cid)
	
	if getPlayerStorageValue(cid, 92001) >= 1 then
	     doChangeSpeed(cid, 300)
		      doSetCreatureOutfit(cid, configaa.robo, -1)
	 end
	 
	 	if getPlayerStorageValue(cid, 92002) >= 1 then
	     doChangeSpeed(cid, 300)
		      doSetCreatureOutfit(cid, configb.robo1, -1)
	 end
	 
	 	if getPlayerStorageValue(cid, 92003) >= 1 then
	     doChangeSpeed(cid, 300)
		      doSetCreatureOutfit(cid, configc.robo2, -1)
	 end
	


	  doCreatureExecuteTalkAction(cid, "/salvar")
doTeleportThing(cid,onde)
doSendMagicEffect(getCreaturePosition(cid),19) -- 21 é o efeito você escolhe outro se quiser...
return true
end
end