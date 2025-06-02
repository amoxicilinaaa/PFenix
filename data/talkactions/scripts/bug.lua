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



setPlayerStorageValue(cid, 99999998, 0)
if exausted <= agora then

	-- if getPlayerStorageValue(cid, 92001) >= 1 then
	-- doPlayerSendCancel(cid, "Nao pode usar o bug em cima do robo.")
	-- return false
	 -- end
	 
	 	-- if getPlayerStorageValue(cid, 92002) >= 1 then
	-- doPlayerSendCancel(cid, "Nao pode usar o bug em cima do robo.")
		-- return false
	 -- end
	 
	 	-- if getPlayerStorageValue(cid, 92003) >= 1 then
	-- doPlayerSendCancel(cid, "Nao pode usar o bug em cima do robo.")
		-- return false
	 -- end

doPlayerSendTextMessage(cid,25,"Personagem Desbugado!") -- Mensagem que vai aparecer ao player, quando  usar o comando ?.
	doRemoveCondition(cid, CONDITION_OUTFIT)
	setPlayerStorageValue(cid, 17000, 0) --fly
	setPlayerStorageValue(cid, 17001, 0) --ride
	setPlayerStorageValue(cid, 63215, 0) --surf
	setPlayerStorageValue(cid, 92003, 0) --water robotic
	setPlayerStorageValue(cid, 92002, 0) --fire robotic
	setPlayerStorageValue(cid, 92001, 0) --fire robotic
	setPlayerStorageValue(cid, 32001, 0) --bike 
			 	doRegainSpeed(cid)
	

	


	  doCreatureExecuteTalkAction(cid, "/salvar")
doTeleportThing(cid,onde)
doSendMagicEffect(getCreaturePosition(cid),19) -- 21 é o efeito você escolhe outro se quiser...
return true
end
end