--- morduk ---
function onUse(cid, item, frompos, item2, topos)

-- if getPlayerStorageValue(cid, 32001) >= 1 then -- verifica a bike
 -- doPlayerSendCancel(cid, "Nao pode usar o robo estando na bike.")
-- return true
-- end

if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 then   -- verifica o fly
 doPlayerSendCancel(cid, "Nao pode usar o robo estando no fly.")
return true
end

local config = {
robo = {lookType = 3943 },
cooldown = 1,  --- tempo entre um uso e outro
speed = 400,
health = 1000,
stor= 32001
}

if os.time() - getPlayerStorageValue(cid, 55695) >= config.cooldown then
      setPlayerStorageValue(cid, 55695, os.time())

  if getPlayerStorageValue(cid, config.stor) == 1 then
     setPlayerStorageValue(cid, config.stor, 0)
     doRemoveCondition(cid, CONDITION_OUTFIT)
     doSendAnimatedText(getCreaturePosition(cid), '[ROBO OFF]', 32)
	      -- setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)-config.health) -- linha adicionada by crypter
		doRegainSpeed(cid)
     -- doPlayerSendTextMessage(cid, MESSSAGE_STATUS_CONSOLE_ORANGE, 'Voce saiu do robo e perdeu a vida extra.')
	 		  	-- doCreatureAddHealth(cid, getCreatureMaxHealth(cid)-getCreatureHealth(cid))
		         -- onPokeHealthChange(cid) --alterei aki
  else
     doChangeSpeed(cid, config.speed)
     doSetCreatureOutfit(cid, config.robo, -1)
     doSendAnimatedText(getCreaturePosition(cid), '[ROBO ON]', 32)
     -- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Voce montou no robo e ganhou vida extra.')
     setPlayerStorageValue(cid, config.stor, 1)
	      -- setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+config.health)-- linha adicionada by crypter
		  	-- doCreatureAddHealth(cid, getCreatureMaxHealth(cid)-getCreatureHealth(cid))
		         -- onPokeHealthChange(cid) --alterei aki
end
else
doPlayerSendCancel(cid, "Aguarde "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55695))).." segundos.")
    end
return true
end

--- crypter ---