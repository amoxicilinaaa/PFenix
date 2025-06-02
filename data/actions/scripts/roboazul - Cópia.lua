--- morduk ---
function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 then
 doPlayerSendCancel(cid, "Nao pode usar o robo estando no fly.")
return true
end

function onUse(cid, item, frompos, item2, topos)
local config = {
robo = {lookType = 3810 },
cooldown = 5,  --- tempo entre um uso e outro
speed = 1000,
health = 10000,
stor= 92003
}


if os.time() - getPlayerStorageValue(cid, 55695) >= config.cooldown then
      setPlayerStorageValue(cid, 55695, os.time())

  if getPlayerStorageValue(cid, config.stor) == 1 then
     setPlayerStorageValue(cid, config.stor, 0)
     doRemoveCondition(cid, CONDITION_OUTFIT)
     doSendAnimatedText(getCreaturePosition(cid), '[ROBO OFF]', 32)
     doRegainSpeed(cid)
     setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)-config.health) -- linha adicionada by crypter
	 doItemSetAttribute((cid), "hp", 1)
     doPlayerSendTextMessage(cid, MESSSAGE_STATUS_CONSOLE_ORANGE, 'Voce saiu do robo e perdeu a vida extra.')
  else
     doChangeSpeed(cid, config.speed)
     doSetCreatureOutfit(cid, config.robo, -1)
     doSendAnimatedText(getCreaturePosition(cid), '[ROBO ON]', 32)
     doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Voce montou no robo e ganhou vida extra.')
     setPlayerStorageValue(cid, config.stor, 1)
     setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+config.health)-- linha adicionada by crypter
end
else
doPlayerSendCancel(cid, "Aguarde "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55695))).." segundos.")
    end
return true
end


--- crypter ---