function onTarget(cid, target)

--checagem
local storagetempo = 101031
local delay = 2
local efeitoplayer = 1
local efeitopokemon = 1
local efeitonosuccess = 2
 
 if isMonster(target) then
 return true
 end
 
 if isPlayer(target) then
 return true
 end
 
if getPlayerStorageValue(cid, storagetempo) > os.time() then
doSendMagicEffect(getPlayerPosition(cid), efeitonosuccess)
doPlayerSendTextMessage(cid, 18, "Clique depois de "..getPlayerStorageValue(cid, storagetempo) - os.time().. " segundos... Vá com calma!")
return false
end
--fim 


--pokemon collector

function doTrade3(cid)
local storage = 43534
local temp = 5
if getPlayerStorageValue(cid, storagetempo) > os.time() then
doSendMagicEffect(getPlayerPosition(cid), efeitonosuccess)
doPlayerSendTextMessage(cid, 18, "Clique depois de "..getPlayerStorageValue(cid, storagetempo) - os.time().. " segundos... Vá com calma!")
return true
end
setPlayerStorageValue(cid, storagetempo, os.time()+delay)
setPlayerStorageValue(cid, storage, os.time() + temp)
doPlayerSay(cid, "hi", TALKTYPE_ORANGE_1)
return true
end



if (getCreatureName(target) == "Pokemon Collector") or (getCreatureName(target) == "Namer") then
if isNpc(target) then
if (getDistanceBetween(getCreaturePosition(target), getCreaturePosition(cid)) >= 4) then
	doPlayerSendCancel(cid,"Seu Personagem está muito longe, vá mais perto!")
	doSendMagicEffect(getPlayerPosition(cid), efeitonosuccess)
    return false
end
addEvent(doTrade3, 300, cid, null)
end
return false
end

--fim





--npc halloween

local destinohalloween = {x = 525, y = 2992, z = 7}
if (getCreatureName(target) == "Evento Halloween") then

if isNpc(target) then
if (getDistanceBetween(getCreaturePosition(target), getCreaturePosition(cid)) >= 4) then
doPlayerSendCancel(cid, "você está muito longe, vá mais perto!")
return false
end

	
if not getTileInfo(getThingPos(cid)).protection then
 setPlayerStorageValue(cid, storagetempo, os.time()+delay)
 doPlayerSendCancel(cid,"!!TELEPORTADO!!")
 doCreatureSay(target,"TELEPORTADO - "..getCreatureName(cid).."!")
 doTeleportThing(cid, destinohalloween)
 doSendMagicEffect(getPlayerPosition(cid), 21)
end
end
return false
end
--fim


--npc de compar e sell
function doTrade1(cid)
   
local storage = 43534
local temp = 5

if getPlayerStorageValue(cid, storagetempo) > os.time() then
doSendMagicEffect(getPlayerPosition(cid), efeitonosuccess)
doPlayerSendTextMessage(cid, 18, "Clique depois de "..getPlayerStorageValue(cid, storagetempo) - os.time().. " segundos... Vá com calma!")
return true
end
setPlayerStorageValue(cid, storagetempo, os.time()+delay)
setPlayerStorageValue(cid, storage, os.time() + temp)
doPlayerSay(cid, "hi", TALKTYPE_ORANGE_1)
doPlayerSay(cid, "trade", TALKTYPE_ORANGE_1)
return true
end

if (getCreatureName(target) == "Mark") or (getCreatureName(target) == "Tomy") or (getCreatureName(target) == "Guru")then
if isNpc(target) then


if (getDistanceBetween(getCreaturePosition(target), getCreaturePosition(cid)) >= 4) then
	doPlayerSendCancel(cid,"Seu Personagem está muito longe, vá mais perto!")
	doSendMagicEffect(getPlayerPosition(cid), efeitonosuccess)
    return false
end
addEvent(doTrade1, 300, cid, null)
end
return false
end


--fim





---ok 100%--
if (getCreatureName(target) == "Yasmin Joy") or (getCreatureName(target) == "Nurse Chansey") then
if isNpc(target) then


if (getDistanceBetween(getCreaturePosition(target), getCreaturePosition(cid)) >= 6) then
	doPlayerSendCancel(cid,"Seu Personagem está muito longe, vá mais perto!")
	doCreatureSay(target,"Vem cá mais perto "..getCreatureName(cid).."!")
	doSendMagicEffect(getPlayerPosition(cid), efeitonosuccess)
    return false
end

--doXpNurse(cid)
	
	if getPlayerStorageValue(cid, 52480) >= 1 then
	   doCreatureSay(target,"Você está em Duelo! "..getCreatureName(cid)..".")   --alterado v1.6.1
    return true 
    end

    setPlayerStorageValue(cid, storagetempo, os.time()+delay)
    doPlayerSendCancel(cid, "!!HEALING SUCCESS!! - ["..getCreatureName(cid).."]")
	doCreatureSay(target,"Seus Pokémon estão prontos para batalhar ["..getCreatureName(cid).."].")
	doCreatureAddHealth(cid, getCreatureMaxHealth(cid)-getCreatureHealth(cid))
	doCureStatus(cid, "all", true)
	doSendMagicEffect(getThingPos(cid), efeitoplayer)

	local mypb = getPlayerSlotItem(cid, 8)
	if #getCreatureSummons(cid) >= 1 then

		local s = getCreatureSummons(cid)[1]
		doCreatureAddHealth(s, getCreatureMaxHealth(s))
		doSendMagicEffect(getThingPos(s), efeitopokemon)
		doCureStatus(s, "all", false)
		if getPlayerStorageValue(s, 1008) < baseNurseryHappiness then
			setPlayerStorageValue(s, 1008, baseNurseryHappiness)
		end
		if getPlayerStorageValue(s, 1009) > baseNurseryHunger then
			setPlayerStorageValue(s, 1009, baseNurseryHunger)
		end
	else
		if mypb.itemid ~= 0 and isPokeball(mypb.itemid) then  --alterado v1.3
		    doItemSetAttribute(mypb.uid, "hp", 1)
			if getItemAttribute(mypb.uid, "hunger") and getItemAttribute(mypb.uid, "hunger") > baseNurseryHunger then
				doItemSetAttribute(mypb.uid, "hunger", baseNurseryHunger)
			end
			for c = 1, 15 do
				local str = "move"..c
				setCD(mypb.uid, str, 0)
			end
			if getItemAttribute(mypb.uid, "happy") and getItemAttribute(mypb.uid, "happy") < baseNurseryHappiness then
				doItemSetAttribute(mypb.uid, "happy", baseNurseryHappiness)
			end
			if getPlayerStorageValue(cid, 17000) <= 0 and getPlayerStorageValue(cid, 17001) <= 0 and getPlayerStorageValue(cid, 63215) <= 0 then
				for a, b in pairs (pokeballs) do
					if isInArray(b.all, mypb.itemid) then
					   doTransformItem(mypb.uid, b.on)
					end
				end
			end
		end

	local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK) or getPlayerSlotItem(cid, CONST_SLOT_AMMO)

    local balls = getPokeballsInContainer(bp.uid)
    if #balls >= 1 then
       for _, uid in ipairs(balls) do
           doItemSetAttribute(uid, "hp", 1)
           for c = 1, 15 do
               local str = "move"..c
               setCD(uid, str, 0)   
           end
           if getItemAttribute(uid, "hunger") and getItemAttribute(uid, "hunger") > baseNurseryHunger then
              doItemSetAttribute(uid, "hunger", baseNurseryHunger)
           end
           if getItemAttribute(uid, "happy") and getItemAttribute(uid, "happy") < baseNurseryHappiness then
              doItemSetAttribute(uid, "happy", baseNurseryHappiness)
           end
           local this = getThing(uid)
           for a, b in pairs (pokeballs) do
		       if isInArray(b.all, this.itemid) then
	              doTransformItem(uid, b.on)
               end
           end
        end
    end
end


local bp = getPlayerSlotItem(cid, CONST_SLOT_AMMO)

    local balls = getPokeballsInContainer(bp.uid)
    if #balls >= 1 then
       for _, uid in ipairs(balls) do
           doItemSetAttribute(uid, "hp", 1)
           for c = 1, 15 do
               local str = "move"..c
               setCD(uid, str, 0)   
           end
           if getItemAttribute(uid, "hunger") and getItemAttribute(uid, "hunger") > baseNurseryHunger then
              doItemSetAttribute(uid, "hunger", baseNurseryHunger)
           end
           if getItemAttribute(uid, "happy") and getItemAttribute(uid, "happy") < baseNurseryHappiness then
              doItemSetAttribute(uid, "happy", baseNurseryHappiness)
           end
           local this = getThing(uid)
           for a, b in pairs (pokeballs) do
		       if isInArray(b.all, this.itemid) then
	              doTransformItem(uid, b.on)
               end
           end
        end
		end

--fim--
--fim de tudo
return false
end
end
end