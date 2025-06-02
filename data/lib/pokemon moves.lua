const_distance_delay = 56

RollOuts = {
["Voltorb"] = {lookType = 638},
["Electrode"] = {lookType = 637},
["Sandshrew"] = {lookType = 635},
["Sandslash"] = {lookType = 636},
["Phanpy"] = {lookType = 1005},
["Donphan"] = {lookType = 1007},
["Miltank"] = {lookType = 1006},        
["Shiny Miltank"] = {lookType = 1903},        
["Golem"] = {lookType = 639},
["Omastar"] = {lookType = 1579},
["Shiny Electrode"] = {lookType = 1387},
["Shiny Golem"] = {lookType = 1403},
["Shiny Voltorb"] = {lookType = 1388},
["Shiny Sandslash"] = {lookType = 1506}
}

--//////////////////////////////////////////////////////////////////////////////////////////////////////////--
local function getSubName(cid, target)
if not isCreature(cid) then return "" end
if getCreatureName(cid) == "Ditto" and pokes[getPlayerStorageValue(cid, 1010)] and getPlayerStorageValue(cid, 1010) ~= "Ditto" then
   return getPlayerStorageValue(cid, 1010)
elseif pokeHaveReflect(cid) and isCreature(target) then
   return getCreatureName(target)
else                                                                --alterado v1.6.1
   return getCreatureName(cid)
end
end

local function getThingName(cid)
if not isCreature(cid) then return "" end   --alterado v1.6
return getCreatureName(cid)
end

function getTableMove(cid, move)               --alterado v1.6
local backup = {f = 0, t = ""}
if getThingName(cid) == "Ditto" and pokes[getPlayerStorageValue(cid, 1010)] and getPlayerStorageValue(cid, 1010) ~= "Ditto" then
   name = getPlayerStorageValue(cid, 1010)
else
   name = getThingName(cid)
end
if not isCreature(cid) or name == "" or not move then return backup end
local x = movestable[name]
if not x then return "" end   
local z = {x.move1, x.move2, x.move3, x.move4, x.move5, x.move6, x.move7, x.move8, x.move9, x.move10, x.move11, x.move12, x.passive1, x.passive2, x.passive3}
if getPlayerStorageValue(cid, 21103) ~= -1 then
   local sto = getPlayerStorageValue(cid, 21103) 
   setPlayerStorageValue(cid, 21103, -1) 
   return {f = sto, t = ""} 
end
for j = 1, 15 do
  if z[j] and z[j].name == move then
     return z[j]
  end
end
return movesinfo[move]
end

function getMasterTarget(cid)
if isCreature(cid) and getPlayerStorageValue(cid, 21101) ~= -1 then
   return getPlayerStorageValue(cid, 21101)     --alterado v1.6
end
    if isSummon(cid) then
	    return getCreatureTarget(getCreatureMaster(cid))
	else
	    return getCreatureTarget(cid)
    end
end
--////////////////////////////////////////////////////////////////////////////////////////////////////////--

function docastspell(cid, spell, mina, maxa)

local target = 0
local getDistDelay = 0
if not isCreature(cid) or getCreatureHealth(cid) <= 0 then return false end  --alterado v1.6
if isSleeping(cid) and getPlayerStorageValue(cid, 21100) <= -1 then return true end  --alterado v1.6

if isCreature(getMasterTarget(cid)) then
	target = getMasterTarget(cid)
	getDistDelay = getDistanceBetween(getThingPosWithDebug(cid), getThingPosWithDebug(target)) * const_distance_delay
end

local mydir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local table = getTableMove(cid, spell) --alterado v1.6

local min = 0
local max = 0                          
                                                                                                                                                                                                                                          

if ehMonstro(cid) and isCreature(getMasterTarget(cid)) and isInArray(specialabilities["evasion"], getCreatureName(getMasterTarget(cid))) then 
   local target = getMasterTarget(cid)
   if math.random(1, 100) <= passivesChances["Evasion"][getCreatureName(target)] then                                                                                      
      if isCreature(getMasterTarget(target)) then  --alterado v1.6 
         doSendMagicEffect(getThingPosWithDebug(target), 211)
         doSendAnimatedText(getThingPosWithDebug(target), "TOO BAD", 215)                                 
         doTeleportThing(target, getClosestFreeTile(target, getThingPosWithDebug(cid)), false)
         doSendMagicEffect(getThingPosWithDebug(target), 211)
         doFaceCreature(target, getThingPosWithDebug(cid)) 
         return false    --alterado v1.8
      end
    end   		 
end

--- SPITE / ROAR / SILENCE ---
if (isWithFear(cid) or isSilence(cid)) and getPlayerStorageValue(cid, 21100) <= -1 then
return true                                      --alterado v1.6!!
end
----------------------------
	
if mina and maxa then
min = math.abs(mina)
max = math.abs(maxa)
elseif not isPlayer(cid) then
	if table ~= "" then   --alterado v1.6
	
	    min = getSpecialAttack(cid) * table.f * 0.1   --alterado v1.6
	    max = min + (isSummon(cid) and getMasterLevel(cid) or getPokemonLevel(cid))
	
	    if spell == "Self-Destruct" then
	       min = getCreatureHealth(cid)  --alterado v1.6
	       max = getCreatureHealth(cid)
        end

		if not isSummon(cid) and not isInArray({"Demon Puncher", "Demon Kicker"}, spell) then --alterado v1.7
			doCreatureSay(cid, string.upper(spell).."!", TALKTYPE_MONSTER)
		end
		if isNpcSummon(cid) then
			local mnn = {" use ", " "}
			local use = mnn[math.random(#mnn)]
			doCreatureSay(getCreatureMaster(cid), getPlayerStorageValue(cid, 1007)..","..use..""..doCorrectString(spell).."!", 1)
		end
	else
	print("Error trying to use move "..spell..", move not specified in the pokemon table.")
	end
	
end
--- Meditate ----------------------------------           
if getPlayerStorageValue(cid, 253) >= 0 and table ~= "" and table.f ~= 0 then   --alterado v1.6
	min = min * 2
	max = max * 2
	setPlayerStorageValue(cid, 253, -1)
end
------------------Miss System--------------------------
local cd = getPlayerStorageValue(cid, conds["Miss"])
local cd2 = getPlayerStorageValue(cid, conds["Confusion"])      --alterado v1.5
local cd3 = getPlayerStorageValue(cid, conds["Stun"]) 
if cd >= 0 or cd2 >= 0 or cd3 >= 0 then                                                         --alterado v1.7
   if not isInArray({"Shock-Counter", "Lava-Counter", "Counter Helix", "Demon Puncher", "Demon Kicker", "Stunning Confusion", "Electric Charge", "Melody", "Mirror Coat", "Mega Drain", 
"Aromatherapy", "Emergency Call", "Magical Leaf", "Sunny Day", "Taunt", "Skull Bash", "Safeguard", "Rain Dance", "Spores Reaction", "Giroball", "Counter Claw", "Counter Spin", "Dragon Fury", 
"Amnesia", "Zen Mind", "Bone Spin"}, spell) and getPlayerStorageValue(cid, 21100) <= -1 then
      if math.random(1, 100) > 30 then                                                                               --alterado v1.6
         doSendAnimatedText(getThingPosWithDebug(cid), "MISS", 215)
         return false
      end
   end
end
---------------GHOST DAMAGE-----------------------
ghostDmg = GHOSTDAMAGE
psyDmg = PSYCHICDAMAGE

if getPlayerStorageValue(cid, 999457) >= 1 and table ~= "" and table.f ~= 0 then    --alterado v1.6
   psyDmg = MIRACLEDAMAGE                                                              
   ghostDmg = DARK_EYEDAMAGE
   addEvent(setPlayerStorageValue, 50, cid, 999457, -1)
end
--------------------REFLECT----------------------
setPlayerStorageValue(cid, 21100, -1)                --alterado v1.6
if not isInArray({"Psybeam", "Sand Attack", "Flamethrower"}, spell) then  --alterado v1.8
   setPlayerStorageValue(cid, 21101, -1)
end
setPlayerStorageValue(cid, 21102, spell)
---------------------------------------------------



if spell == "Reflect" or spell == "Mimic"  or spell == "Magic Coat" then

    if spell == "Magic Coat" then
      eff = 11
    else
      eff = 135
    end

	doSendMagicEffect(getThingPosWithDebug(cid), eff)
	setPlayerStorageValue(cid, 21099, 1)         
	
elseif spell == "Quick Attack" then

   doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 111)

      elseif spell == "Revenge" then

   doDanoWithProtect(cid, FIGHTINGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 99)
   
elseif spell == "Focus Blast" then

local ret = {}                 
ret.id = 0
ret.cd = 9
ret.eff = 136
ret.check = 0
ret.spell = spell
ret.cond = "Confusion"

local pos = getThingPosWithDebug(cid)
local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}

for i = 0, 14 do
    addEvent(doMoveInArea2, i*320, cid, 112, areas[i+1], FIGHTINGDAMAGE, min, max, spell, ret)
    addEvent(doMoveInArea2, i*330, cid, 112, areas[i+1], FIGHTINGDAMAGE, 0, 0, spell)
end

elseif spell == "Zen Headbutt" then

   doDanoWithProtect(cid, PSYCHICDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 233)

elseif spell == "Razor Leaf" or spell == "Magical Leaf" then                      

local eff = spell == "Razor Leaf" and 8 or 21

local function throw(cid, target)
if not isCreature(cid) or not isCreature(target) then return false end
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), eff)
	doDanoInTargetWithDelay(cid, target, GRASSDAMAGE, min, max, 245)  --alterado v1.7
end

addEvent(throw, 0, cid, target)
addEvent(throw, 100, cid, target) --alterado v1.7
		
elseif spell == "Vine Whip" then

local area = getThingPosWithDebug(cid)
local dano = {}
local effect = 255

	if mydir == 0 then
		area.x = area.x + 1
		area.y = area.y - 1
		dano = whipn
		effect = 80
	elseif mydir == 1 then
		area.x = area.x + 2
		area.y = area.y + 1
		dano = whipe
		effect = 83
	elseif mydir == 2 then
		area.x = area.x + 1
		area.y = area.y + 2		
		dano = whips
		effect = 81
	elseif mydir == 3 then
		area.x = area.x - 1
		area.y = area.y + 1
		dano = whipw
		effect = 82
	end

		doSendMagicEffect(area, effect)
		doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(cid), dano, -min, -max, 255)
		
elseif spell == "Headbutt" then
       
       doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 118)
       
elseif spell == "Leech Seed" then

    local ret = {}
    ret.id = target
    ret.attacker = cid
    ret.cd = 5
    ret.check = getPlayerStorageValue(target, conds["Leech"])
    ret.damage = isSummon(cid) and getMasterLevel(cid)+getPokemonBoost(cid) or getPokemonLevel(cid)
    ret.cond = "Leech"
    
	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 1)
	addEvent(doMoveDano2, 1000, cid, target, GRASSDAMAGE, 0, 0, ret, spell)

elseif spell == "Solar Beam" then
	
local function useSolarBeam(cid)
		if not isCreature(cid) then
		return true
		end
		if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then
		return true
		end
		if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then
		return true
		end
			local effect1 = 255
			local effect2 = 255
			local effect3 = 255
			local effect4 = 255
			local effect5 = 255
			local area = {}
			local pos1 = getThingPosWithDebug(cid)
			local pos2 = getThingPosWithDebug(cid)
			local pos3 = getThingPosWithDebug(cid)
			local pos4 = getThingPosWithDebug(cid)
			local pos5 = getThingPosWithDebug(cid)
		if getCreatureLookDir(cid) == 1 then
			effect1 = 4
			effect2 = 10
			effect3 = 10
			effect4 = 10
			effect5 = 0
			pos1.x = pos1.x + 2
			pos1.y = pos1.y + 1
			pos2.x = pos2.x + 3
			pos2.y = pos2.y + 1
			pos3.x = pos3.x + 4
			pos3.y = pos3.y + 1
			pos4.x = pos4.x + 5
			pos4.y = pos4.y + 1
			pos5.x = pos5.x + 6
			pos5.y = pos5.y + 1
			area = solare
		elseif getCreatureLookDir(cid) == 0 then
			effect1 = 36
			effect2 = 37
			effect3 = 37
			effect4 = 38
			pos1.x = pos1.x + 1
			pos1.y = pos1.y - 1
			pos2.x = pos2.x + 1
			pos2.y = pos2.y - 3
			pos3.x = pos3.x + 1
			pos3.y = pos3.y - 4
			pos4.x = pos4.x + 1
			pos4.y = pos4.y - 5
			area = solarn
		elseif getCreatureLookDir(cid) == 2 then
			effect1 = 46
			effect2 = 50
			effect3 = 50
			effect4 = 59
			pos1.x = pos1.x + 1
			pos1.y = pos1.y + 2
			pos2.x = pos2.x + 1
			pos2.y = pos2.y + 3
			pos3.x = pos3.x + 1
			pos3.y = pos3.y + 4
			pos4.x = pos4.x + 1
			pos4.y = pos4.y + 5
			area = solars
		elseif getCreatureLookDir(cid) == 3 then
			effect1 = 115
			effect2 = 162
			effect3 = 162
			effect4 = 162
			effect5 = 163
			pos1.x = pos1.x - 1
			pos1.y = pos1.y + 1
			pos2.x = pos2.x - 3
			pos2.y = pos2.y + 1
			pos3.x = pos3.x - 4
			pos3.y = pos3.y + 1
			pos4.x = pos4.x - 5
			pos4.y = pos4.y + 1
			pos5.x = pos5.x - 6
			pos5.y = pos5.y + 1
			area = solarw
		end

		if effect1 ~= 255 then
			doSendMagicEffect(pos1, effect1)
		end
		if effect2 ~= 255 then
			doSendMagicEffect(pos2, effect2)
		end
		if effect3 ~= 255 then
			doSendMagicEffect(pos3, effect3)
		end
		if effect4 ~= 255 then
			doSendMagicEffect(pos4, effect4)
		end
		if effect5 ~= 255 then
			doSendMagicEffect(pos5, effect5)
		end
	
		doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(cid), area, -min, -max, 255)	
		doRegainSpeed(cid)
		setPlayerStorageValue(cid, 3644587, -1)
	end

	local function ChargingBeam(cid)
		if not isCreature(cid) then
		return true
		end
		if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then
		return true
		end
		if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then
		return true
		end
		local tab = {}

		for x = -2, 2 do
			for y = -2, 2 do
				local pos = getThingPosWithDebug(cid)
				pos.x = pos.x + x
				pos.y = pos.y + y
					if pos.x ~= getThingPosWithDebug(cid).x and pos.y ~= getThingPosWithDebug(cid).y then
					table.insert(tab, pos)
					end
			end
		end
	doSendDistanceShoot(tab[math.random(#tab)], getThingPosWithDebug(cid), 37)
	end

doChangeSpeed(cid, -getCreatureSpeed(cid))
setPlayerStorageValue(cid, 3644587, 1)          --alterado v1.6  n sei pq mas tava dando debug o.O

doSendMagicEffect(getThingPosWithDebug(cid), 132) 
addEvent(useSolarBeam, 650, cid)

elseif spell == "Sleep Powder" then

local ret = {}
ret.id = 0
ret.cd = math.random(6, 9)
ret.check = 0
ret.first = true                        --alterado v1.6
ret.cond = "Sleep"
	
doMoveInArea2(cid, 60, confusion, NORMALDAMAGE, 0, 0, spell, ret)

elseif spell == "Stun Spore" then
        
    local ret = {}
    ret.id = 0
    ret.cd = 9
    ret.eff = 0
    ret.check = 0
    ret.spell = spell
    ret.cond = "Stun"
    
    doMoveInArea2(cid, 85, confusion, GRASSDAMAGE, 0, 0, spell, ret)

elseif spell == "Poison Powder" then                              

local ret = {}
ret.id = 0
ret.cd = math.random(6, 15)              --alterado v1.6
ret.check = 0
local lvl = isSummon(cid) and getMasterLevel(cid) or getPokemonLevel(cid)
ret.damage = math.floor((getPokemonLevel(cid)+lvl * 3)/2)
ret.cond = "Poison"                              

doMoveInArea2(cid, 84, confusion, NORMALDAMAGE, 0, 0, spell, ret)
	
elseif spell == "Bullet Seed" then
               --cid, effDist, effDano, areaEff, areaDano, element, min, max
doMoveInAreaMulti(cid, 1, 45, bullet, bulletDano, GRASSDAMAGE, min, max)

elseif spell == "Leaf Blade" then

doMoveInAreaMulti(cid, 4, 240, multi, multiDano, GRASSDAMAGE, min, max)

elseif spell == "Grass Knot" then

doMoveInAreaMulti(cid, 4, 104, multi, multiDano, GRASSDAMAGE, min, max)

elseif spell == "Body Slam" then
	
       doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 118)
    
elseif spell == "Leaf Storm" or tonumber(spell) == 73 then

	addEvent(doDanoWithProtect, 150, cid, GRASSDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)

	local pos = getThingPosWithDebug(cid)

	local function doSendLeafStorm(cid, pos)              --alterado!!
		if not isCreature(cid) then return true end
	    doSendDistanceShoot(getThingPosWithDebug(cid), pos, 8)
	end

	for a = 1, 100 do
		local lugar = {x = pos.x + math.random(-6, 6), y = pos.y + math.random(-5, 5), z = pos.z}
		addEvent(doSendLeafStorm, a * 2, cid, lugar)
	end
    
elseif spell == "Scratch" then

	doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 142)
    
elseif spell == "Iron Head" then

	doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 77)
    
elseif spell == "Ember" then

		doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 3)
		doDanoInTargetWithDelay(cid, target, FIREDAMAGE, min, max, 15)  --alterado v1.7

elseif spell == "Flamethrower" then

	local flamepos = getThingPosWithDebug(cid)
    local effect = 255
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

	if a == 0 then
		flamepos.x = flamepos.x+1
		flamepos.y = flamepos.y-1
		effect = 106
	elseif a == 1 then
		flamepos.x = flamepos.x+3
		flamepos.y = flamepos.y+1
		effect = 109
	elseif a == 2 then
		flamepos.x = flamepos.x+1
		flamepos.y = flamepos.y+3
		effect = 107
	elseif a == 3 then
		flamepos.x = flamepos.x-1
		flamepos.y = flamepos.y+1
		effect = 108
	end

        doMoveInArea2(cid, 0, flamek, FIREDAMAGE, min, max, spell)
		doSendMagicEffect(flamepos, effect)  
     

elseif spell == "Fire Spin" then

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 3)
	addEvent(doDanoWithProtect, 200, cid, FIREDAMAGE, getThingPosWithDebug(target), waba, min, max, 5)
	
elseif spell == "Fire Fang" then

	doSendMagicEffect(getThingPosWithDebug(target), 138) 
    doDanoInTargetWithDelay(cid, target, FIREDAMAGE, min, max, 15) --alterado v1.7
	
elseif spell == "Fire Blast" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area, eff)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end 
   doAreaCombatHealth(cid, FIREDAMAGE, area, 0, 0, 0, eff)
   doAreaCombatHealth(cid, FIREDAMAGE, area, whirl3, -min, -max, 35)
end
end

for a = 0, 4 do

local t = {
[0] = {27, {x=p.x, y=p.y-(a+1), z=p.z}},           --alterado v1.4
[1] = {61, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {62, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {63, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 300*a, cid, t[d][2], t[d][1])
end
	
elseif spell == "Rage" then

   local ret = {}
   ret.id = cid
   ret.cd = 15
   ret.eff = 13
   ret.check = 0
   ret.buff = spell
   ret.first = true
   
   doCondition2(ret)
     
elseif spell == "Dragon Claw" then

       doDanoWithProtect(cid, DRAGONDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 141)
       
elseif spell == "Wing Attack" or spell == "Steel Wing" then

local effectpos = getThingPosWithDebug(cid)
local effect = 255
local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

	if a == 0 then
		effect = spell == "Steel Wing" and 251 or 128
		effectpos.x = effectpos.x + 1
		effectpos.y = effectpos.y - 1                   --alterado v1.4
	elseif a == 1 then
		effectpos.x = effectpos.x + 2
		effectpos.y = effectpos.y + 1
		effect = spell == "Steel Wing" and 253 or 129
	elseif a == 2 then
		effectpos.x = effectpos.x + 1
		effectpos.y = effectpos.y + 2
		effect = spell == "Steel Wing" and 252 or 131
	elseif a == 3 then
		effectpos.x = effectpos.x - 1
		effectpos.y = effectpos.y + 1
		effect = spell == "Steel Wing" and 254 or 130
	end

		doSendMagicEffect(effectpos, effect)
		doMoveInArea2(cid, 0, wingatk, FLYINGDAMAGE, min, max, spell)
		
elseif spell == "Flare Blitz" then

                 --cid, effDist, effDano, areaEff, areaDano, element, min, max
       doMoveInAreaMulti(cid, 3, 6, bullet, bulletDano, FIREDAMAGE, min, max) 
       
elseif spell == "Frost Breath" then

local eff = {41, 273, 273, 41}
local area = {flames1, flames2, flames3, flames4}

addEvent(doMoveInArea2, 2*450, cid, 2, flames0, ICEDAMAGE, min, max, spell)
for i = 0, 3 do
    addEvent(doMoveInArea2, i*450, cid, eff[i+1], area[i+1], ICEDAMAGE, min, max, spell)
end


elseif spell == "Bubble" then

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 2)
	doDanoInTargetWithDelay(cid, target, WATERDAMAGE, min, max, 68) --alterado v1.7
	
elseif spell == "Clamp" then

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 2)
	doDanoInTargetWithDelay(cid, target, WATERDAMAGE, min, max, 53)  --alterado v1.7

elseif spell == "Water Gun" then

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)
local t = {
[0] = {69, {x=p.x, y=p.y-1, z=p.z}},
[1] = {70, {x=p.x+6, y=p.y, z=p.z}},      --alterado v1.8
[2] = {71, {x=p.x, y=p.y+6, z=p.z}},
[3] = {72, {x=p.x-1, y=p.y, z=p.z}},
}

doMoveInArea2(cid, 0, triplo6, WATERDAMAGE, min, max, spell)
doSendMagicEffect(t[a][2], t[a][1])
	
elseif spell == "Brine" then
		             
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 2)
    doDanoWithProtectWithDelay(cid, target, WATERDAMAGE, min, max, 68, waba)
	
elseif spell == "Aqua Tail" then

	local function rebackSpd(cid, sss)
		if not isCreature(cid) then return true end
		doChangeSpeed(cid, sss)
		setPlayerStorageValue(cid, 446, -1)
	end

	local x = getCreatureSpeed(cid)
	doFaceOpposite(cid)
	doChangeSpeed(cid, -x)
	addEvent(rebackSpd, 400, cid, x)
	setPlayerStorageValue(cid, 446, 1)
	doAreaCombatHealth(cid, WATERDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 68)
	
elseif spell == "Hydro Cannon" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area, eff)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, WATERDAMAGE, area, 0, 0, 0, eff)
   doAreaCombatHealth(cid, WATERDAMAGE, area, whirl3, -min, -max, 68)
end
end

for a = 0, 4 do

local t = {                                     --alterado v1.4
[0] = {64, {x=p.x, y=p.y-(a+1), z=p.z}},
[1] = {65, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {66, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {67, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 300*a, cid, t[d][2], t[d][1])
end
	
elseif spell == "Harden" or spell == "Calm Mind" or spell == "Defense Curl" or spell == "Charm" or spell == "Protect" then	
                                                                    --alterado v1.4
    if spell == "Calm Mind" then
       eff = 133
    elseif spell == "Charm" then
       eff = 147                --efeito n eh esse.. e n sei se eh soh bonus de def, ou sp.def tb.. ;x
    elseif spell == "Protect" then
       eff = 117 
	else                             
       eff = 144
    end
    
    local ret = {}
    ret.id = cid
    ret.cd = 8
    ret.eff = eff
    ret.check = 0
    ret.buff = spell
    ret.first = true
   
    doCondition2(ret)

elseif spell == "Scald" then

                 --cid, effDist, effDano, areaEff, areaDano, element, min, max
       doMoveInAreaMulti(cid, 2, 68, bullet, bulletDano, WATERDAMAGE, min, max)
      
elseif spell == "Skull Bash" then
local ret = {}
ret.id = 0
ret.cd = 9                        --alterado v1.6
ret.eff = 182
ret.check = 0
ret.first = true
ret.cond = "Paralyze"

       doMoveInArea2(cid, 182, reto5, NORMALDAMAGE, min, max, spell, ret)              

elseif spell == "Hydro Pump" then

local pos = getThingPosWithDebug(cid)

	local function doSendBubble(cid, pos)
		if not isCreature(cid) then return true end
		if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
		if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
		doSendDistanceShoot(getThingPosWithDebug(cid), pos, 2)
		doSendMagicEffect(pos, 53)
	end
	                                                          --alterado!!
	for a = 1, 20 do
	    local lugar = {x = pos.x + math.random(-4, 4), y = pos.y + math.random(-3, 3), z = pos.z}
	    addEvent(doSendBubble, a * 25, cid, lugar)
	end
	addEvent(doDanoWithProtect, 150, cid, WATERDAMAGE, pos, waterarea, -min, -max, 0)

elseif spell == "String Shot" then

   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 23)
   
   local ret = {}
   ret.id = target
   ret.cd = 6
   ret.eff = 137
   ret.check = getPlayerStorageValue(target, conds["Stun"])
   ret.spell = spell
   ret.cond = "Stun"
   
   addEvent(doMoveDano2, 100, cid, target, BUGDAMAGE, 0, 0, ret, spell)

elseif spell == "Bug Bite" then

	doSendMagicEffect(getThingPosWithDebug(target), 244)
    doDanoInTargetWithDelay(cid, target, BUGDAMAGE, min, max, 8) --alterado v1.7

elseif spell == "Super Sonic" then

	local rounds = math.random(4, 7)
	rounds = rounds + math.floor(getPokemonLevel(cid) / 35)

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 32)
	local ret = {}
	ret.id = target
	ret.cd = rounds
	ret.check = getPlayerStorageValue(target, conds["Confusion"])
	ret.cond = "Confusion"
	
	addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)

elseif spell == "Whirlwind" then

area = {SL1, SL2, SL3, SL4}

for i = 0, 3 do
    addEvent(doMoveInArea2, i*300, cid, 42, area[i+1], FLYINGDAMAGE, min, max, spell)
end
	
	elseif spell == "Razor Wind" then

area = {SL1, SL2, SL3, SL4}

for i = 0, 3 do
    addEvent(doMoveInArea2, i*300, cid, 131, area[i+1], NORMALDAMAGE, min, max, spell)
end
	
elseif spell == "Psybeam" then

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local t = {
[0] = 58,       --alterado v1.6
[1] = 56,
[2] = 58,
[3] = 56,
}

doMoveInArea2(cid, t[a], reto4, psyDmg, min, max, spell)     --alterado v1.4

elseif spell == "Signal Beam" then

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local t = {
[0] = 58,       --alterado v1.6
[1] = 56,
[2] = 58,
[3] = 56,
}

doMoveInArea2(cid, t[a], reto4, bugDmg, min, max, spell)     --alterado v1.4

elseif spell == "Sand Attack" then

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local t = {
[0] = 120,
[1] = 121,
[2] = 122,
[3] = 119,
}

local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 34
ret.check = 0
ret.spell = spell
ret.cond = "Miss"

doCreatureSetLookDir(cid, a)  
stopNow(cid, 1000)  
doMoveInArea2(cid, t[a], reto5, GROUNDDAMAGE, 0, 0, spell, ret) 

elseif spell == "Confusion" or spell == "Night Shade" then

    local rounds = math.random(4, 7)       
    rounds = rounds + math.floor(getPokemonLevel(cid) / 35)
    
    if spell == "Confusion" then
       dano = psyDmg             --alterado v1.4
    else
       dano = ghostDmg
    end

	local ret = {}
    ret.id = 0
    ret.check = 0
    ret.cd = rounds
    ret.cond = "Confusion"

    doMoveInArea2(cid, 136, selfArea1, dano, min, max, spell, ret)
	
	elseif spell == "Extrasensory" then

damage = skill == "Extrasensory" and PSYCHICDAMAGE

local function doPulse(cid, eff)
if not isCreature(cid) then return true end
   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 33)
   doDanoInTargetWithDelay(cid, target, damage, min, max, eff)      --alterado v1.7
end

   if spell == "Extrasensory" then
      eff = 47 
   else
      eff = 222
   end 
   
   addEvent(doPulse, 0, cid, eff)                
   addEvent(doPulse, 250, cid, eff)
	
	
		elseif spell == "Poison Jab" then

damage = skill == "Poison Jab" and POISONDAMAGE

local function doPulse(cid, eff)
if not isCreature(cid) then return true end
   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 20)
   doDanoInTargetWithDelay(cid, target, damage, min, max, eff)      --alterado v1.7
end

   if spell == "Poison Jab" then
      eff = 114
   else
      eff = 222
   end 
   
   addEvent(doPulse, 0, cid, eff)                
   addEvent(doPulse, 250, cid, eff)
	
elseif spell == "Horn Attack" then
       
       doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 15)
       doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 3) --alterado v1.7

elseif spell == "Poison Sting" then
       
       doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 15)
       doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 8) --alterado v1.7
		
elseif spell == "Fury Cutter" or spell == "Red Fury" then

       local effectpos = getThingPosWithDebug(cid)
       local effect = 255
       local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

	if a == 0 then
	    if getSubName(cid, target) == "Scizor" then  --alterado v1.6.1
	       effect = 236
	    else
		   effect = 128
	    end
		effectpos.x = effectpos.x + 1
		effectpos.y = effectpos.y - 1
	elseif a == 1 then
		effectpos.x = effectpos.x + 2
		effectpos.y = effectpos.y + 1
		if getSubName(cid, target) == "Scizor" then   --alterado v1.6.1
	       effect = 232
	    else
		   effect = 129
	    end
	elseif a == 2 then
		effectpos.x = effectpos.x + 1
		effectpos.y = effectpos.y + 2
		if getSubName(cid, target) == "Scizor" then   --alterado v1.6.1
	       effect = 233
	    else
		   effect = 131
	    end
	elseif a == 3 then
		effectpos.x = effectpos.x - 1
		effectpos.y = effectpos.y + 1
		if getSubName(cid, target) == "Scizor" then   --alterado v1.6.1
	       effect = 224
	    else
		   effect = 130
	    end
	end
        local function doFury(cid, effect)
        if not isCreature(cid)  then return true end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
		   doSendMagicEffect(effectpos, effect)
		   doMoveInArea2(cid, 2, wingatk, BUGDAMAGE, min, max, spell)
        end                               
        
        addEvent(doFury, 0, cid, effect)
        addEvent(doFury, 350, cid, effect)
        
elseif spell == "Pin Missile" then

       doMoveInAreaMulti(cid, 13, 7, bullet, bulletDano, BUGDAMAGE, min, max)
       
elseif spell == "Bulk Up" or spell == "attack;deffense" then

   local ret = {}
   ret.id = cid
   ret.cd = 15
   ret.eff = 14
   ret.check = 0
   ret.buff = spell
   ret.first = true
   
   doCondition2(ret)
    
elseif spell == "Gust" then

       doMoveInArea2(cid, 42, reto5, FLYINGDAMAGE, min, max, spell) 
       
elseif spell == "Drill Peck" then
	
doDanoWithProtect(cid, FLYINGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 148)

elseif spell == "Rolling Kick" then

    local pos = getThingPosWithDebug(cid)

	local function doSendTornado(cid, pos)
		if not isCreature(cid) then return true end
		if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
		if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
		doSendDistanceShoot(getThingPosWithDebug(cid), pos, 39)
		doSendMagicEffect(pos, 113)
	end

	for b = 1, 3 do
		for a = 1, 20 do
			local lugar = {x = pos.x + math.random(-4, 4), y = pos.y + math.random(-3, 3), z = pos.z}
			addEvent(doSendTornado, a * 75, cid, lugar)
		end
	end
	doDanoWithProtect(cid, FIGHTINGDAMAGE, pos, waterarea, -min, -max, 0)
	
	elseif spell == "Dragon Dance" then

    local pos = getThingPosWithDebug(cid)

	local function doSendTornado(cid, pos)
		if not isCreature(cid) then return true end
		if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
		if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
		doSendDistanceShoot(getThingPosWithDebug(cid), pos, 5)
		doSendMagicEffect(pos, 249)
	end

	for b = 1, 3 do
		for a = 1, 20 do
			local lugar = {x = pos.x + math.random(-4, 4), y = pos.y + math.random(-3, 3), z = pos.z}
			addEvent(doSendTornado, a * 75, cid, lugar)
		end
	end
	doDanoWithProtect(cid, DRAGONDAMAGE, pos, waterarea, -min, -max, 0)
		
	elseif spell == "Phantom Force" then

    local pos = getThingPosWithDebug(cid)

	local function doSendTornado(cid, pos)
		if not isCreature(cid) then return true end
		if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
		if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
		doSendDistanceShoot(getThingPosWithDebug(cid), pos, 18)
		doSendMagicEffect(pos, 140)
	end

	for b = 1, 3 do
		for a = 1, 20 do
			local lugar = {x = pos.x + math.random(-4, 4), y = pos.y + math.random(-3, 3), z = pos.z}
			addEvent(doSendTornado, a * 75, cid, lugar)
		end
	end
	doDanoWithProtect(cid, DRAGONDAMAGE, pos, waterarea, -min, -max, 0)
	
elseif spell == "Bite" or tonumber(spell) == 5 then

	doDanoWithProtect(cid, DARKDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 146)
	
elseif spell == "Super Fang" or spell == "Hyper Fang" then

	doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 244)
	
elseif spell == "Poison Fang" then

	doSendMagicEffect(getThingPosWithDebug(target), 244)
    doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 114) --alterado v1.7
	
elseif spell == "Venoshock" then
       
       local function doGun(cid, target)
       if not isCreature(cid) or not isCreature(target) then return true end    --alterado v1.7
          doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 13)
          doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 8)  --alterado v1.7
       end

       setPlayerStorageValue(cid, 3644587, 1)
       addEvent(setPlayerStorageValue, 200, cid, 3644587, 1)
       for i = 0, 2 do
	       addEvent(doGun, i*100, cid, target)
       end 
       
elseif spell == "Acid" then

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 14)
	doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 20)    --alterado v1.7
			
elseif spell == "Roar" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 244
ret.cond = "spite"
----
local p = getThingPosWithDebug(cid)
doSendMagicEffect({x=p.x+1, y=p.y, z=p.z}, 244)
doMoveInArea2(cid, 0, confusion, NORMALDAMAGE, 0, 0, spell, ret)
    	
elseif spell == "Spite" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 214
ret.cond = "spite"
----
local p = getThingPosWithDebug(cid)
doSendMagicEffect({x=p.x+1, y=p.y, z=p.z}, 214)
doMoveInArea2(cid, 0, confusion, GHOSTDAMAGE, 0, 0, spell, ret)
    
elseif spell == "Iron Tail" then

	local function rebackSpd(cid, sss)
		if not isCreature(cid) then return true end
		doChangeSpeed(cid, sss)
		setPlayerStorageValue(cid, 446, -1)
	end

	local x = getCreatureSpeed(cid)
	doFaceOpposite(cid)
	doChangeSpeed(cid, -x)
	addEvent(rebackSpd, 400, cid, x)
	setPlayerStorageValue(cid, 446, 1)
	doDanoWithProtect(cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 160)
	
elseif spell == "Thunder Shock" then
                                     
	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 40)
	doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 90)   --alterado v1.7

elseif spell == "Thunderbolt" then

        --alterado v1.7
		local function doThunderFall(cid, frompos, target)
			if not isCreature(target) or not isCreature(cid) then return true end
		local pos = getThingPosWithDebug(target)
		local ry = math.abs(frompos.y - pos.y)
		doSendDistanceShoot(frompos, getThingPosWithDebug(target), 41)
		addEvent(doDanoInTarget, ry * 11, cid, target, ELECTRICDAMAGE, min, max, 126) --alterado v1.7
		end

		local function doThunderUp(cid, target)
			if not isCreature(target) or not isCreature(cid) then return true end
		local pos = getThingPosWithDebug(target)
		local mps = getThingPosWithDebug(cid)
		local xrg = math.floor((pos.x - mps.x) / 2)
		local topos = mps
		topos.x = topos.x + xrg
		local rd =  7
		topos.y = topos.y - rd
		doSendDistanceShoot(getThingPosWithDebug(cid), topos, 41)
		addEvent(doThunderFall, rd * 49, cid, topos, target)
		end		

    setPlayerStorageValue(cid, 3644587, 1)
	addEvent(setPlayerStorageValue, 350, cid, 3644587, -1)
    for thnds = 1, 2 do
		addEvent(doThunderUp, thnds * 155, cid, target)
	end
	
elseif spell == "Thunder Wave" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 48
ret.spell = spell
ret.cond = "Stun"

doMoveInArea2(cid, 48, db1, ELECTRICDAMAGE, min, max, spell, ret) --alterado v1.8

elseif spell == "Thunder" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 48
ret.spell = spell
ret.cond = "Stun"

doMoveInArea2(cid, 48, thunderr, ELECTRICDAMAGE, min, max, spell, ret)

elseif spell == "Spider Web" then
                                                  
local ret = {}
ret.id = target
ret.cd = 9
ret.eff = 26
ret.check = 0
ret.spell = spell
ret.cond = "Paralyze"

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 23)
	addEvent(doMoveDano2, 100, cid, target, BUGDAMAGE, -min, -max, ret, spell)

elseif spell == "Double Kick" then

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
	doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 113)   --alterado v1.7
	
elseif spell == "Thunder Punch" then

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
    doSendMagicEffect(getThingPosWithDebug(target), 112)
    doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 48) --alterado v1.7
	
elseif spell == "Discharge" then             

local master = isSummon(cid) and getCreatureMaster(cid) or cid

local function doFall(cid)
for rocks = 1, 42 do
    addEvent(fall, rocks*35, cid, master, ELECTRICDAMAGE, 41, 48)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, 41)
end
addEvent(doFall, 450, cid)

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 48
ret.spell = spell
ret.cond = "Stun"

addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, ELECTRICDAMAGE, min, max, spell, ret)

elseif spell == "Infestation" then             

local master = isSummon(cid) and getCreatureMaster(cid) or cid

local function doFall(cid)
for rocks = 1, 42 do
    addEvent(fall, rocks*35, cid, master, BUGDAMAGE, 23)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, 23)
end
addEvent(doFall, 450, cid)

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 26
ret.spell = spell
ret.cond = "Silence"

addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, BUGDAMAGE, min, max, spell, ret)

elseif spell == "Spider Web" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 26
ret.cond = "Silence"

doMoveInAreaMulti(cid, 23, 26, multi, multiDano, BUGDAMAGE, min, max)
doMoveInArea2(cid, 0, multiDano, BUGDAMAGE, 0, 0, spell, ret)
	
	
elseif spell == "Mud Shot" or spell == "Mud-Slap" then

if isCreature(target) then                                    --alterado v1.8
local contudion = spell == "Mud Shot" and "Miss" or "Stun"                                                   
local ret = {}
ret.id = target
ret.cd = 9
ret.eff = 34
ret.check = getPlayerStorageValue(target, conds[contudion])
ret.spell = spell
ret.cond = contudion

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 6)
	addEvent(doMoveDano2, 100, cid, target, GROUNDDAMAGE, -min, -max, ret, spell)
end
 
elseif spell == "Rollout" then

    local function setOutfit(cid, outfit)
          if isCreature(cid) and getCreatureCondition(cid, CONDITION_OUTFIT) == true then
             if getCreatureOutfit(cid).lookType == outfit then
                doRemoveCondition(cid, CONDITION_OUTFIT)
                if getCreatureName(cid) == "Ditto" and pokes[getPlayerStorageValue(cid, 1010)] and getPlayerStorageValue(cid, 1010) ~= "Ditto" then
                   if isSummon(cid) then
                      local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
                      doSetCreatureOutfit(cid, {lookType = getItemAttribute(item.uid, "transOutfit")}, -1)   --alterado v1.8
                   end
                end 
             end
          end
    end
    
	if RollOuts[getSubName(cid, target)] then
		doSetCreatureOutfit(cid, RollOuts[getSubName(cid, target)], -1)   --alterado v1.6.1
    end 

	local outfit = getCreatureOutfit(cid).lookType

    local function roll(cid, outfit)
    if not isCreature(cid) then return true end
    if isSleeping(cid) then return true end
       if RollOuts[getSubName(cid, target)] then
          doSetCreatureOutfit(cid, RollOuts[getSubName(cid, target)], -1)   --alterado v1.6.1
       end
       doDanoWithProtect(cid, ROCKDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 0)
    end

    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 9000, cid, 3644587, -1)
    for r = 1, 11 do  --8
        addEvent(roll, 750 * r, cid, outfit)
    end
    addEvent(setOutfit, 9050, cid, outfit)
    
elseif spell == "Shockwave" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area, areaEff, eff)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end                                             --testar o atk!!
   doAreaCombatHealth(cid, GROUNDDAMAGE, areaEff, 0, 0, 0, eff)    
   doAreaCombatHealth(cid, GROUNDDAMAGE, area, whirl3, -min, -max, 255)     
end
end

for a = 0, 5 do

local t = {
[0] = {126, {x=p.x, y=p.y-(a+1), z=p.z}, {x=p.x+1, y=p.y-(a+1), z=p.z}},           
[1] = {124, {x=p.x+(a+1), y=p.y, z=p.z}, {x=p.x+(a+1), y=p.y+1, z=p.z}},
[2] = {125, {x=p.x, y=p.y+(a+1), z=p.z}, {x=p.x+1, y=p.y+(a+1), z=p.z}},
[3] = {123, {x=p.x-(a+1), y=p.y, z=p.z}, {x=p.x-(a+1), y=p.y+1, z=p.z}}
}   
addEvent(sendAtk, 325*a, cid, t[d][2], t[d][3], t[d][1])
end                          
	
elseif spell == "Smack Down" then

local eff = getSubName(cid, target) == "Shiny Onix" and 179 or 127 --alterado v1.6.1              

	doAreaCombatHealth(cid, GROUNDDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 255)

	local sps = getThingPosWithDebug(cid)
	sps.x = sps.x+1
	sps.y = sps.y+1
	doSendMagicEffect(sps, eff)
	
elseif spell == "Earthquake" then

local eff = getSubName(cid, target) == "Shiny Onix" and 175 or 118  --alterado v1.6.1
 
local function doQuake(cid)
if not isCreature(cid) then return false end
if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
   doMoveInArea2(cid, eff, confusion, GROUNDDAMAGE, min, max, spell)
end

times = {0, 500, 1000, 1500, 2300, 2800, 3300, 3800, 4600, 5100, 5600, 6100, 6900, 7400, 7900, 8400, 9200, 10000}

setPlayerStorageValue(cid, 3644587, 1)
addEvent(setPlayerStorageValue, 10000, cid, 3644587, -1)
for i = 1, #times do                   --alterado v1.4
    addEvent(doQuake, times[i], cid)
end
	
	
elseif spell == "Stomp" then
    
    local ret = {}
    ret.id = 0
    ret.cd = 9
    ret.check = 0
    ret.eff = 34
    ret.spell = spell
    ret.cond = "Stun"   
       
    doMoveInArea2(cid, 118, stomp, NORMALDAMAGE, min, max, spell, ret)
       
elseif spell == "Toxic Spikes" then
       
       local function doToxic(cid, target)
       if not isCreature(cid) or not isCreature(target) then return true end  --alterado v1.7
          doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 15)
          doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 114) --alterado v1.7
       end

       setPlayerStorageValue(cid, 3644587, 1)
       addEvent(setPlayerStorageValue, 300, cid, 3644587, -1)
	   addEvent(doToxic, 0, cid, target)
       addEvent(doToxic, 300, cid, target)
       
elseif spell == "Horn Drill" then
       
       local function doHorn(cid, target)
       if not isCreature(cid) or not isCreature(target) then return true end   --alterado v1.7
          doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 25)
          doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 3)  --alterado v1.7
       end

       setPlayerStorageValue(cid, 3644587, 1)
	   addEvent(setPlayerStorageValue, 300, cid, 3644587, -1)
       addEvent(doHorn, 0, cid, target)
       addEvent(doHorn, 300, cid, target)
       
elseif spell == "Double Slap" then
       
	doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 148)
    
elseif spell == "Sweet Kiss" then 
   
	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 16)
	
	local ret = {}
    ret.id = target
    ret.cd = 9
    ret.check = getPlayerStorageValue(target, conds["Stun"])
    ret.eff = 147
    ret.spell = spell
    ret.cond = "Stun"  
    
    addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
        
elseif spell == "Sing" then

local ret = {}
ret.id = 0
ret.cd = math.random(6, 10)
ret.check = 0
ret.first = true
ret.cond = "Sleep"                 --alterado v1.6
	
doMoveInArea2(cid, 33, selfArea1, NORMALDAMAGE, 0, 0, spell, ret) 
    
elseif spell == "Pound" then

       doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 3)
       
elseif spell == "Take Down" then

       doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 3)
       
elseif spell == "Metronome" then

local spells = {"Hex", "Discharge", "Flare Blitz", "Blizzard", "Meteor Mash", "Leaf Storm", "Hydro Pump", "Rock Slide"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 161)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
elseif spell == "Sketch 1" then

local spells = {"Zen Headbutt", "Thunderbolt", "Ember", "Rock Throw", "Razor Leaf", "Bubble", "Egg Bomb", "Sludge Bomb"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 0)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
elseif spell == "Sketch 2" then

local spells = {"Mud Bomb", "Magical Leaf", "Fire Spin", "Brine", "Feather Dance"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 0)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
elseif spell == "Sketch 3" then

local spells = {"Poison Gas", "Earthquake", "Leaf Tornado", "10 Million Volt Thunder", "Overheat"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 0)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
elseif spell == "Sketch 4" then

local spells = {"Thunder", "Night Slash", "Confusion", "Air Cutter", "Confusion", "Night Shade"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 0)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
elseif spell == "Sketch 5" then

local spells = {"Solar Beam", "Bullet Seed", "Blast Burn", "Fire Blast", "Scald", "Hydro Cannon", "Pin Missile"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 0)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
	elseif spell == "Sketch 6" then

local spells = {"Shockwave", "Petal Dance", "Hyper Beam", "Zap Cannon", "Aurora Beam", "Ice Beam", "Flash Cannon"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 0)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
elseif spell == "Sketch 7" then

local spells = {"Spite", "Sunny Day", "Scary Face", "Cotton Spore", "Sleep Powder"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 0)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
elseif spell == "Sketch 8" then

local spells = {"Reflect", "Charm", "Agility", "Safeguard", "Synthesis", "Emergency Call", "Heal Pulse", "Sing"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 0)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
elseif spell == "Sketch 9" then

local spells = {"Psychic", "Earth Power", "Smog", "Hydro Pump", "Muddy Water"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 0)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
elseif spell == "Sketch 10" then

local spells = {"Focus Blast", "Blizzard", "Hex", "Rock Slide", "Meteor Mash", "Discharge", "Water Pledge", "Flare Blitz", "Draco Meteor", "Future Sight"}

    local random = math.random(1, #spells)

	local randommove = spells[random]
	local pos = getThingPosWithDebug(cid)
	pos.y = pos.y - 1

	doSendMagicEffect(pos, 0)
	
	local function doMetronome(cid, skill)
	if not isCreature(cid) then return true end
       docastspell(cid, skill)
    end
    
    addEvent(doMetronome, 200, cid, randommove)
    
elseif spell == "Meditate" or spell == "Charge" or spell == "Swords Dance" then
                                                    --alterado v1.4
       if spell == "Charge" then
          doSendAnimatedText(getThingPosWithDebug(cid), "CHARGE", 168)
          doSendMagicEffect(getThingPosWithDebug(cid), 177)
       elseif spell == "Swords Dance" then
           doSendMagicEffect(getThingPosWithDebug(cid), 100) 
       else
           doSendAnimatedText(getThingPosWithDebug(cid), "Meditate", 144)
           doSendMagicEffect(getThingPosWithDebug(cid), 132)
       end
       setPlayerStorageValue(cid, 253, 1)
	   
	   elseif spell == "Growth" then
                                                    --alterado v1.4
       if spell == "Growth" then
          doSendAnimatedText(getThingPosWithDebug(cid), "Growth", 168)
          doSendMagicEffect(getThingPosWithDebug(cid), 177)
       end
       setPlayerStorageValue(cid, 253, 1)
	   
	   
       
--[[elseif spell == "Overheat" then
                                                    --alterado v1.8 o atk ta la pra baixo agora...
    local function sendFireEff(cid, dir)
    if not isCreature(cid) then return true end
    if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
    if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
       doDanoWithProtect(cid, FIREDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 15)
	end

	local function doWheel(cid)
	if not isCreature(cid) then return true end
	local t = {
	      [1] = SOUTH,
	      [2] = SOUTHEAST,
	      [3] = EAST,
	      [4] = NORTHEAST,
	      [5] = NORTH,        --alterado!
	      [6] = NORTHWEST,
	      [7] = WEST,
	      [8] = SOUTHWEST,
		}
		for a = 1, 8 do
            addEvent(sendFireEff, a * 140, cid, t[a])
		end
	end

	doWheel(cid, false, cid)    ]]
    
elseif spell == "Hyper Voice" then

    local ret = {}
    ret.id = 0
    ret.cd = 9
    ret.check = 0
    ret.eff = 22
    ret.spell = spell
    ret.cond = "Stun"   
       
    doMoveInArea2(cid, 22, tw1, NORMALDAMAGE, min, max, spell, ret)

elseif spell == "Recover" or spell == "Wish" or spell == "Refresh" then
	
	local min = (getCreatureMaxHealth(cid) * 25) / 100
	local max = (getCreatureMaxHealth(cid) * 35) / 100
	
	local function doHealArea(cid, min, max)
    local amount = math.random(min, max)
    if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
        amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
    end
    if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
       doCreatureAddHealth(cid, amount)
       doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
    end
    end
    
	doSendMagicEffect(getThingPosWithDebug(cid), 132)
    doHealArea(cid, min, max)
	
	elseif spell == "Aqua Ring"  then
	
	local min = (getCreatureMaxHealth(cid) * 75) / 100
	local max = (getCreatureMaxHealth(cid) * 85) / 100
	
	local function doHealArea(cid, min, max)
    local amount = math.random(min, max)
    if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
        amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
    end
    if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
       doCreatureAddHealth(cid, amount)
       doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
    end
    end
    
	doSendMagicEffect(getThingPosWithDebug(cid), 132)
    doHealArea(cid, min, max)
    
	
elseif spell == "Heal Pulse" or spell == "Healing Wish" or spell == "Heal Bell" then
	
	local min = (getCreatureMaxHealth(cid) * 30) / 100
	local max = (getCreatureMaxHealth(cid) * 45) / 100
    
    local function doHealArea(cid, min, max)
    local amount = math.random(min, max)
    if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
        amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
    end
    if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
       doCreatureAddHealth(cid, amount)
       doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
    end
    end
    
    local pos = getPosfromArea(cid, heal)
    local n = 0
    doHealArea(cid, min, max)
    
    while n < #pos do
    n = n+1
    thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
    local pid = getThingFromPosWithProtect(thing)
    
    doSendMagicEffect(pos[n], 12)
    if isCreature(pid) then
       if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
          if canAttackOther(cid, pid) == "Cant" then
             doHealArea(pid, min, max)
          end 
       elseif ehMonstro(cid) and ehMonstro(pid) then
          doHealArea(pid, min, max)
       end
    end 
    end
    
elseif spell == "Kiss Heal" then
	
	local min = (getCreatureMaxHealth(cid) * 30) / 100
	local max = (getCreatureMaxHealth(cid) * 45) / 100
    
    local function doHealArea(cid, min, max)
    local amount = math.random(min, max)
    if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
        amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
    end
    if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
       doCreatureAddHealth(cid, amount)
       doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
    end
    end
    
    local pos = getPosfromArea(cid, heal)
    local n = 0
    doHealArea(cid, min, max)
    
    while n < #pos do
    n = n+1
    thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
    local pid = getThingFromPosWithProtect(thing)
    
    doSendMagicEffect(pos[n], 147)
    if isCreature(pid) then
       if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
          if canAttackOther(cid, pid) == "Cant" then
             doHealArea(pid, min, max)
          end 
       elseif ehMonstro(cid) and ehMonstro(pid) then
          doHealArea(pid, min, max)
       end
    end 
    end
    
elseif spell == "Milk Drink" then
	
	local min = (getCreatureMaxHealth(cid) * 30) / 100
	local max = (getCreatureMaxHealth(cid) * 60) / 100
    
    local function doHealArea(cid, min, max)
    local amount = math.random(min, max)
    if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
        amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
    end
    if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
       doCreatureAddHealth(cid, amount)
       doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
    end
    end
    
    local pos = getPosfromArea(cid, heal)
    local n = 0
    doHealArea(cid, min, max)
    
    while n < #pos do
    n = n+1
    thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
    local pid = getThingFromPosWithProtect(thing)
    
    doSendMagicEffect(pos[n], 12)
    if isCreature(pid) then
       if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
          if canAttackOther(cid, pid) == "Cant" then
             doHealArea(pid, min, max)
          end 
       elseif ehMonstro(cid) and ehMonstro(pid) then
          doHealArea(pid, min, max)
       end
    end 
    end
    
elseif spell == "Toxic" then
 
  doMoveInArea2(cid, 114, reto5, POISONDAMAGE, min, max, spell)

elseif spell == "Absorb" then

	local life = getCreatureHealth(target)

	doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 14)
    
	local newlife = life - getCreatureHealth(target)

	doSendMagicEffect(getThingPosWithDebug(cid), 14)
	if newlife >= 1 then
	   doCreatureAddHealth(cid, newlife)
       doSendAnimatedText(getThingPosWithDebug(cid), "+"..newlife.."", 32)
	end  
	
elseif spell == "Sludge Bomb" then

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 24)
    doDanoWithProtectWithDelay(cid, target, POISONDAMAGE, min, max, 237, bombWee2)

elseif spell == "Poison Gas" then 

local dmg = isSummon(cid) and getMasterLevel(cid)+getPokemonBoost(cid) or getPokemonLevel(cid)

local ret = {id = 0, cd = 13, eff = 34, check = 0, spell = spell, cond = "Miss"}
local ret2 = {id = 0, cd = 13, check = 0, damage = dmg, cond = "Poison"}                          --rever isso ainda!!
  
	local function gas(cid)
           doMoveInArea2(cid, 237, confusion, POISONDAMAGE, 0, 0, spell, ret)
		   doMoveInArea2(cid, 0, confusion, POISONDAMAGE, min, max, spell)
	end
    	
times = {0, 500, 1000, 1500, 2300, 2800, 3300, 3800, 4600, 5100, 5600, 6100, 6900, 7400, 7900, 8400, 9200, 10000}

for i = 1, #times do
    addEvent(gas, times[i], cid)                            
end
	
	elseif spell == "Dark Pulse" then 

local dmg = isSummon(cid) and getMasterLevel(cid)+getPokemonBoost(cid) or getPokemonLevel(cid)

local ret = {id = 0, cd = 13, eff = 34, check = 0, spell = spell, cond = "Miss"}
local ret2 = {id = 0, cd = 13, check = 0, damage = dmg, cond = "Poison"}                          --rever isso ainda!!
  
	local function gas(cid)
           doMoveInArea2(cid, 232, confusion, DARKDAMAGE, 0, 0, spell, ret)
		   doMoveInArea2(cid, 0, confusion, DARKDAMAGE, min, max, spell)
	end
    	
times = {0, 500, 1000, 1500, 2300, 2800, 3300, 3800, 4600, 5100, 5600, 6100, 6900, 7400}

for i = 1, #times do
    addEvent(gas, times[i], cid)                            
end
	
elseif spell == "Petal Dance" or tonumber(spell) == 73 then

	addEvent(doDanoWithProtect, 150, cid, GRASSDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)

	local pos = getThingPosWithDebug(cid)

	local function doSendLeafStorm(cid, pos)              --alterado!!
		if not isCreature(cid) then return true end
	    doSendDistanceShoot(getThingPosWithDebug(cid), pos, 21)
	end

	for a = 1, 100 do
		local lugar = {x = pos.x + math.random(-6, 6), y = pos.y + math.random(-5, 5), z = pos.z}
		addEvent(doSendLeafStorm, a * 2, cid, lugar)
	end
    
elseif spell == "Foul Play" or tonumber(spell) == 73 then

	addEvent(doDanoWithProtect, 150, cid, GRASSDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)

	local pos = getThingPosWithDebug(cid)

	local function doSendLeafStorm(cid, pos)              --alterado!!
		if not isCreature(cid) then return true end
	    doSendDistanceShoot(getThingPosWithDebug(cid), pos, 44)
	end

	for a = 1, 100 do
		local lugar = {x = pos.x + math.random(-6, 6), y = pos.y + math.random(-5, 5), z = pos.z}
		addEvent(doSendLeafStorm, a * 2, cid, lugar)
	end
    
elseif spell == "Dynamic Punch" then

	local mpos = getThingPosWithDebug(cid)
	local b = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
	local effect = 0
	local xvar = 0
	local yvar = 0

	if b == SOUTH then
		effect = 218
		yvar = 2
	elseif b == NORTH then
		effect = 217
	elseif b == WEST then
		effect = 216
	elseif b == EAST then
		effect = 215
		xvar = 2
	end

	mpos.x = mpos.x + xvar
	mpos.y = mpos.y + yvar         

	doSendMagicEffect(mpos, effect)
	doMoveInArea2(cid, 0, machine, FIGHTINGDAMAGE, min, max, spell)
	
elseif spell == "Counter" then

local function doRevenge(cid)
if not isCreature(cid) then return false end
if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
local rev = getThingPosWithDebug(cid)
rev.x = rev.x+1
rev.y = rev.y+1
doSendMagicEffect(rev, 99)
	doAreaCombatHealth(cid, FIGHTINGDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 255)

end

times = {0, 500, 1000, 1500, 2300}

setPlayerStorageValue(cid, 3644587, 1)
addEvent(setPlayerStorageValue, 10000, cid, 3644587, -1)
for i = 1, #times do                   --alterado v1.4
addEvent(doRevenge, times[i], cid)
end
	
	 
elseif spell == "Close Combat" then
	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 26)
	doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, -min, -max, 99)  --alterado v1.7 
       doSendAnimatedText(getThingPosWithDebug(cid), "Hora Do SHOW!", 144)   
       setPlayerStorageValue(cid, 253, 1)

elseif spell == "Sandstorm" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid
------------
local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 34
ret.cond = "Silence"
---
local function doFall(cid)
for rocks = 1, 42 do --62
    addEvent(fall, rocks*35, cid, master, ROCKDAMAGE, 22, 158)
end
end
---
local function doRain(cid)
if isSummon(cid) then 
   doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
end                                                      --cura status
doCureStatus(cid, "all")
---
setPlayerStorageValue(cid, 253, 1)  --Meditate
doSendMagicEffect(getThingPosWithDebug(cid), 132)
---
doMoveInArea2(cid, 0, confusion, ROCKDAMAGE, 0, 0, spell, ret)
end
---
addEvent(doFall, 200, cid)
addEvent(doRain, 1000, cid)

elseif spell == "Egg Rain" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid
------------
local ret = {}
local effD = 12
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 34
ret.cond = "Silence"
---
local function doFall(cid)
for rocks = 1, 42 do --62
    addEvent(fall, rocks*35, cid, master, NORMALDAMAGE, 12, 103)
end
end
for up = 1, 10 do
    addEvent(upEffect, up*75, cid, effD)
end
---
local function doRain(cid)
if isSummon(cid) then 
   doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
end                                                      --cura status
doCureStatus(cid, "all")
---
setPlayerStorageValue(cid, 253, 1)  --Meditate
doSendMagicEffect(getThingPosWithDebug(cid), 132)
---
doMoveInArea2(cid, 0, confusion, NORMALDAMAGE, 0, 0, spell, ret)
end
---
addEvent(doFall, 200, cid)
addEvent(doRain, 1000, cid)
addEvent(doDanoWithProtect, 1400, cid, NORMALDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)

elseif spell == "Powder Snow" then

    local ret = {}
    ret.id = 0
    ret.cd = 9
    ret.eff = 0
    ret.check = 0
    ret.spell = spell
    ret.cond = "Slow"
    
    doMoveInArea2(cid, 205, confusion, ICEDAMAGE, 0, 0, spell, ret)

elseif spell == "Slash" then

	doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 159)
	
elseif spell == "X-Scissor" then

local a = getThingPosWithDebug(cid)
 
local X = {
{{x = a.x+1, y = a.y, z = a.z}, 16}, --norte
{{x = a.x+2, y = a.y+1, z = a.z}, 221}, --leste
{{x = a.x+1, y = a.y+2, z = a.z}, 223}, --sul
{{x = a.x, y = a.y+1, z = a.z}, 243}, --oeste
}

local pos = X[mydir+1]

for b = 1, 3 do
    addEvent(doSendMagicEffect, b * 70, pos[1], pos[2])
end
	
doMoveInArea2(cid, 2, xScissor, BUGDAMAGE, min, max, spell)
	
elseif spell == "Psychic" then
                                    
	doDanoWithProtect(cid, psyDmg, getThingPosWithDebug(cid), selfArea2, min, max, 133)     
	
elseif spell == "Pay Day" then

        --alterado v1.7
		local function doThunderFall(cid, frompos, target)
			if not isCreature(target) or not isCreature(cid) then return true end
		local pos = getThingPosWithDebug(target)
		local ry = math.abs(frompos.y - pos.y)
		doSendDistanceShoot(frompos, getThingPosWithDebug(target), 39)
		addEvent(doDanoInTarget, ry * 11, cid, target, NORMALDAMAGE, min, max, 28)  --alterado v1.7
		end

		local function doThunderUp(cid, target)
			if not isCreature(target) or not isCreature(cid) then return true end
		local pos = getThingPosWithDebug(target)
		local mps = getThingPosWithDebug(cid)
		local xrg = math.floor((pos.x - mps.x) / 2)
		local topos = mps
		topos.x = topos.x + xrg
		local rd =  7
		topos.y = topos.y - rd
		doSendDistanceShoot(getThingPosWithDebug(cid), topos, 39)
		addEvent(doThunderFall, rd * 49, cid, topos, target)
		end		

    setPlayerStorageValue(cid, 3644587, 1)
	addEvent(setPlayerStorageValue, 350, cid, 3644587, -1)          
    for thnds = 1, 2 do
		addEvent(doThunderUp, thnds * 155, cid, target)
	end 
    
elseif spell == "Psywave" then

doMoveInArea2(cid, 133, db1, psyDmg, min, max, spell)      

	
elseif spell == "Aura Sphere" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area, eff)
if isCreature(cid) then 
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, steelDmg, area, 0, 0, 0, eff)    --alterado v1.4
   doAreaCombatHealth(cid, steelDmg, area, whirl3, -min, -max, 255)     --alterado v1.4
end
end

for a = 0, 4 do

local t = {
[0] = {206, {x=p.x, y=p.y-(a+1), z=p.z}},           --alterado v1.4
[1] = {206, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {206, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {206, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 370*a, cid, t[d][2], t[d][1])
end


elseif spell == "Karate Chop" then
    
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
	doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, -min, -max, 113)  --alterado v1.7
	
elseif spell == "Focus Punch" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area, area2, eff)  --alterado v1.6
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, FIGHTINGDAMAGE, area, 0, 0, 0, eff)    
   doAreaCombatHealth(cid, FIGHTINGDAMAGE, area2, whirl3, -min, -max, 255)  --alterado v1.6   
end
end

for a = 0, 4 do

local t = {
[0] = {99, {x=p.x+1, y=p.y-(a+1), z=p.z}, {x=p.x, y=p.y-(a+1), z=p.z}},           --alterado v1.6
[1] = {99, {x=p.x+(a+2), y=p.y+1, z=p.z}, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {99, {x=p.x+1, y=p.y+(a+2), z=p.z}, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {99, {x=p.x-(a+1), y=p.y+1, z=p.z}, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 270*a, cid, t[d][2], t[d][3], t[d][1]) --alterado v1.6
end    
      
elseif spell == "Mega Punch" then

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
	doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, -min, -max, 112)  --alterado v1.7
    
elseif spell == "Flame Burst" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 39
ret.cond = "Silence"

       doMoveInArea2(cid, 6, triflames, FIREDAMAGE, min, max, spell, ret)
          
elseif spell == "Howl" then

   local ret = {}
   ret.id = cid
   ret.cd = 15
   ret.eff = 28
   ret.check = 0
   ret.buff = spell
   ret.first = true
   
   doCondition2(ret)
            elseif spell == "Agility" then

   local ret = {}
   ret.id = cid
   ret.cd = 15
   ret.eff = 14
   ret.check = 0
   ret.buff = spell
   ret.first = true
   
   doCondition2(ret)
            
elseif spell == "Hypnosis" then

local ret = {}
ret.id = target
ret.cd = math.random(6, 9)
ret.check = getPlayerStorageValue(target, conds["Sleep"])
ret.first = true                                                --alterado v1.6
ret.cond = "Sleep"

   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 24)
   addEvent(doMoveDano2, 150, cid, target, PSYCHICDAMAGE, 0, 0, ret, spell)

elseif spell == "Dizzy Punch" then

   local rounds = getPokemonLevel(cid) / 12
   rounds = rounds + 2
   
   local ret = {}
   ret.id = target
   ret.check = getPlayerStorageValue(target, conds["Confusion"])
   ret.cd = rounds
   ret.cond = "Confusion"
   
   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 26)
   doDanoWithProtect(cid, FIGHTINGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 112)	
   addEvent(doMoveDano2, 50, cid, target, NORMALDAMAGE, 0, 0, ret, spell)

elseif spell == "Ice Punch" then
                   
local ret = {}
ret.id = target
ret.cd = 9
ret.eff = 43
ret.check = getPlayerStorageValue(target, conds["Slow"])
ret.first = true
ret.cond = "Slow"

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 28)
    doSendMagicEffect(getThingPosWithDebug(target), 112)
    doDanoWithProtectWithDelay(cid, target, ICEDAMAGE, min, max, 43)
    addEvent(doMoveDano2, 50, cid, target, ICEDAMAGE, 0, 0, ret, spell)
	
elseif spell == "Ice Beam" then

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)
local t = {
[0] = {97, {x=p.x+1, y=p.y-1, z=p.z}},
[1] = {96, {x=p.x+6, y=p.y+1, z=p.z}}, 
[2] = {97, {x=p.x+1, y=p.y+6, z=p.z}},
[3] = {96, {x=p.x-1, y=p.y+1, z=p.z}},
}

local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 43
ret.check = 0
ret.first = true
ret.cond = "Slow"

doMoveInArea2(cid, 0, triplo6, ICEDAMAGE, min, max, spell, ret)
doSendMagicEffect(t[a][2], t[a][1])

	
elseif spell == "Synchronoise" then

       local rounds = math.random(4, 7)
       rounds = rounds + math.floor(getPokemonLevel(cid) / 35)
       local eff = {136, 136, 133, 133, 136}
       local area = {psy1, psy2, psy3, psy4, psy5}

       local ret = {}
       ret.id = 0
       ret.check = 0
       ret.cd = rounds
       ret.cond = "Confusion"

       setPlayerStorageValue(cid, 3644587, 1)
       addEvent(setPlayerStorageValue, 4*400, cid, 3644587, -1)
       for i = 0, 4 do
           addEvent(doMoveInArea2, i*400, cid, eff[i+1], area[i+1], psyDmg, min, max, spell, ret)
       end
    
elseif spell == "Light Screen" then

       local rounds = math.random(4, 7)
       rounds = rounds + math.floor(getPokemonLevel(cid) / 35)
       local eff = {238, 238, 233, 238, 233}
       local area = {psy1, psy2, psy3, psy4, psy5}

       local ret = {}
       ret.id = 0
       ret.check = 0
       ret.cd = rounds
       ret.cond = "Confusion"

       setPlayerStorageValue(cid, 3644587, 1)
       addEvent(setPlayerStorageValue, 4*400, cid, 3644587, -1)
       for i = 0, 4 do
           addEvent(doMoveInArea2, i*400, cid, eff[i+1], area[i+1], psyDmg, min, max, spell, ret)
       end
              
elseif spell == "High Jump Kick" then

	doDanoWithProtect(cid, FIGHTINGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 110)
	
elseif spell == "Superpower" then

       doMoveInAreaMulti(cid, 26, 111, bullet, bulletDano, FIGHTINGDAMAGE, min, max)
       
elseif spell == "Rock Throw" then

local effD = getSubName(cid, target) == "Shiny Onix" and 0 or 11
local eff = getSubName(cid, target) == "Shiny Onix" and 176 or 44  --alterado v1.6.1

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), effD)
	doDanoInTargetWithDelay(cid, target, ROCKDAMAGE, min, max, eff) --alterado v1.7
	
elseif spell == "Rock Slide" then

local effD = getSubName(cid, target) == "Shiny Onix" and 0 or 11
local eff = getSubName(cid, target) == "Shiny Onix" and 176 or 44  --alterado v1.6.1

local master = isSummon(cid) and getCreatureMaster(cid) or cid
------------

local function doFall(cid)
for rocks = 1, 62 do
    addEvent(fall, rocks*35, cid, master, ROCKDAMAGE, effD, eff)
end
end

for up = 1, 10 do                                                            
    addEvent(upEffect, up*75, cid, effD)
end
addEvent(doFall, 450, cid)
addEvent(doDanoWithProtect, 1400, cid, ROCKDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)

elseif spell == "Self-Destruct" then
                                         
		local function death(cid)
			if isCreature(cid) then
			   if pokeHaveReflect(cid) then return true end    --alterado v1.6
			   doCreatureAddHealth(cid, -getCreatureMaxHealth(cid))
			end
		end

        doMoveInArea2(cid, 5, selfArea1, NORMALDAMAGE, min, max, spell)    --alterado v1.6
        addEvent(death, 300, cid)
		
elseif spell == "Magnitude" then
       
local pL = getThingPosWithDebug(cid)
pL.x = pL.x+5
pL.y = pL.y+1 
-----------------
local pO = getThingPosWithDebug(cid)
pO.x = pO.x-3
pO.y = pO.y+1 
------------------
local pN = getThingPosWithDebug(cid)
pN.x = pN.x+1
pN.y = pN.y+5 
-----------------
local pS = getThingPosWithDebug(cid)
pS.x = pS.x+1
pS.y = pS.y-3 

local po = {pL, pO, pN, pS}
local po2 = {
{x = pL.x, y = pL.y-1, z = pL.z},
{x = pO.x, y = pO.y-1, z = pO.z},
{x = pN.x-1, y = pN.y, z = pN.z},
{x = pS.x-1, y = pS.y, z = pS.z},
}

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 34
ret.spell = spell
ret.cond = "Stun"

for i = 1, 4 do
    doSendMagicEffect(po[i], 127)
    doAreaCombatHealth(cid, GROUNDDAMAGE, po2[i], crusher, -min, -max, 255)
end
doMoveInArea2(cid, 118, stomp, GROUNDDAMAGE, min, max, spell, ret)  

elseif spell == "Water Pulse" then
                                    
	doDanoWithProtect(cid, WATERDAMAGE, getThingPosWithDebug(cid), selfArea2, min, max, 175)     
	
elseif spell == "Sonic Boom" then

local function doBoom(cid)
if not isCreature(cid) then return true end
   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 33)
   doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 3)   --alterado v1.7
end

   addEvent(doBoom, 0, cid)
   addEvent(doBoom, 250, cid)
   
elseif spell == "Stickmerang" then   

   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 34)
   doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, min, max, 212)  --alterado v1.7

elseif spell == "Stickslash" then

    local function sendStickEff(cid, dir)
    if not isCreature(cid) then return true end
       doAreaCombatHealth(cid, FLYINGDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 212)
	end

	local function doStick(cid)
	if not isCreature(cid) then return true end
	local t = {
	      [1] = SOUTHWEST,
	      [2] = SOUTH,
	      [3] = SOUTHEAST,
	      [4] = EAST,
	      [5] = NORTHEAST,
	      [6] = NORTH,
	      [7] = NORTHWEST,
	      [8] = WEST,
	      [9] = SOUTHWEST,
		}
		for a = 1, 9 do
            addEvent(sendStickEff, a * 140, cid, t[a])
		end
	end

	doStick(cid, false, cid)
    
elseif spell == "Stick Throw" then

local area = {Throw01, Throw02, Throw03, Throw04, Throw03, Throw02, Throw01}

for i = 0, 6 do
    addEvent(doMoveInArea2, i*400, cid, 212, area[i+1], FLYINGDAMAGE, min, max, spell)
end	

elseif spell == "Stomping Tantrum" then

local area = {Throw01, Throw02, Throw03, Throw04, Throw03, Throw02, Throw01}

for i = 0, 6 do
    addEvent(doMoveInArea2, i*400, cid, 100, area[i+1], GROUNDDAMAGE, min, max, spell)
end	


elseif spell == "Pluck" then

   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
   doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, min, max, 111)  --alterado v1.7

elseif spell == "Tri Attack" then

   --alterado v1.7
   setPlayerStorageValue(cid, 3644587, 1)
   addEvent(setPlayerStorageValue, 600, cid, 3644587, -1) 
   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 42)  --alterado v1.6
   for i = 0, 2 do
       addEvent(doDanoInTargetWithDelay, i*300, cid, target, NORMALDAMAGE, min, max, 238)      --alterado v1.7
   end 
    
elseif spell == "Icy Wind" then                   

local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 43
ret.check = 0
ret.first = true
ret.cond = "Slow"
	
  doMoveInArea2(cid, 17, db1, ICEDAMAGE, min, max, spell, ret)
  
elseif spell == "Aurora Beam" then

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)
local t = {
[0] = {186, {x=p.x+1, y=p.y-1, z=p.z}},
[1] = {57, {x=p.x+6, y=p.y+1, z=p.z}},   --alterado v1.6
[2] = {186, {x=p.x+1, y=p.y+6, z=p.z}},
[3] = {57, {x=p.x-1, y=p.y+1, z=p.z}},  --alterado v1.6
}

local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 43
ret.check = 0
ret.first = true
ret.cond = "Slow"

doMoveInArea2(cid, 0, triplo6, ICEDAMAGE, min, max, spell, ret)
doSendMagicEffect(t[a][2], t[a][1])

elseif spell == "Rest" then

   local ret = {}
   ret.id = cid
   ret.cd = 6
   ret.eff = 0
   ret.check = 0
   ret.buff = spell
   ret.first = true
   
   doCondition2(ret)
	
elseif spell == "Sludge" then 

        --alterado v1.7
		local function doSludgeFall(cid, frompos, target)
			if not isCreature(target) or not isCreature(cid) then return true end
		local pos = getThingPosWithDebug(target)
		local ry = math.abs(frompos.y - pos.y)
		doSendDistanceShoot(frompos, getThingPosWithDebug(target), 6)
		addEvent(doDanoInTargetWithDelay, ry * 11, cid, target, POISONDAMAGE, min, max, 237) --alterado v1.7
		end

		local function doSludgeUp(cid, target)
			if not isCreature(target) or not isCreature(cid) then return true end
		local pos = getThingPosWithDebug(target)
		local mps = getThingPosWithDebug(cid)
		local xrg = math.floor((pos.x - mps.x) / 2)
		local topos = mps
		topos.x = topos.x + xrg
		local rd =  7
		topos.y = topos.y - rd
		doSendDistanceShoot(getThingPosWithDebug(cid), topos, 24)
		addEvent(doSludgeFall, rd * 49, cid, topos, target)
		end		

    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 350, cid, 3644587, -1) 
	for thnds = 1, 2 do
		addEvent(doSludgeUp, thnds * 155, cid, target)
	end                                               --alterado v1.5

elseif spell == "Mud Bomb" then

   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 6)  --alterado v1.8
   doDanoWithProtectWithDelay(cid, target, MUDBOMBDAMAGE, min, max, 116, bombWee2)

elseif spell == "Smog" then

    local pos = getThingPosWithDebug(cid)

	local function doSendAcid(cid, pos)
		if not isCreature(cid) then return true end
		doSendDistanceShoot(getThingPosWithDebug(cid), pos, 14)
		doSendMagicEffect(pos, 114)
	end
 
	for b = 1, 3 do
		for a = 1, 20 do
			local lugar = {x = pos.x + math.random(-4, 4), y = pos.y + math.random(-3, 3), z = pos.z}
			addEvent(doSendAcid, a * 75, cid, lugar)
		end
	end
	doDanoWithProtect(cid, POISONDAMAGE, pos, waterarea, -min, -max, 0) 
    
elseif spell == "Drill Run" or spell == "Megahorn" or spell == "Rock Blast" then

local damage = spell == "Megahorn" and BUGDAMAGE or ROCKDAMAGE
local eff = spell == "Megahorn" and 8 or 44 
local effD = spell == "Rock Blast" and 11 or 25                    
                --cid, effDist, effDano, areaEff, areaDano, element, min, max
doMoveInAreaMulti(cid, effD, eff, bullet, bulletDano, damage, min, max)

elseif spell == "Egg Bomb" then

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 12)
	doDanoWithProtectWithDelay(cid, target, NORMALDAMAGE, min, max, 5, crusher)
    
elseif spell == "Power Whip" then

    stopNow(cid, 200)           --alterado v1.6
    doCreatureSetLookDir(cid, 2)

	local effect = 0
	local pos = getThingPosWithDebug(cid)
	pos.x = pos.x + 1
	pos.y = pos.y + 1
	
    local effect = getSubName(cid, target) == "Tangela" and 213 or 229  --alterado v1.6.1

	doSendMagicEffect(pos, effect)
	doDanoWithProtect(cid, GRASSDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 0)
    
elseif spell == "Ominous Wind" then

        doMoveInArea2(cid, 226, epicenter, GHOSTDAMAGE, min, max, spell)
		
elseif spell == "Avalanche" then

       local eff = {176, 179, 176, 179, 176}
       local area = {psy1, psy2, psy3, psy4, psy5}

       setPlayerStorageValue(cid, 3644587, 1)
       addEvent(setPlayerStorageValue, 4*400, cid, 3644587, -1)
       for i = 0, 4 do
           addEvent(doMoveInArea2, i*400, cid, eff[i+1], area[i+1], ICEDAMAGE, min, max, spell)
       end
       
elseif spell == "Bubble Beam" then

local function sendBubbles(cid)
if not isCreature(cid) or not isCreature(target) then return true end
   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 2)
   doDanoInTargetWithDelay(cid, target, WATERDAMAGE, min, max, 68)  --alterado v1.7
end

sendBubbles(cid)
addEvent(sendBubbles, 250, cid) 

elseif  spell == "Swift" then

local function sendSwift(cid, target)
if not isCreature(cid) or not isCreature(target) then return true end
   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 32)
   doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 3)   --alterado v1.7
end

addEvent(sendSwift, 100, cid, target)
addEvent(sendSwift, 200, cid, target) 

elseif spell == "Spark" then
       
   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 32)
   doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 48)    --alterado v1.7
   

   
elseif  spell == "Mimic Wall" then

local p = getThingPosWithDebug(cid)
local dirr = getCreatureLookDir(cid)

if dirr == 0 or dirr == 2 then
   item = 11439
else
   item = 11440
end

local wall = {
[0] = {{x = p.x, y = p.y-1, z = p.z}, {x = p.x+1, y = p.y-1, z = p.z}, {x = p.x-1, y = p.y-1, z = p.z}},
[2] = {{x = p.x, y = p.y+1, z = p.z}, {x = p.x+1, y = p.y+1, z = p.z}, {x = p.x-1, y = p.y+1, z = p.z}},
[1] = {{x = p.x+1, y = p.y, z = p.z}, {x = p.x+1, y = p.y+1, z = p.z}, {x = p.x+1, y = p.y-1, z = p.z}},
[3] = {{x = p.x-1, y = p.y, z = p.z}, {x = p.x-1, y = p.y+1, z = p.z}, {x = p.x-1, y = p.y-1, z = p.z}},
}

function removeAllActionIDs(pos, onlyOne)
if onlyOne then
    local thing1 = {x=pos.x,y=pos.y,z=pos.z,stackpos=0}
    local tile1 = getTileThingWithProtect(thing1).uid
    doSetItemActionId(tile1, 0)
end  
n = 0
for i = 1, #pos do
    n = n + 1
    thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=0}
    local tile = getTileThingWithProtect(thing).uid
    doSetItemActionId(tile, 0)
end
end   


for i = 1, 3 do
    if wall[dirr] then
       local t = wall[dirr]
       if hasTile(t[i]) and canWalkOnPos2(t[i], true, true, true, true, false) then  --alterado v1.6
          doCreateItem(item, 1, t[i])
          --
          local Tile = getTileThingWithProtect({x=t[i].x,y=t[i].y,z=t[i].z,stackpos=0})
          doSetItemActionId(Tile.uid, 88072)
          addEvent(removeAllActionIDs, 15000, t[i], true)
          --
          addEvent(doRemoveItemFromPos, 15000, t[i], item, 1)
       end
    end
end 

local pos = getPosfromArea(cid, wall_1)
local pos2 = getPosfromArea(cid, wall_2)

if hasTile({x=p.x,y=p.y,z=p.z,stackpos=0}) then 
   tile0 = getTileThingWithProtect({x=p.x,y=p.y,z=p.z,stackpos=0}).uid
end
doSetItemActionId(tile0, 88070)
addEvent(removeAllActionIDs, 15000, p, true)

n = 0

while n < #pos do
   if not isCreature(cid) then return true end 
      n = n+1
      local tile1 = getTileThingWithProtect({x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=0}).uid
      ---
      local tile2 = getTileThingWithProtect({x=pos2[n].x,y=pos2[n].y,z=pos2[n].z,stackpos=0}).uid
      
      doSetItemActionId(tile1, 88071)
      doSetItemActionId(tile2, 88070)
end
addEvent(removeAllActionIDs, 15000, pos)
addEvent(removeAllActionIDs, 15000, pos2)   

elseif spell == "Blizzard" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 43
ret.check = 0
ret.first = true
ret.cond = "Slow"

local function doFall(cid)
for rocks = 1, 42 do
    addEvent(fall, rocks*35, cid, master, ICEDAMAGE, 28, 52)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, 28)
end                                         --alterado v1.4
addEvent(doFall, 450, cid)
addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, ICEDAMAGE, min, max, spell, ret)

elseif spell == "Meteor Mash" then

local effD = 26
local eff = 99
local master = isSummon(cid) and getCreatureMaster(cid) or cid

local function doFall(cid)
for rocks = 5, 42 do
    addEvent(fall, rocks*35, cid, master, STEELDAMAGE, effD, eff)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, effD)
end
addEvent(doFall, 450, cid)
addEvent(doDanoWithProtect, 1400, cid, STEELDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)





elseif spell == "Dazzling Gleam" then

local master = getCreatureMaster(cid) or 0
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 147
ret.check = 0
ret.spell = spell
ret.cond = "Stun"
    
for rocks = 1, 62 do
    addEvent(fall, rocks*35, cid, master, NORMALDAMAGE, -1, 147)
end

addEvent(doMoveInArea2, 500, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret) 

elseif spell == "Fire Punch" then

	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
    doSendMagicEffect(getThingPosWithDebug(target), 112)
    doDanoInTargetWithDelay(cid, target, FIREDAMAGE, min, max, 35) --alterado v1.7
    
elseif spell == "Guillotine" then

doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 146)

elseif spell ==  "Hyper Beam" then  --alterado v1.7 \/

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)
local t = {
[0] = {149, {x=p.x+1, y=p.y-1, z=p.z}},
[1] = {150, {x=p.x+6, y=p.y+1, z=p.z}},   
[2] = {149, {x=p.x+1, y=p.y+6, z=p.z}},
[3] = {150, {x=p.x-1, y=p.y+1, z=p.z}},  
}

doMoveInArea2(cid, 0, triplo6, NORMALDAMAGE, min, max, spell)
doSendMagicEffect(t[a][2], t[a][1])
    
elseif spell ==  "Signal Beam" then  --alterado v1.7 \/

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)
local t = {
[0] = {262, {x=p.x+1, y=p.y-1, z=p.z}},
[1] = {263, {x=p.x+6, y=p.y+1, z=p.z}},   
[2] = {264, {x=p.x+1, y=p.y+6, z=p.z}},
[3] = {265, {x=p.x-1, y=p.y+1, z=p.z}},  
}

doMoveInArea2(cid, 0, triplo6, BUGDAMAGE, min, max, spell)
doSendMagicEffect(t[a][2], t[a][1])

elseif spell == "Thrash" then

                --cid, effDist, effDano, areaEff, areaDano, element, min, max
doMoveInAreaMulti(cid, 10, 111, bullet, bulletDano, NORMALDAMAGE, min, max) 

elseif spell == "Splash" or tonumber(spell) == 7 then

	doAreaCombatHealth(cid, WATERDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 255)
	doSendMagicEffect(getThingPosWithDebug(cid), 53)
    
elseif spell == "Dragon Breath" then     

    doMoveInArea2(cid, 143, db1, DRAGONDAMAGE, min, max, spell) 
       
elseif spell == "Muddy Water" then

local pos = getThingPosWithDebug(cid)

doMoveInArea2(cid, 55, doSurf1, WATERDAMAGE, 0, 0, spell)
addEvent(doDanoWithProtect, math.random(100, 400), cid, WATERDAMAGE, pos, doSurf2, -min, -max, 0)

elseif spell == "Venom Drench" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 34
ret.check = 0
ret.spell = spell
ret.cond = "Miss"

   doMoveInArea2(cid, 114, muddy, POISONDAMAGE, min, max, spell, ret)
       
elseif spell == "Thunder Fang" then

	doSendMagicEffect(getThingPosWithDebug(target), 146)
    doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 48)  --alterado v1.7
    
elseif spell == "Zap Cannon" then

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)
local t = {
[0] = {73, {x=p.x, y=p.y-1, z=p.z}},
[1] = {74, {x=p.x+6, y=p.y, z=p.z}},      --alterado v1.8
[2] = {75, {x=p.x, y=p.y+6, z=p.z}},
[3] = {76, {x=p.x-1, y=p.y, z=p.z}},
}

doMoveInArea2(cid, 0, triplo6, ELECTRICDAMAGE, min, max, spell)
doMoveInArea2(cid, 177, reto6, ELECTRICDAMAGE, 0, 0, "Zap Cannon Eff")
doSendMagicEffect(t[a][2], t[a][1])
    
elseif spell == "Charge Beam" then

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)
local t = {
[0] = {73, {x=p.x, y=p.y-1, z=p.z}},
[1] = {74, {x=p.x+6, y=p.y, z=p.z}},      --alterado v1.8
[2] = {75, {x=p.x, y=p.y+6, z=p.z}},
[3] = {76, {x=p.x-1, y=p.y, z=p.z}},
}

doMoveInArea2(cid, 0, triplo6, ELECTRICDAMAGE, min, max, spell)
doSendMagicEffect(t[a][2], t[a][1])
	
elseif spell == "Sacred Fire" then

     doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 3)
     doDanoWithProtectWithDelay(cid, target, SACREDDAMAGE, min, max, 143, sacred)    --alterado v1.6
            
elseif spell == "Blaze Kick" then

doMoveInArea2(cid, 6, blaze, FIREDAMAGE, min, max, spell) 
addEvent(doMoveInArea2, 200, cid, 6, kick, FIREDAMAGE, min, max, spell) 

elseif spell == "Cross Chop" then

doMoveInArea2(cid, 223, blaze, FIGHTINGDAMAGE, min, max, spell) 
addEvent(doMoveInArea2, 200, cid, 99, kick, FIGHTINGDAMAGE, min, max, spell) 

elseif spell == "Flame Wheel" then

   doDanoWithProtect(cid, FIREDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 124)
   
elseif spell == "Ancient Power" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area, eff)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, ROCKDAMAGE, area, 0, 0, 0, eff)
   doAreaCombatHealth(cid, ROCKDAMAGE, area, whirl3, -min, -max, 208)
end
end

for a = 0, 4 do

local t = {
[0] = {157, {x=p.x, y=p.y-(a+1), z=p.z}},           --alterado v1.4
[1] = {157, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {157, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {157, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 300*a, cid, t[d][2], t[d][1])
end
    
elseif spell == "Twister" then

doMoveInAreaMulti(cid, 36, 125, bullet, bulletDano, DRAGONDAMAGE, min, max)

elseif spell == "Rolling Kick" then

doMoveInAreaMulti(cid, 39, 113, multi, multiDano, FIGHTINGDAMAGE, min, max)

elseif spell == "Brick Break" then

doMoveInAreaMulti(cid, 39, 112, multi, multiDano, FIGHTINGDAMAGE, min, max) 

elseif spell == "Squisky Licking" then 
                                                      
local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 0
ret.spell = spell
ret.cond = "Stun"

local areas = {SL1, SL2, SL3, SL4}

for i = 0, 3 do
    addEvent(doMoveInArea2, i*200, cid, 145, areas[i+1], NORMALDAMAGE, min, max, spell, ret)
end

elseif spell == "Lick" then

local ret = {}
ret.id = target
ret.cd = 9
ret.check = getPlayerStorageValue(target, conds["Stun"])
ret.eff = 0
ret.spell = spell
ret.cond = "Stun"

   doSendMagicEffect(getThingPosWithDebug(target), 145)      --alterado v1.4!
   addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)

elseif spell == "Bonemerang" then

   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 7)
   doDanoInTargetWithDelay(cid, target, GROUNDDAMAGE, min, max, 227)  --alterado v1.7
   addEvent(doSendDistanceShoot, 250, getThingPosWithDebug(target), getThingPosWithDebug(cid), 7)

elseif spell == "Bone Club" then

  doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 7)
  doDanoInTargetWithDelay(cid, target, GROUNDDAMAGE, min, max, 118)  --alterado v1.7
	
elseif spell == "Bone Slash" then

local function sendStickEff(cid, dir)
    if not isCreature(cid) then return true end
       doAreaCombatHealth(cid, GROUNDDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 227)
	end

	local function doStick(cid)
	if not isCreature(cid) then return true end
	local t = {
	      [1] = SOUTHWEST,
	      [2] = SOUTH,
	      [3] = SOUTHEAST,
	      [4] = EAST,
	      [5] = NORTHEAST,
	      [6] = NORTH,
	      [7] = NORTHWEST,
	      [8] = WEST,
	      [9] = SOUTHWEST,
		}
		for a = 1, 9 do
            addEvent(sendStickEff, a * 140, cid, t[a])
		end
	end

	doStick(cid, false, cid)
                                                                            --alterado v1.4
elseif spell == "Furious Legs" or spell == "Ultimate Champion" or spell == "Fighter Spirit" then

   local ret = {}
   ret.id = cid
   ret.cd = 15
   ret.eff = 13
   ret.check = 0
   ret.buff = spell
   ret.first = true
   
   doCondition2(ret)      
            
elseif spell == "Gunk Shot" then                

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

local master = isSummon(cid) and getCreatureMaster(cid) or cid
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 34
ret.check = 0
ret.spell = spell
ret.cond = "Miss"   

function sendAtk(cid, area, eff)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end 
   doAreaCombatHealth(cid, POISONDAMAGE, area, 0, 0, 0, eff)
   doAreaCombatHealth(cid, POISONDAMAGE, area, whirl3, -min, -max, 114)
end
end

for a = 0, 4 do

local t = {
[0] = {114, {x=p.x, y=p.y-(a+1), z=p.z}},           --alterado v1.4
[1] = {114, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {114, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {114, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 300*a, cid, t[d][2], t[d][1])
end
	
elseif spell == "Sludge Wave" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 34
ret.check = 0
ret.spell = spell
ret.cond = "Miss"

local function doFall(cid)
for rocks = 1, 42 do
    addEvent(fall, rocks*35, cid, master, POISONDAMAGE, 24, 237)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, 24)
end         
                               
addEvent(doFall, 450, cid)
addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, POISONDAMAGE, min, max, spell, ret)  

elseif spell == "Shadow Sneak" then

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 6)

    local function doDamageWithDelay(cid, target)
    if not isCreature(cid) or not isCreature(target) then return true end
    if isSleeping(cid) then return false end
    if getPlayerStorageValue(cid, conds["Spite"]) >= 1 then return true end
	   doAreaCombatHealth(cid, ghostDmg, getThingPosWithDebug(target), 0, -min, -max, 255)
	   local pos = getThingPosWithDebug(target)
	   pos.x = pos.x + 1
	   doSendMagicEffect(pos, 228)
	end

	addEvent(doDamageWithDelay, 100, cid, target)
	
elseif spell == "Shadow Ball" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area, eff)
if isCreature(cid) then 
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, ghostDmg, area, 0, 0, 0, eff)    --alterado v1.4
   doAreaCombatHealth(cid, ghostDmg, area, whirl3, -min, -max, 255)     --alterado v1.4
end
end

for a = 0, 4 do

local t = {
[0] = {174, {x=p.x, y=p.y-(a+1), z=p.z}},           --alterado v1.4
[1] = {174, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {174, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {174, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 370*a, cid, t[d][2], t[d][1])
end

	elseif spell == "Tailwind" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area, eff)
if isCreature(cid) then 
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, normalDmg, area, 0, 0, 0, eff)    --alterado v1.4
   doAreaCombatHealth(cid, normalDmg, area, whirl3, -min, -max, 255)     --alterado v1.4
end
end

for a = 0, 4 do

local t = {
[0] = {78, {x=p.x, y=p.y-(a+1), z=p.z}},           --alterado v1.4
[1] = {78, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {78, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {78, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 370*a, cid, t[d][2], t[d][1])
end

	
elseif spell == "Electro Ball" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area, eff)
if isCreature(cid) then 
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, electricDmg, area, 0, 0, 0, eff)    --alterado v1.4
   doAreaCombatHealth(cid, electricDmg, area, whirl3, -min, -max, 255)     --alterado v1.4
end
end

for a = 0, 4 do

local t = {
[0] = {171, {x=p.x, y=p.y-(a+1), z=p.z}},           --alterado v1.4
[1] = {171, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {171, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {171, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 370*a, cid, t[d][2], t[d][1])
end


elseif spell == "Shadow Punch" then

	local pos = getThingPosWithDebug(target)
	doSendMagicEffect(pos, 112)

		local function doPunch(cid, target)
			if not isCreature(cid) or not isCreature(target) then return true end
		       doAreaCombatHealth(cid, ghostDmg, getThingPosWithDebug(target), 0, -min, -max, 255)
		       pos.x = pos.x + 1
		       doSendMagicEffect(pos, 140)
        end

	addEvent(doPunch, 200, cid, target)


elseif spell == "Brick Beak" then

local ret = {}
ret.id = 0
ret.cd = 9                        
ret.eff = 88
ret.check = 0
ret.first = true
ret.cond = "Paralyze"
ret.id = 0
ret.cd = 9                        
ret.eff = 88
ret.check = 0
ret.first = true
ret.cond = "Silence"

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)
local t = {
[0] = {90, {x=p.x+1, y=p.y-1, z=p.z}},
[1] = {90, {x=p.x+2, y=p.y+1, z=p.z}},   
[2] = {90, {x=p.x+1, y=p.y+2, z=p.z}},
[3] = {90, {x=p.x-1, y=p.y+1, z=p.z}},  
}

doMoveInArea2(cid, 0, BrickBeak, FIGHTINGDAMAGE, min, max, spell, ret)
doSendMagicEffect(t[a][2], t[a][1])


elseif spell == "Hex" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid

local function doFall(cid)
for rocks = 1, 42 do   --62
    addEvent(fall, rocks*35, cid, master, ghostDmg, 18, 140)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, 18)
end
addEvent(doFall, 450, cid)
addEvent(doMoveInArea2, 1400, cid, 2, BigArea2, ghostDmg, min, max, spell)

elseif spell == "Invisible" then

doDisapear(cid)
doSendMagicEffect(getThingPosWithDebug(cid), 134)
if isMonster(cid) then
  local pos = getThingPosWithDebug(cid)                           --alterei!
  doTeleportThing(cid, {x=4, y=3, z=10}, false)
  doTeleportThing(cid, pos, false)
end
addEvent(doAppear, 4000, cid)
        
elseif spell == "Nightmare" then

    if not isSleeping(target) then
		doSendMagicEffect(getThingPosWithDebug(target), 3)
		doSendAnimatedText(getThingPosWithDebug(target), "O POKEMON PRECISA ESTAR DORMINDO", 155)
	return true
	end
	
doDanoWithProtectWithDelay(cid, target, ghostDmg, -min, -max, 438)  

elseif spell == "Dream Eater" then

	if not isSleeping(target) then
		doSendMagicEffect(getThingPosWithDebug(target), 3)
		doSendAnimatedText(getThingPosWithDebug(target), "O POKEMON PRECISA ESTAR DORMINDO", 155)
	return true
	end
	                                                          --alterado v1.6
    setPlayerStorageValue(cid, 95487, 1)
    doSendMagicEffect(getThingPosWithDebug(cid), 132)
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
    doDanoWithProtectWithDelay(cid, target, psyDmg, -min, -max, 438)

elseif spell == "Elemental Hands" then

if getCreatureOutfit(cid).lookType == 1301 then
print("Error occurred with move 'Elemental Hands', outfit of hitmonchan is wrong")
doPlayerSendTextMessage(getCreatureMaster(cid), MESSAGE_STATUS_CONSOLE_BLUE, "A error are ocurred... A msg is sent to gamemasters!") 
return true
end        --proteçao pra n usar o move com o shiny hitmonchan com outfit diferente da do elite monchan do PO...

local e = getCreatureMaster(cid)
local name = getItemAttribute(getPlayerSlotItem(e, 8).uid, "poke")
local hands = getItemAttribute(getPlayerSlotItem(e, 8).uid, "hands")

       if hands == 4 then
       doItemSetAttribute(getPlayerSlotItem(e, 8).uid, "hands", 0)
       doSendMagicEffect(getThingPosWithDebug(cid), hitmonchans[name][0].eff)
       doSetCreatureOutfit(cid, {lookType = hitmonchans[name][0].out}, -1)
       else
       doItemSetAttribute(getPlayerSlotItem(e, 8).uid, "hands", hands+1)
       doSendMagicEffect(getThingPosWithDebug(cid), hitmonchans[name][hands+1].eff)
       doSetCreatureOutfit(cid, {lookType = hitmonchans[name][hands+1].out}, -1)
       end
       
elseif spell == "Crabhammer" then

doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 225)

elseif spell == "Divine Punishment" then

local roardirections = {            
[NORTH] = {SOUTH},
[SOUTH] = {NORTH},
[WEST] = {EAST},
[EAST] = {WEST}}

local function divineBack(cid)
if not isCreature(cid) then return true end
local uid = checkAreaUid(getCreaturePosition(cid), check, 1, 1)
      for _,pid in pairs(uid) do
          dirrr = getCreatureDirectionToTarget(pid, cid)
          delay = getNextStepDelay(pid, 0)
          if isSummon(cid) and (isMonster(pid) or (isSummon(pid) and canAttackOther(cid, pid) == "Can") or (isPlayer(pid) and canAttackOther(cid, pid) == "Can")) and pid ~= cid then
             setPlayerStorageValue(pid, 654878, 1)
             doChangeSpeed(pid, -getCreatureSpeed(pid))
             doChangeSpeed(pid, 100)
		     doPushCreature(pid, roardirections[dirrr][1], 1, 0)
		     doChangeSpeed(pid, -getCreatureSpeed(pid))
             addEvent(setPlayerStorageValue, 6450, pid, 654878, -1)
             addEvent(doRegainSpeed, 6450, pid)
           elseif isMonster(cid) and (isSummon(pid) or (isPlayer(pid) and #getCreatureSummons(pid) <= 0)) and pid ~= cid then
             setPlayerStorageValue(pid, 654878, 1)
             doChangeSpeed(pid, -getCreatureSpeed(pid))
		     doChangeSpeed(pid, 100)
		     doPushCreature(pid, roardirections[dirrr][1], 1, 0)
		     doChangeSpeed(pid, -getCreatureSpeed(pid))
             addEvent(doRegainSpeed, 6450, pid)
             addEvent(setPlayerStorageValue, 6450, pid, 654878, -1)
           end
       end    
end

local function doDivine(cid, min, max, spell, rounds, area)
if not isCreature(cid) then return true end
local ret = {}
ret.id = 0
ret.check = 0
ret.cd = rounds
ret.cond = "Confusion"
       
for i = 1, 9 do
    addEvent(doMoveInArea2, i*500, cid, 233, area[i], psyDmg, min, max, spell, ret)
end
end
       
       local rounds = math.random(9, 12)
       local area = {punish1, punish2, punish3, punish1, punish2, punish3, punish1, punish2, punish3}
       
       local posi = getThingPosWithDebug(cid) 
       posi.x = posi.x+1
       posi.y = posi.y+1

       setPlayerStorageValue(cid, 2365487, 1)
       addEvent(setPlayerStorageValue, 6450, cid, 2365487, -1) --alterado v1.4
       doDisapear(cid)
       doChangeSpeed(cid, -getCreatureSpeed(cid))
       doSendMagicEffect(posi, 247)   
       addEvent(doAppear, 6450, cid)
       addEvent(doRegainSpeed, 6450, cid)
       
       local uid = checkAreaUid(getCreaturePosition(cid), check, 1, 1)
             for _,pid in pairs(uid) do
                 if isSummon(cid) and (isMonster(pid) or (isSummon(pid) and canAttackOther(cid, pid) == "Can") or (isPlayer(pid) and canAttackOther(cid, pid) == "Can")) and pid ~= cid then
                    doChangeSpeed(pid, -getCreatureSpeed(pid))
                 elseif isMonster(cid) and (isSummon(pid) or (isPlayer(pid) and #getCreatureSummons(pid) <= 0)) and pid ~= cid then
                    doChangeSpeed(pid, -getCreatureSpeed(pid))
                 end
             end
                        
       addEvent(divineBack, 2100, cid)
       addEvent(doDivine, 2200, cid, min, max, spell, rounds, area)
       
elseif isInArray({"Psychic Sight", "Camouflage", "Acid Armor", "Iron Defense", "Minimize"}, spell) then

   local ret = {}
   ret.id = cid
   ret.cd = 10
   ret.eff = 0
   ret.check = 0
   ret.buff = spell
   ret.first = true
   
   doCondition2(ret)    	

elseif spell == "Payback" then

doMoveInArea2(cid, 222, db1, DARKDAMAGE, min, max, spell)

elseif spell == "Confuse Ray" then

	local rounds = math.random(4, 7)
	rounds = rounds + math.floor(getPokemonLevel(cid) / 35)
	
    local ret = {}
	ret.id = target
	ret.cd = rounds
	ret.check = getPlayerStorageValue(target, conds["Confusion"])
	ret.cond = "Confusion"

    posi = getThingPosWithDebug(target)
         posi.y = posi.y+1
    ---
	doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
	addEvent(doSendMagicEffect, 100, posi, 222)
    addEvent(doMoveDano2, 100, cid, target, GHOSTDAMAGE, -min, -max, ret, spell)

elseif spell == "Eruption" then


   local ret = {}
   ret.id = cid
   ret.cd = 15
   ret.eff = 14
   ret.check = 0
   ret.buff = spell
   ret.first = true
   
   doCondition2(ret)
    
pos = getThingPosWithDebug(cid)
    pos.x = pos.x+1
    pos.y = pos.y+1
    
atk = {
["Eruption"] = {241, FIREDAMAGE},
}

stopNow(cid, 1000)
doSendMagicEffect(pos, atk[spell][1])
doMoveInArea2(cid, 0, bombWee1, atk[spell][2], min, max, spell) 

local function doFall(cid)
for rocks = 1, 42 do --62
    addEvent(fall, rocks*35, cid, master, FIREDAMAGE, 3, 101)
end
end
---
local function doRain(cid)

---
setPlayerStorageValue(cid, 253, 1)  --Meditate
---
doMoveInArea2(cid, 0, confusion, FIREDAMAGE, 0, 0, spell, ret)
end
---
addEvent(doFall, 200, cid)
addEvent(doRain, 1000, cid)

elseif spell == "Moonblast" then

doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 20)
doDanoInTargetWithDelay(cid, target, FAIRYDAMAGE, -min, -max, 242) --alterado v1.7

elseif spell == "Draco Meteor" then


local master = isSummon(cid) and getCreatureMaster(cid) or cid
------------
local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 34
---
local function doFall(cid)
for rocks = 1, 42 do --62
    addEvent(fall, rocks*35, cid, master, DRAGONDAMAGE, 3, 236)
end
end
---
local function doRain(cid)

---
setPlayerStorageValue(cid, 253, 1)  --Meditate
---
doMoveInArea2(cid, 0, confusion, DRAGONDAMAGE, 0, 0, spell, ret)
end
---
addEvent(doFall, 200, cid)
addEvent(doRain, 1000, cid)

addEvent(doDanoWithProtect, 1400, cid, DRAGONDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)


elseif spell == "Outrage" then

local effD = 5
local eff = 248
local master = isSummon(cid) and getCreatureMaster(cid) or cid

local function doFall(cid)
for rocks = 5, 42 do
    addEvent(fall, rocks*35, cid, master, DRAGONDAMAGE, effD, eff)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, effD)
end
addEvent(doFall, 450, cid)
addEvent(doDanoWithProtect, 1400, cid, DRAGONDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)

elseif spell == "Lava Plume" then

local effD = 6
local eff = 34
local master = isSummon(cid) and getCreatureMaster(cid) or cid

local function doFall(cid)
for rocks = 5, 42 do
    addEvent(fall, rocks*35, cid, master, FIREDAMAGE, effD, eff)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, effD)
end
addEvent(doFall, 450, cid)
addEvent(doDanoWithProtect, 1400, cid, FIREDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)

elseif spell == "Dragon Pulse" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, DRAGONDAMAGE, area, pulse2, -min, -max, 208)
end
end

for a = 0, 3 do

local t = {
[0] = {250, {x=p.x, y=p.y-(a+1), z=p.z}},
[1] = {250, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {250, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {250, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 300*a, cid, t[d][2])
addEvent(doDanoWithProtect, 400*a, cid, DRAGONDAMAGE, t[d][2], pulse2, 0, 0, 208)
addEvent(doDanoWithProtect, 400*a, cid, DRAGONDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
end

elseif spell == "Silver Wind" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, BUGDAMAGE, area, pulse2, -min, -max, 78)
end
end

for a = 0, 3 do

local t = {
[0] = {125, {x=p.x, y=p.y-(a+1), z=p.z}},
[1] = {125, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {125, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {125, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 300*a, cid, t[d][2])
addEvent(doDanoWithProtect, 400*a, cid, BUGDAMAGE, t[d][2], pulse2, 0, 0, 78)
addEvent(doDanoWithProtect, 400*a, cid, BUGDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
end

elseif spell == "Blast Burn" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, FIREDAMAGE, area, pulse1, -min, -max, 209)
end
end

for a = 0, 3 do

local t = {
[0] = {209, {x=p.x, y=p.y-(a+1), z=p.z}},
[1] = {209, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {209, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {209, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 300*a, cid, t[d][2])
addEvent(doDanoWithProtect, 400*a, cid, FIREDAMAGE, t[d][2], pulse1, 0, 0, 239)
addEvent(doDanoWithProtect, 400*a, cid, FIREDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
end

elseif spell == "Metal Sound" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, STEELDAMAGE, area, pulse2, -min, -max, 11)
end
end

for a = 0, 11 do

local t = {
[0] = {11, {x=p.x, y=p.y-(a+1), z=p.z}},
[1] = {11, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {11, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {11, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 300*a, cid, t[d][2])
addEvent(doDanoWithProtect, 400*a, cid, STEELDAMAGE, t[d][2], pulse2, 0, 0, 11)
addEvent(doDanoWithProtect, 400*a, cid, STEELDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
end

elseif spell == "Psyshock" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, PSYCHICDAMAGE, area, pulse1, -min, -max, 238)
end
end

for a = 0, 3 do

local t = {
[0] = {238, {x=p.x, y=p.y-(a+1), z=p.z}},
[1] = {238, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {238, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {238, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 300*a, cid, t[d][2])
addEvent(doDanoWithProtect, 400*a, cid, PSYCHICDAMAGE, t[d][2], pulse1, 0, 0, 137)
addEvent(doDanoWithProtect, 400*a, cid, PSYCHICDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
end

elseif spell == "SmokeScreen" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 34
ret.check = 0
ret.spell = spell
ret.cond = "Miss"

local function smoke(cid)
if not isCreature(cid) then return true end
if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
   doMoveInArea2(cid, 34, confusion, NORMALDAMAGE, 0, 0, spell, ret)
end

setPlayerStorageValue(cid, 3644587, 1)
addEvent(setPlayerStorageValue, 1000, cid, 3644587, -1) 
for i = 0, 2 do
    addEvent(smoke, i*500, cid)                               
end

elseif spell == "Feint Attack" or spell == "Sucker Punch" then  --alterado v1.5

   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
   doDanoInTargetWithDelay(cid, target, DARKDAMAGE, min, max, 222)  --alterado v1.7

elseif spell == "Assurance" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area1, area2, eff)
if isCreature(cid) then
   if not isSightClear(p, area1, false) then return true end
   if not isSightClear(p, area2, false) then return true end
   doAreaCombatHealth(cid, DARKDAMAGE, area1, 0, 0, 0, eff)
   doAreaCombatHealth(cid, DARKDAMAGE, area2, whirl3, -min, -max, 0)
end
end

for a = 0, 3 do

local t = {
[0] = {230, {x=p.x+1, y=p.y-(a+1), z=p.z}, {x=p.x, y=p.y-(a+1), z=p.z}},
[1] = {226, {x=p.x+(a+2), y=p.y+1, z=p.z}, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {235, {x=p.x+1, y=p.y+(a+1), z=p.z}, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {231, {x=p.x-(a+1), y=p.y+1, z=p.z}, {x=p.x-(a+1), y=p.y, z=p.z}}
}   
addEvent(sendAtk, 300*a, cid, t[d][2], t[d][3], t[d][1])
end

elseif spell == "Scary Face" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 0
ret.spell = spell
ret.cond = "Stun"


local p = getThingPosWithDebug(cid)
doSendMagicEffect({x=p.x+1, y=p.y+1, z=p.z}, 139)
doMoveInArea2(cid, 0, electro, NORMALDAMAGE, 0, 0, spell, ret)

elseif spell == "Surf" then

local pos = getThingPosWithDebug(cid)

doMoveInArea2(cid, 246, doSurf1, WATERDAMAGE, 0, 0, spell)
addEvent(doDanoWithProtect, math.random(100, 400), cid, WATERDAMAGE, pos, doSurf2, -min, -max, 0)

elseif spell == "Sunny Day" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 39
ret.cond = "Silence"
----
local p = getThingPosWithDebug(cid)
doSendMagicEffect({x=p.x+1, y=p.y, z=p.z}, 181)
---
if isSummon(cid) then 
   doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
end
doCureStatus(cid, "all")
setPlayerStorageValue(cid, 253, 1)  --Meditate
doMoveInArea2(cid, 0, electro, NORMALDAMAGE, 0, 0, spell, ret)

elseif spell == "Miracle Eye" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 136
ret.cond = "Silence"
----
local p = getThingPosWithDebug(cid)
doSendMagicEffect({x=p.x+1, y=p.y, z=p.z}, 222)
---
if isSummon(cid) then 
   doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
end
doCureStatus(cid, "all")
setPlayerStorageValue(cid, 253, 1)  --Meditate
doMoveInArea2(cid, 0, electro, DARKDAMAGE, 0, 0, spell, ret)

elseif spell == "Taunt" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 136
ret.cond = "Silence"
----
local p = getThingPosWithDebug(cid)
doSendMagicEffect({x=p.x+1, y=p.y, z=p.z}, 222)
---
if isSummon(cid) then 
   doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
end
doCureStatus(cid, "all")
setPlayerStorageValue(cid, 253, 1)  --Meditate
doMoveInArea2(cid, 0, electro, DARKDAMAGE, 0, 0, spell, ret)




elseif isInArray({"Pursuit", "ExtremeSpeed", "U-Turn", "Shell Attack", "Brave Bird", "Fly"}, spell) then

local atk = {
["Pursuit"] = {17, DARKDAMAGE},
["ExtremeSpeed"] = {50, NORMALDAMAGE, 51},
["Brave Bird"] = {36, FLYINGDAMAGE, 36},
["Fly"] = {36, FLYINGDAMAGE, 36},
["U-Turn"] = {19, BUGDAMAGE},
["Shell Attack"] = {45, BUGDAMAGE}      --alterado v1.5
}

local pos = getThingPosWithDebug(cid)
local p = getThingPosWithDebug(target)
local newPos = getClosestFreeTile(target, p)

local eff = getSubName(cid, target) == "Shiny Arcanine" and atk[spell][3] or atk[spell][1] --alterado v1.6.1

local damage = atk[spell][2]
-----------
doDisapear(cid)
doChangeSpeed(cid, -getCreatureSpeed(cid))
-----------
addEvent(doSendMagicEffect, 300, pos, 211)
addEvent(doSendDistanceShoot, 400, pos, p, eff)
addEvent(doSendDistanceShoot, 400, newPos, p, eff)
addEvent(doDanoInTarget, 400, cid, target, damage, -min, -max, 0) --alterado v1.7
addEvent(doSendDistanceShoot, 800, p, pos, eff)
addEvent(doSendMagicEffect, 850, pos, 211)
addEvent(doRegainSpeed, 1000, cid)
addEvent(doAppear, 1000, cid)


elseif spell == "Stampade" then

local master = getCreatureMaster(cid) or 0
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 0
ret.check = 0
ret.spell = spell
ret.cond = "Stun"
    
for rocks = 1, 42 do
    addEvent(fall, rocks*35, cid, master, NORMALDAMAGE, -1, 24)
end

addEvent(doMoveInArea2, 500, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret) 

elseif spell == "Stampage" then

local master = getCreatureMaster(cid) or 0
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 0
ret.check = 0
ret.spell = spell
ret.cond = "Stun"
    
for rocks = 1, 42 do
    addEvent(fall, rocks*35, cid, master, NORMALDAMAGE, -1, 194)
end

addEvent(doMoveInArea2, 500, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret)

elseif spell == "Barrier" then
if not isCreature(getCreatureTarget(cid)) then
local function sendAtk(cid)
if not isCreature(cid) then return true end
setPlayerStorageValue(cid, 9658783, -1) 
setPlayerStorageValue(cid, 734276, -1) 
end
setPlayerStorageValue(cid, 734276, 1) 
setPlayerStorageValue(cid, 9658783, 1)
pos = getThingPosWithDebug(cid)

local function doSendEff(cid)
if not isCreature(cid) then return true end
doSendMagicEffect({x = pos.x + 1, y = pos.y + 1, z = pos.z}, 135)
end
for i = 0, 7 do
 addEvent(doSendEff, i*1000, cid)
end
addEvent(sendAtk, 8000, cid)  
stopNow(cid, 8 * 800) 
else
local ret = {}
ret.id = target
ret.cd = 10
ret.check = getPlayerStorageValue(target, conds["Sleep"])
ret.eff = 0
ret.cond = "Sleep"

doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 24)
pos = getThingPosWithDebug(target)
addEvent(doMoveDano2, 150, cid, target, PSYCHICDAMAGE, 0, 0, ret, spell)
local function doSendEff(cid)
if not isCreature(cid) then return true end
doSendMagicEffect({x = pos.x + 1, y = pos.y + 1, z = pos.z}, 47)
end
for i = 0, 7 do
 addEvent(doSendEff, i*1000, cid)
end
stopNow(target, 8 * 800)
end

elseif spell == "Air Slash" then
local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, FLYINGDAMAGE, area, whirl3, -min, -max, 255)
end
end

for a = 0, 5 do

local t = {
[0] = {128, {x=p.x, y=p.y-(a+1), z=p.z}, {x=p.x+1, y=p.y-(a+1), z=p.z}},
[1] = {129, {x=p.x+(a+1), y=p.y, z=p.z}, {x=p.x+(a+2), y=p.y+1, z=p.z}},
[2] = {131, {x=p.x, y=p.y+(a+1), z=p.z}, {x=p.x+1, y=p.y+(a+2), z=p.z}},
[3] = {130, {x=p.x-(a+1), y=p.y, z=p.z}, {x=p.x-(a+1), y=p.y+1, z=p.z}}
}   
addEvent(doSendMagicEffect, 300*a, t[d][3], t[d][1])
addEvent(sendAtk, 300*a, cid, t[d][2])
end

elseif spell == "Belch" then

local area = {gale1, gale2, gale3, gale4, gale3, gale2, gale1}

for i = 0, 6 do
    addEvent(doMoveInArea2, i*400, cid, 138, area[i+1], POISONDAMAGE, min, max, spell)
end	

elseif spell == "Crunch" then

doMoveInArea2(cid, 146, Crunch1, DARKDAMAGE, min, max, spell)
addEvent(doMoveInArea2, 300, cid, 146, Crunch2, DARKDAMAGE, min, max, spell)

elseif spell == "Ice Fang" then

doTargetCombatHealth(cid, target, ICEDAMAGE, 0, 0, 146)
addEvent(doDanoWithProtect, 250, cid, ICEDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 17)

elseif spell == "Hurricane" then

local function hurricane(cid)
		if not isCreature(cid) then return true end
		if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
		if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
		   doMoveInArea2(cid, 42, bombWee1, FLYINGDAMAGE, min, max, spell)
	end

doSetCreatureOutfit(cid, {lookType = 1398}, 10000)

setPlayerStorageValue(cid, 3644587, 1)
addEvent(setPlayerStorageValue, 17*600, cid, 3644587, -1)    	
for i = 1, 17 do
    addEvent(hurricane, i*600, cid)                                --alterado v1.4
end

elseif spell == "Aromatherapy" or spell == "Emergency Call" then

eff = spell == "Aromatherapy" and 14 or 13

doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(cid), bombWee3, 0, 0, eff)
if isSummon(cid) then 
   doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
end
doCureStatus(cid, "all") 

local uid = checkAreaUid(getThingPosWithDebug(cid), confusion, 1, 1)
for _,pid in pairs(uid) do
    if isCreature(pid) then
       if ehMonstro(cid) and ehMonstro(pid) and pid ~= cid then
          doCureStatus(pid, "all")
       elseif isSummon(cid) and ((isSummon(pid) and canAttackOther(cid, pid) == "Cant") or (isPlayer(pid) and canAttackOther(cid, pid) == "Cant")) and pid ~= cid then
          if isSummon(pid) then 
             doCureBallStatus(getPlayerSlotItem(getCreatureMaster(pid), 8).uid, "all")
          end
          doCureStatus(pid, "all")
       end
    end
end

elseif spell == "Synthesis" or spell == "Roost" then

    local min = (getCreatureMaxHealth(cid) * 45) / 100
	local max = (getCreatureMaxHealth(cid) * 60) / 100
	
	local function doHealArea(cid, min, max)
    local amount = math.random(min, max)
    if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
        amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
    end
    if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
       doCreatureAddHealth(cid, amount)
       doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
    end
    end
    
	doSendMagicEffect(getThingPosWithDebug(cid), 132)
    doHealArea(cid, min, max) 
    
elseif spell == "Cotton Spore" then

    local ret = {}
    ret.id = 0
    ret.cd = 9
    ret.eff = 0
    ret.check = 0
    ret.spell = spell
    ret.cond = "Stun"
    
    doMoveInArea2(cid, 205, confusion, GRASSDAMAGE, 0, 0, spell, ret)

elseif spell == "Peck" then

sendDistanceShootWithProtect(cid, getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, min, max, 3)  --alterado v1.7

elseif spell == "Safeguard" then

doSendMagicEffect(getThingPosWithDebug(cid), 1)
if isSummon(cid) then 
   doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
end
doCureStatus(cid, "all") 

elseif spell == "Air Cutter" then

local p = getThingPosWithDebug(cid)

local t = {
{{128, {x = p.x+1, y = p.y-1, z = p.z}}, {16, {x = p.x+1, y = p.y-1, z = p.z}}},
{{129, {x = p.x+2, y = p.y+1, z = p.z}}, {221, {x = p.x+3, y = p.y+1, z = p.z}}},
{{131, {x = p.x+1, y = p.y+2, z = p.z}}, {223, {x = p.x+1, y = p.y+3, z = p.z}}},
{{130, {x = p.x-1, y = p.y+1, z = p.z}}, {243, {x = p.x-1, y = p.y+1, z = p.z}}},
}

for i = 1, 4 do
    doSendMagicEffect(t[i][2][2], t[i][2][1])
end
doDanoWithProtect(cid, FLYINGDAMAGE, getThingPosWithDebug(cid), airSlash, -min, -max, 0)    

for i = 1, 4 do
    addEvent(doSendMagicEffect, 400, t[i][1][2], t[i][1][1])
end
addEvent(doDanoWithProtect, 400, cid, FLYINGDAMAGE, getThingPosWithDebug(cid), bombWee2, -min, -max, 0)

elseif spell == "Feather Dance" then

local function doPulse(cid, eff)
if not isCreature(cid) or not isCreature(target) then return true end
   doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 9)
   doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, -min, -max, eff)   --alterado v1.7
end

   addEvent(doPulse, 0, cid, 137)                
   addEvent(doPulse, 100, cid, 137)

elseif spell == "Tackle" then

   doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 111)

elseif spell == "Giga Drain" then

local life = getCreatureHealth(target)

	doDanoWithProtect(cid, GRASSDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 45)
    
	local newlife = life - getCreatureHealth(target)

	doSendMagicEffect(getThingPosWithDebug(cid), 45)
	if newlife >= 1 then
	doCreatureAddHealth(cid, newlife)
	doSendAnimatedText(getThingPosWithDebug(cid), "+"..newlife.."", 32)
	end  
	

elseif spell == "Leech Life" then

local life = getCreatureHealth(target)

	doDanoWithProtect(cid, BUGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 14)
    
	local newlife = life - getCreatureHealth(target)

	doSendMagicEffect(getThingPosWithDebug(cid), 14)
	if newlife >= 1 then
	doCreatureAddHealth(cid, newlife)
	doSendAnimatedText(getThingPosWithDebug(cid), "+"..newlife.."", 32)
	end  
	
elseif spell == "Bug Fighter" then
	
   local ret = {}
   ret.id = cid
   ret.cd = 10
   ret.eff = 0
   ret.check = 0
   ret.buff = spell
   ret.first = true
   
   doCondition2(ret)	
	
elseif spell == "Metal Claw" then

   doDanoWithProtect(cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 160)	
	
elseif spell == "Power Gem" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, ROCKDAMAGE, area, pulse2, -min, -max, 255)
end
end

for a = 0, 3 do

local t = {
[0] = {34, {x=p.x, y=p.y-(a+1), z=p.z}},     
[1] = {34, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {34, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {34, {x=p.x-(a+1), y=p.y, z=p.z}}                            
}   
addEvent(sendAtk, 400*a, cid, t[d][2])
addEvent(doAreaCombatHealth, 400*a, cid, ROCKDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
addEvent(doAreaCombatHealth, 400*a, cid, ROCKDAMAGE, t[d][2], pulse1, 0, 0, 44)
end	
	
elseif spell == "Octazooka" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 34
ret.cond = "Silence"

doMoveInAreaMulti(cid, 6, 116, multi, multiDano, WATERDAMAGE, min, max)
doMoveInArea2(cid, 0, multiDano, WATERDAMAGE, 0, 0, spell, ret)
	
elseif spell == "Yawn" then

local ret = {}
ret.id = target
ret.cd = math.random(6, 9)
ret.check = getPlayerStorageValue(target, conds["Sleep"])
ret.first = true
ret.cond = "Sleep"

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 11)
    addEvent(doMoveDano2, 1500, cid, target, NORMALDAMAGE, 0, 0, ret, spell)

elseif spell == "Tongue Hook" then

sendDistanceShootWithProtect(cid, getThingPosWithDebug(cid), getThingPosWithDebug(target), 38)
addEvent(doTeleportThing, 200, target, getClosestFreeTile(cid, getThingPosWithDebug(cid)), true)
addEvent(sendDistanceShootWithProtect, 200, cid, getThingPosWithDebug(target), getThingPosWithDebug(cid), 38)


elseif spell == "Tongue Grap" then

local function distEff(cid, target)
if not isCreature(cid) or not isCreature(target) or not isSilence(target) then return true end  --alterado v1.6
   sendDistanceShootWithProtect(cid, getThingPosWithDebug(target), getThingPosWithDebug(cid), 38)
end

local ret = {}
ret.id = target
ret.cd = 10
ret.check = getPlayerStorageValue(target, conds["Silence"])
ret.eff = 185
ret.cond = "Silence"

sendDistanceShootWithProtect(cid, getThingPosWithDebug(cid), getThingPosWithDebug(target), 38)
addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
 
for i = 1, 10 do
    addEvent(distEff, i*930, cid, target)
end 

elseif spell == "Struggle Bug" then

    local function sendFireEff(cid, dir)
    if not isCreature(cid) then return true end
       doDanoWithProtect(cid, BUGDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 105)
	end

	local function doWheel(cid)
	if not isCreature(cid) then return true end
	local t = {
	      [1] = SOUTH,
	      [2] = SOUTHEAST,
	      [3] = EAST,
	      [4] = NORTHEAST,
	      [5] = NORTH,        --alterado v1.5
	      [6] = NORTHWEST,
	      [7] = WEST,
	      [8] = SOUTHWEST,
		}
		for a = 1, 8 do
            addEvent(sendFireEff, a * 200, cid, t[a])
		end
	end

	doWheel(cid, false, cid)
	
elseif spell == "Low Kick" then
  
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
    doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 113)	--alterado v1.7

elseif spell == "Present" then

local function sendHeal(cid)
if isCreature(cid) and isCreature(target) then 
   doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), crusher, min, max, 5)
   doSendAnimatedText(getThingPosWithDebug(target), "HEALTH!", 65)
end
end

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 31)
    if math.random(1, 100) >= 10 then
	   doDanoWithProtectWithDelay(cid, target, NORMALDAMAGE, min, max, 5, crusher) 
    else
       addEvent(sendHeal, 100, cid) 
    end
	
elseif spell == "Inferno" or spell == "Fissure" then
    
local pos = getThingPosWithDebug(cid)

atk = {
["Inferno"] = {239, FIREDAMAGE},
["Fissure"] = {102, GROUNDDAMAGE}
}

doMoveInArea2(cid, atk[spell][1], inferno1, atk[spell][2], 0, 0, spell)
addEvent(doDanoWithProtect, math.random(100, 400), cid, atk[spell][2], pos, inferno2, -min, -max, 0)

elseif spell == "Earth Power" then
    
local pos = getThingPosWithDebug(cid)

atk = {
["Earth Power"] = {123, GROUNDDAMAGE},
}

doMoveInArea2(cid, atk[spell][1], inferno1, atk[spell][2], 0, 0, spell)
addEvent(doDanoWithProtect, math.random(100, 400), cid, atk[spell][2], pos, inferno2, -min, -max, 0)

elseif spell == "Wrap" then

local ret = {}
ret.id = target
ret.cd = 10
ret.check = getPlayerStorageValue(target, conds["Silence"])
ret.eff = 104
ret.cond = "Silence"

doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)

elseif spell == "Rock n'Roll" then

local pos = getThingPosWithDebug(cid)
local areas = {rock1, rock2, rock3, rock4, rock5, rock4, rock3, rock2, rock1}
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 11
ret.check = 0
ret.spell = spell
ret.cond = "Miss"

for i = 0, 8 do
    addEvent(doMoveInArea2, i*400, cid, 11, areas[i+1], NORMALDAMAGE, min, max, spell, ret)
    addEvent(doMoveInArea2, i*410, cid, 11, areas[i+1], NORMALDAMAGE, 0, 0, spell)
end

elseif spell == "Power Wave" then
                                             
local pos = getThingPosWithDebug(cid)
local areas = {rock1, rock2, rock3, rock4, rock5}
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 103
ret.check = 0
ret.first = true
ret.cond = "Paralyze"

local function sendAtk(cid)
if isCreature(cid) then 
doRemoveCondition(cid, CONDITION_OUTFIT)
setPlayerStorageValue(cid, 9658783, -1)  
for i = 0, 4 do
    addEvent(doMoveInArea2, i*400, cid, 103, areas[i+1], psyDmg, min, max, spell, ret)
    addEvent(doMoveInArea2, i*410, cid, 103, areas[i+1], psyDmg, 0, 0, spell)
end
end
end

doSetCreatureOutfit(cid, {lookType = 1001}, -1)
setPlayerStorageValue(cid, 9658783, 1)
addEvent(sendAtk, 2000, cid)  

elseif spell == "Last Resort" then

local pos = getThingPosWithDebug(cid)
local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}

for i = 0, 9 do
    addEvent(doMoveInArea2, i*400, cid, 3, areas[i+1], NORMALDAMAGE, min, max, spell)
    addEvent(doMoveInArea2, i*410, cid, 3, areas[i+1], NORMALDAMAGE, 0, 0, spell)
end

elseif spell == "Future Sight" then

local master = getCreatureMaster(cid) or 0
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 0
ret.check = 0
ret.spell = spell
ret.cond = "Miss"
    
for rocks = 1, 42 do
    addEvent(fall, rocks*35, cid, master, psyDmg, -1, 156)
end

addEvent(doMoveInArea2, 500, cid, 0, BigArea2, psyDmg, min, max, spell, ret) 

elseif spell == "Icicle Crash" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 43
ret.check = 0
ret.first = true
ret.cond = "Slow"

local function doFall(cid)
for rocks = 1, 42 do
    addEvent(fall, rocks*35, cid, master, ICEDAMAGE, -1, 52)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, -1)
end                                         --alterado v1.4
addEvent(doFall, 450, cid)
addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, ICEDAMAGE, min, max, spell, ret)

elseif spell == "Fling" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 43
ret.check = 0
ret.first = true
ret.cond = "Slow"

local function doFall(cid)
for rocks = 1, 42 do
    addEvent(fall, rocks*35, cid, master, ICEDAMAGE, -1, 232)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, -1)
end                                         --alterado v1.4
addEvent(doFall, 450, cid)
addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, ICEDAMAGE, min, max, spell, ret)

elseif spell == "Aerial Ace" then

local eff = {16, 221, 223, 243}

for rocks = 1, 32 do
    addEvent(fall, rocks*22, cid, master, FLYINGDAMAGE, -1, eff[math.random(1, 4)])
end

addEvent(doMoveInArea2, 500, cid, 0, BigArea2, FLYINGDAMAGE, min, max, spell) 

elseif spell == "Mist" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid
local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 43
ret.check = 0
ret.first = true
ret.cond = "Slow"

local eff = {41, 41, 41, 41}

for rocks = 1, 32 do
    addEvent(fall, rocks*22, cid, master, ICEDAMAGE, -1, eff[math.random(1, 4)])
end

addEvent(doMoveInArea2, 500, cid, 0, BigArea2, ICEDAMAGE, min, max, spell)
 
 elseif spell == "Stone Edge" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid
local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.first = true

local eff = {157, 157, 157, 157}

for rocks = 1, 32 do
    addEvent(fall, rocks*22, cid, master, ROCKDAMAGE, -1, eff[math.random(1, 4)])
end

addEvent(doMoveInArea2, 500, cid, 0, BigArea2, ROCKDAMAGE, min, max, spell)
 
elseif spell == "Energy Ball" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid
local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.first = true

local eff = {105, 105, 105, 105}

for rocks = 1, 32 do
    addEvent(fall, rocks*22, cid, master, GRASSDAMAGE, -1, eff[math.random(1, 4)])
end

addEvent(doMoveInArea2, 500, cid, 0, BigArea2, GRASSDAMAGE, min, max, spell) 

elseif spell == "Echoed Voice" then

local p = getThingPosWithDebug(cid)
local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

function sendAtk(cid, area)
if isCreature(cid) then
   if not isSightClear(p, area, false) then return true end
   doAreaCombatHealth(cid, NORMALDAMAGE, area, pulse2, -min, -max, 255)
end
end

for a = 0, 5 do

local t = {
[0] = {33, {x=p.x, y=p.y-(a+1), z=p.z}},     
[1] = {33, {x=p.x+(a+1), y=p.y, z=p.z}},
[2] = {33, {x=p.x, y=p.y+(a+1), z=p.z}},
[3] = {33, {x=p.x-(a+1), y=p.y, z=p.z}}                            
}   
addEvent(sendAtk, 400*a, cid, t[d][2])
addEvent(doAreaCombatHealth, 400*a, cid, ROCKDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
end	

elseif spell == "10 Million Volt Thunder" or spell == "Leaf Tornado" or spell == "Waterfall" or spell == "Overheat" then  --alterado v1.8

local p = getThingPos(cid)
local pos1 = {
[1] = {{x = p.x, y = p.y+4, z = p.z}, {x = p.x+1, y = p.y+4, z = p.z}, {x = p.x+2, y = p.y+3, z = p.z}, {x = p.x+3, y = p.y+2, z = p.z}, {x = p.x+4, y = p.y+1, z = p.z}, {x = p.x+4, y = p.y, z = p.z}},
[2] = {{x = p.x, y = p.y+3, z = p.z}, {x = p.x+1, y = p.y+3, z = p.z}, {x = p.x+2, y = p.y+2, z = p.z}, {x = p.x+3, y = p.y+1, z = p.z}, {x = p.x+3, y = p.y, z = p.z}},
[3] = {{x = p.x, y = p.y+2, z = p.z}, {x = p.x+1, y = p.y+2, z = p.z}, {x = p.x+2, y = p.y+1, z = p.z}, {x = p.x+2, y = p.y, z = p.z}},
[4] = {{x = p.x, y = p.y+1, z = p.z}, {x = p.x+1, y = p.y+1, z = p.z}, {x = p.x+1, y = p.y, z = p.z}},
}

local pos2 = {
[1] = {{x = p.x, y = p.y-4, z = p.z}, {x = p.x-1, y = p.y-4, z = p.z}, {x = p.x-2, y = p.y-3, z = p.z}, {x = p.x-3, y = p.y-2, z = p.z}, {x = p.x-4, y = p.y-1, z = p.z}, {x = p.x-4, y = p.y, z = p.z}},
[2] = {{x = p.x, y = p.y-3, z = p.z}, {x = p.x-1, y = p.y-3, z = p.z}, {x = p.x-2, y = p.y-2, z = p.z}, {x = p.x-3, y = p.y-1, z = p.z}, {x = p.x-3, y = p.y, z = p.z}},
[3] = {{x = p.x, y = p.y-2, z = p.z}, {x = p.x-1, y = p.y-2, z = p.z}, {x = p.x-2, y = p.y-1, z = p.z}, {x = p.x-2, y = p.y, z = p.z}},
[4] = {{x = p.x, y = p.y-1, z = p.z}, {x = p.x-1, y = p.y-1, z = p.z}, {x = p.x-1, y = p.y, z = p.z}},
}

local pos3 = {
[1] = {{x = p.x+4, y = p.y, z = p.z}, {x = p.x+4, y = p.y-1, z = p.z}, {x = p.x+3, y = p.y-2, z = p.z}, {x = p.x+2, y = p.y-3, z = p.z}, {x = p.x+1, y = p.y-4, z = p.z}, {x = p.x, y = p.y-4, z = p.z}},
[2] = {{x = p.x+3, y = p.y, z = p.z}, {x = p.x+3, y = p.y-1, z = p.z}, {x = p.x+2, y = p.y-2, z = p.z}, {x = p.x+1, y = p.y-3, z = p.z}, {x = p.x, y = p.y-3, z = p.z}},
[3] = {{x = p.x+2, y = p.y, z = p.z}, {x = p.x+2, y = p.y-1, z = p.z}, {x = p.x+1, y = p.y-2, z = p.z}, {x = p.x, y = p.y-2, z = p.z}},
[4] = {{x = p.x+1, y = p.y, z = p.z}, {x = p.x+1, y = p.y-1, z = p.z}, {x = p.x, y = p.y-1, z = p.z}},
}

local pos4 = {
[1] = {{x = p.x-4, y = p.y, z = p.z}, {x = p.x-4, y = p.y+1, z = p.z}, {x = p.x-3, y = p.y+2, z = p.z}, {x = p.x-2, y = p.y+3, z = p.z}, {x = p.x-1, y = p.y+4, z = p.z}, {x = p.x, y = p.y+4, z = p.z}},
[2] = {{x = p.x-3, y = p.y, z = p.z}, {x = p.x-3, y = p.y+1, z = p.z}, {x = p.x-2, y = p.y+2, z = p.z}, {x = p.x-1, y = p.y+3, z = p.z}, {x = p.x, y = p.y+3, z = p.z}},
[3] = {{x = p.x-2, y = p.y, z = p.z}, {x = p.x-2, y = p.y+1, z = p.z}, {x = p.x-1, y = p.y+2, z = p.z}, {x = p.x, y = p.y+2, z = p.z}},
[4] = {{x = p.x-1, y = p.y, z = p.z}, {x = p.x-1, y = p.y+1, z = p.z}, {x = p.x, y = p.y+1, z = p.z}},
}

local atk = {
--[atk] = {distance, eff, damage}
["10 Million Volt Thunder"] = {-1, 126, ELECTRICDAMAGE},
["Leaf Tornado"] = {8, 168, GRASSDAMAGE}, 

["Overheat"] = {3, 39, FIREDAMAGE},     --alterado v1.9
["Waterfall"] = {-1, 155, WATERDAMAGE},
}

local function sendDist(cid, posi1, posi2, eff, delay)
if posi1 and posi2 and isCreature(cid) then
   addEvent(sendDistanceShootWithProtect, delay, cid, posi1, posi2, eff)   --alterado v1.6
end
end
                                                               
local function sendDano(cid, pos, eff, delay, min, max)
if pos and isCreature(cid) then
   addEvent(doDanoWithProtect, delay, cid, atk[spell][3], pos, 0, -min, -max, eff)  --alterado v1.6
end
end

local function doTornado(cid)
if isCreature(cid) then
for j = 1, 4 do
   for i = 1, 6 do                                                  --41/207  -- 14/54
       addEvent(sendDist, 350, cid, pos1[j][i], pos1[j][i+1], atk[spell][1], i*330)
       addEvent(sendDano, 350, cid, pos1[j][i], atk[spell][2], i*300, min, max)
       addEvent(sendDano, 350, cid, pos1[j][i], atk[spell][2], i*310, 0, 0)
       ---
       addEvent(sendDist, 350, cid, pos2[j][i], pos2[j][i+1], atk[spell][1], i*330)
       addEvent(sendDano, 350, cid, pos2[j][i], atk[spell][2], i*300, min, max)
       addEvent(sendDano, 350, cid, pos2[j][i], atk[spell][2], i*310, 0, 0)
       ----
       addEvent(sendDist, 800, cid, pos3[j][i], pos3[j][i+1], atk[spell][1], i*330)
       addEvent(sendDano, 800, cid, pos3[j][i], atk[spell][2], i*300, min, max)
       addEvent(sendDano, 800, cid, pos3[j][i], atk[spell][2], i*310, 0, 0)
       ---
       addEvent(sendDist, 800, cid, pos4[j][i], pos4[j][i+1], atk[spell][1], i*330)
       addEvent(sendDano, 800, cid, pos4[j][i], atk[spell][2], i*300, min, max)
       addEvent(sendDano, 800, cid, pos4[j][i], atk[spell][2], i*310, 0, 0)
   end
end
end
end

if spell == "10 Million Volt Thunder" then
   addEvent(doMoveInArea2, 1000, cid, 0, electro, ELECTRICDAMAGE, 0, 0, spell, ret)
end

if spell == "Waterfall" then
   addEvent(doMoveInArea2, 1000, cid, 0, electro, WATERDAMAGE, 0, 0, spell, ret)
end

if spell == "Overheat" then   --alterado v1.8
   doTornado(cid)
else
    for b = 0, 2 do
        addEvent(doTornado, b*1500, cid)
    end
end

elseif spell == "Seed Bomb" then                  --alterado v1.6

local master = isSummon(cid) and getCreatureMaster(cid) or cid

local function doFall(cid)
for rocks = 1, 42 do   --62
    addEvent(fall, rocks*35, cid, master, SEED_BOMBDAMAGE, 1, 54)
end
end

for up = 1, 10 do
    addEvent(upEffect, up*75, cid, 1)
end
addEvent(doFall, 450, cid)
addEvent(doMoveInArea2, 1400, cid, 2, BigArea2, SEED_BOMBDAMAGE, min, max, spell)


elseif spell == "Bulldoze" then

local p = getThingPosWithDebug(cid)
p.x = p.x+1
p.y = p.y+1

sendEffWithProtect(cid, p, 151)   --send eff

local function doDano(cid)
local pos = getThingPosWithDebug(cid)

    local function doSendBubble(cid, pos)
		if not isCreature(cid) then return true end
		doSendDistanceShoot(getThingPosWithDebug(cid), pos, 39)
		doSendMagicEffect(pos, 118)
	end
	                                                          --alterado!!
	for a = 1, 20 do
	    local r1 = math.random(-4, 4)
	    local r2 = r1 == 0 and choose(-3, -2, -1, 2, 3) or math.random(-3, 3)
	    --
	    local lugar = {x = pos.x + r1, y = pos.y + r2, z = pos.z}
	    addEvent(doSendBubble, a * 25, cid, lugar)
	end

	addEvent(doDanoWithProtect, 150, cid, ROCKDAMAGE, pos, waterarea, -min, -max, 0)
end

addEvent(doDano, 1250, cid)

elseif spell == "Dragon Rage" then

local p = getThingPosWithDebug(cid)
p.x = p.x+1
p.y = p.y+1

sendEffWithProtect(cid, p, 241)   --send eff

local function doDano(cid)
local pos = getThingPosWithDebug(cid)

    local function doSendBubble(cid, pos)
		if not isCreature(cid) then return true end
		doSendDistanceShoot(getThingPosWithDebug(cid), pos, 20)
		doSendMagicEffect(pos, 250)
	end
	                                                          --alterado!!
	for a = 1, 20 do
	    local r1 = math.random(-4, 4)
	    local r2 = r1 == 0 and choose(-3, -2, -1, 2, 3) or math.random(-3, 3)
	    --
	    local lugar = {x = pos.x + r1, y = pos.y + r2, z = pos.z}
	    addEvent(doSendBubble, a * 25, cid, lugar)
	end

	addEvent(doDanoWithProtect, 150, cid, DRAGONDAMAGE, pos, waterarea, -min, -max, 0)
end

addEvent(doDano, 1250, cid)


elseif spell == "Fury Swipes" then

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 23)
	doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 152)  
	
	
elseif spell == "Cross Poison" then

doMoveInArea2(cid, 153, cross, POISONDAMAGE, -min, -max, spell)

elseif spell == "Fire Pledge" then

       local eff = {124, 124, 239, 124, 239}
       local area = {psy1, psy2, psy3, psy4, psy5}

       setPlayerStorageValue(cid, 3644587, 1)
       addEvent(setPlayerStorageValue, 4*400, cid, 3644587, -1)
       for i = 0, 4 do
           addEvent(doMoveInArea2, i*400, cid, eff[i+1], area[i+1], FIREDAMAGE, min, max, spell)
       end

elseif spell == "Water Pledge" then

       local eff = {155, 154, 53, 155, 53}
       local area = {psy1, psy2, psy3, psy4, psy5}

       setPlayerStorageValue(cid, 3644587, 1)
       addEvent(setPlayerStorageValue, 4*400, cid, 3644587, -1)
       for i = 0, 4 do
           addEvent(doMoveInArea2, i*400, cid, eff[i+1], area[i+1], WATERDAMAGE, min, max, spell)
       end
       
elseif spell == "Gyro Ball" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 0
ret.spell = spell
ret.cond = "Stun"

stopNow(cid, 2000)
doMoveInArea2(cid, 98, reto5, STEELDAMAGE, min, max, spell, ret) 
       
elseif spell == "Flash Cannon" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 0
ret.spell = spell
ret.cond = "Stun"

stopNow(cid, 2000)
doMoveInArea2(cid, 206, reto5, STEELDAMAGE, min, max, spell, ret) 

elseif spell == "Rock Tomb" then

local ret = {}
ret.id = target
ret.cd = 9
ret.eff = 0
ret.check = getPlayerStorageValue(target, conds["Slow"])
ret.first = true
ret.cond = "Slow"

        local function doRockFall(cid, frompos, target)
			if not isCreature(target) or not isCreature(cid) then return true end
		    local pos = getThingPosWithDebug(target)
		    local ry = math.abs(frompos.y - pos.y)
		    doSendDistanceShoot(frompos, pos, 39)
		    addEvent(doMoveDano2, ry * 11, cid, target, ROCKDAMAGE, min, max, ret, spell)
		    addEvent(sendEffWithProtect, ry*11, cid, pos, 157)
        end

		local function doRockUp(cid, target)
			if not isCreature(target) or not isCreature(cid) then return true end
		    local pos = getThingPosWithDebug(target)
		    local mps = getThingPosWithDebug(cid)
		    local xrg = math.floor((pos.x - mps.x) / 2)
		    local topos = mps
		    topos.x = topos.x + xrg
		    local rd =  7
		    topos.y = topos.y - rd
		    doSendDistanceShoot(getThingPosWithDebug(cid), topos, 39)
		    addEvent(doRockFall, rd * 49, cid, topos, target)
		end		
    addEvent(doRockUp, 155, cid, target)
    
elseif spell == "Sand Tomb" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 34
ret.check = 0
ret.spell = spell
ret.cond = "Miss"

doMoveInAreaMulti(cid, 22, 158, bullet, bulletDano, GROUNDDAMAGE, min, max, ret)

elseif spell == "Magnet Bomb" then

local ret = {}
ret.id = 0
ret.cd = 9
ret.eff = 48
ret.check = 0
ret.spell = spell
ret.cond = "Miss"

doMoveInAreaMulti(cid, -1, 171, bullet, bulletDano, ELECTRICDAMAGE, min, max, ret)

elseif spell == "Rain Dance" then

local master = isSummon(cid) and getCreatureMaster(cid) or cid
------------
local ret = {}
ret.id = 0
ret.cd = 9
ret.check = 0
ret.eff = 1
ret.cond = "Silence"
---
local function doFall(cid)
for rocks = 1, 42 do --62
    addEvent(fall, rocks*35, cid, master, WATERDAMAGE, 52, 1)
end
end
---
local function doRain(cid)
if isSummon(cid) then 
   doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
end                                                      --cura status
doCureStatus(cid, "all")
---
setPlayerStorageValue(cid, 253, 1)  --Meditate
doSendMagicEffect(getThingPosWithDebug(cid), 132)
---
doMoveInArea2(cid, 0, confusion, WATERDAMAGE, 0, 0, spell, ret)
end
---
addEvent(doFall, 200, cid)
addEvent(doRain, 1000, cid)


elseif spell == "Night Slash" then

local p = getThingPosWithDebug(cid)

local t = {
{251, {x = p.x+1, y = p.y-1, z = p.z}},
{253, {x = p.x+2, y = p.y+1, z = p.z}},
{252, {x = p.x+1, y = p.y+2, z = p.z}},
{254, {x = p.x-1, y = p.y+1, z = p.z}},
}

doAreaCombatHealth(cid, DARKDAMAGE, p, scyther5, -min, -max, 165)
for a = 0, 1 do
    for i = 1, 4 do
        addEvent(doSendMagicEffect, a*400, t[i][2], t[i][1])          --alterado v1.8
    end
end
addEvent(doAreaCombatHealth, 400, cid, DARKDAMAGE, p, scyther5, -min, -max, 165)

elseif spell == "Heavy Slam" then

local p = getThingPosWithDebug(cid)

local t = {
{251, {x = p.x+1, y = p.y-1, z = p.z}},
{253, {x = p.x+2, y = p.y+1, z = p.z}},
{252, {x = p.x+1, y = p.y+2, z = p.z}},
{254, {x = p.x-1, y = p.y+1, z = p.z}},
}

doAreaCombatHealth(cid, STEELDAMAGE, p, confusion, -min, -max, 77)
for a = 0, 1 do
    for i = 1, 4 do
        addEvent(doSendMagicEffect, a*400, t[i][2], t[i][1])          --alterado v1.8
    end
end
addEvent(doAreaCombatHealth, 400, cid, STEELDAMAGE, p, confusion, -min, -max, 165)

elseif spell == "Wild Charge" then

local ret = {}                 
ret.id = 0
ret.cd = 9
ret.eff = 48
ret.check = 0
ret.spell = spell
ret.cond = "Stun"

local pos = getThingPosWithDebug(cid)
local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}

for i = 0, 14 do
    addEvent(doMoveInArea2, i*320, cid, 48, areas[i+1], ELECTRICDAMAGE, min, max, spell, ret)
    addEvent(doMoveInArea2, i*330, cid, 48, areas[i+1], ELECTRICDAMAGE, 0, 0, spell)
end

elseif spell == "Seismic Toss" then

local ret = {}                 
ret.id = 0
ret.cd = 9
ret.eff = 136
ret.check = 0
ret.spell = spell
ret.cond = "Confusion"

local pos = getThingPosWithDebug(cid)
local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}

for i = 0, 14 do
    addEvent(doMoveInArea2, i*320, cid, 112, areas[i+1], FIGHTINGDAMAGE, min, max, spell, ret)
    addEvent(doMoveInArea2, i*330, cid, 112, areas[i+1], FIGHTINGDAMAGE, 0, 0, spell)
end

elseif spell == "Jump Kick" then   --ver essa

doMoveInAreaMulti(cid, 42, 113, bullet, bulletDano, FIGHTINGDAMAGE, min, max)

elseif spell == "Bug Buzz" then 

local ret = {}
ret.id = target
ret.cd = 9
ret.eff = 34
ret.check = 0
ret.spell = spell
ret.cond = "Stun"  

doMoveInArea2(cid, 86, db1, BUGDAMAGE, min, max, spell, ret)
addEvent(doMoveInArea2, 250, cid, 86, db1, BUGDAMAGE, 0, 0, spell)

elseif spell == "Whirlpool" then

local function setSto(cid)
if isCreature(cid) then
   setPlayerStorageValue(cid, 3644587, -1)
end
end

local function doDano(cid)
if isSleeping(cid) then return true end
      doDanoWithProtect(cid, WATERDAMAGE, getThingPosWithDebug(cid), splash, min, max, 89)
end

setPlayerStorageValue(cid, 3644587, 1)
for r = 0, 10 do  
    addEvent(doDano, 600 * r, cid)
end
addEvent(setSto, 600*10, cid)

elseif spell == "Iron Head" then

doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
doDanoInTargetWithDelay(cid, target, STEELDAMAGE, -min, -max, 77) 

elseif spell == "Brick Break" then

local ret = {}
ret.id = 0
ret.cd = 9                        
ret.eff = 88
ret.check = 0
ret.first = true
ret.cond = "Paralyze"

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)
local t = {
[0] = {90, {x=p.x+1, y=p.y-1, z=p.z}},
[1] = {90, {x=p.x+2, y=p.y+1, z=p.z}},   
[2] = {90, {x=p.x+1, y=p.y+2, z=p.z}},
[3] = {90, {x=p.x-1, y=p.y+1, z=p.z}},  
}

doMoveInArea2(cid, 0, BrickBeak, FIGHTINGDAMAGE, min, max, spell, ret)
doSendMagicEffect(t[a][2], t[a][1])


elseif spell == "Heat Wave" then

local pos = getThingPosWithDebug(cid)

doMoveInArea2(cid, 91, inferno1, FIREDAMAGE, 0, 0, spell)
addEvent(doDanoWithProtect, math.random(100, 400), cid, FIREDAMAGE, pos, inferno2, -min, -max, 0)

elseif spell == "Bone Rush" then

local area = {gale1, gale2, gale3, gale4, gale3, gale2, gale1}

for i = 0, 6 do
    addEvent(doMoveInArea2, i*400, cid, 227, area[i+1], ROCKDAMAGE, min, max, spell)
end	

elseif spell == "Hammer Arm" then

local ret = {}
ret.id = 0
ret.cd = 9                        
ret.eff = 88
ret.check = 0
ret.first = true
ret.cond = "Paralyze"

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)
local t = {
[0] = {92, {x=p.x, y=p.y-1, z=p.z}},
[1] = {94, {x=p.x+2, y=p.y, z=p.z}},   
[2] = {95, {x=p.x+1, y=p.y+2, z=p.z}},
[3] = {93, {x=p.x-1, y=p.y, z=p.z}},  
}

doMoveInArea2(cid, 0, BrickBeak, FIGHTINGDAMAGE, min, max, spell, ret)
doSendMagicEffect(t[a][2], t[a][1])


--///////////////////////   PASSIVAS /////////////////////////--
elseif spell == "Counter Helix" then
-- [nome] = {out = outfit girando, efeitos}
local OutFit = {
["Scyther"] = {out = 496, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --scyther
["Compound Scyther"] = {out = 496, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --scyther
["Scizor"] = {out = 918, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --Scizor
["Shiny Scyther"] = {out = 849, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Shiny Scyther
["Exonered Scizor"] = {out = 918, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --Scizor
["Mega Scizor"] = {out = 918, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --Scizor
["Shiny Scizor"] = {out = 1837, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --shiny Scizor
["Wobbuffet"] = {out = 924, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --wobb AVAAAAA
["Mega Wobbuffet"] = {out = 1829, cima = 128, direita = 129, esquerda = 130, baixo = 131},
["Tangrowth"] = {out = 2162, cima = 128, direita = 129, esquerda = 130, baixo = 131}, -- TANGAO Q TAVA BUGADO
["Hitmontop"] = {out = 1193, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Hitmontop
["Shiny Hitmontop"] = {out = 1451, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Shiny Hitmontop    
["Pineco"] = {out = 1194, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --pineco
["Mega Lucario"] = {out = 16, cima = 128, direita = 129, esquerda = 130, baixo = 131},
["Forretress"] = {out = 1192, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Forretress
["Wobbuffet"] = {out = 924, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --wobb
["Alakazam"] = {out = 569, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --alaka
["Kadabra"] = {out = 570, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --kadabra
["Shiny Abra"] = {out = 1257, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --s abra
["Kangaskhan"] = {out = 549, cima = 251, direita = 253, esquerda = 254, baixo = 252},  --test
["Shiny Vileplume"] = {out = 1239, cima = 251, direita = 253, esquerda = 254, baixo = 252},  
["Shiny Wobbuffet"] = {out = 2160, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Venusaur"] = {out = 373, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Vileplume"] = {out = 473, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Mega Venusaur"] = {out = 2030, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Fire Tyranitar"] = {out = 3159, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Fire Tyranitar"] = {out = 897, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Alakazam"] = {out = 569, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Mega Alakazam"] = {out = 13, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Mega Alakazam"] = {out = 1259, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Virus Alakazam"] = {out = 4024, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Ice Alakazam"] = {out = 3151, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Virus Metagross"] = {out = 2676, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Shiny Metagross"] = {out = 3250, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Metagross"] = {out = 1614, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Golurk"] = {out = 2869, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Virus Golurk"] = {out = 5411, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Shiny Abra"] = {out = 1257, cima = 251, direita = 253, esquerda = 254, baixo = 252},
["Fire Tyranitar"] = {out = 3159, cima = 251, direita = 253, esquerda = 254, baixo = 252},
}
      
      if getPlayerStorageValue(cid, 32623) == 1 then  --proteçao pra n usar a passiva 2x seguidas...
      return true
      end
	  
      
      local nome1 = getSubName(cid, target)   --alterado v1.6.1
      local outfitt = OutFit[nome1]   --alterado v1.6.1        

      local function damage(cid, min, max)
      if isCreature(cid) then
         if isInArray({"Scyther", "Wobbuffet", "Shiny Scyther", "Shiny Scizor", "Mega Lucario", "Compound Scyther", "Exonered Scizor", "Pineco"}, nome1) then   --alterado v1.6
            damage = BUGDAMAGE  
         elseif isInArray({"Hitmontop", "Shiny Hitmontop", "Kangaskhan"}, nome1) then               
            damage = FIGHTINGDAMAGE                --alterado v1.6.1
         else                                        
            damage = STEELDAMAGE
         end
         doAreaCombatHealth(cid, damage, getThingPosWithDebug(cid), scyther5, -min, -max, CONST_ME_NONE) --alterado v1.6.1
         ---
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe1, 0, 0, outfitt.cima) --cima
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe2, 0, 0, outfitt.baixo) --baixo
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe3, 0, 0, outfitt.direita) --direita
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe4, 0, 0, outfitt.esquerda)  --esquerda
      end
      end
      
      local function sendEff(cid)
      if isCreature(cid) then
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe1, 0, 0, outfitt.cima) --cima
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe2, 0, 0, outfitt.baixo) --baixo
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe3, 0, 0, outfitt.direita) --direita       --alterado v1.6
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe4, 0, 0, outfitt.esquerda)  --esquerda
      end
      end   

      local function doChangeO(cid)
	  if not isCreature(cid) then return true end
         setPlayerStorageValue(cid, 32623, 0)      
         if isSleeping(cid) and getMonsterInfo(getCreatureName(cid)).lookCorpse ~= 0 then
            doSetCreatureOutfit(cid, {lookType = 0, lookTypeEx = getMonsterInfo(getCreatureName(cid)).lookCorpse}, -1)
         else
             doRemoveCondition(cid, CONDITION_OUTFIT)
         end
      end
      
      local delay = 200 -- não mexe
      local master = isSummon(cid) and getCreatureMaster(cid) or cid                    --alterado v1.6
      local summons = getCreatureSummons(master)                                          
      
      if (isPlayer(master) and #summons >= 2) or (ehMonstro(master) and #summons >= 1) then
         for j = 1, #summons do
             setPlayerStorageValue(summons[j], 32623, 1)      
	         doSetCreatureOutfit(summons[j], {lookType = outfitt.out}, -1)

             for i = 1, 2 do                                                                     --alterado v1.6
                 addEvent(sendEff, delay*i, summons[j])
             end
             addEvent(doChangeO, 2 * 300 + 10, summons[j])
         end
         for i = 1, 2 do
             addEvent(damage, delay*i, (isPlayer(master) and summons[1] or master), min, max)
         end
      else
         setPlayerStorageValue(cid, 32623, 1)    
   setPlayerStorageValue(cid, 98654, 1)		 
         doSetCreatureOutfit(cid, {lookType = outfitt.out}, -1)
   
         for i = 1, 2 do                                                                 --alterado v1.6
             addEvent(damage, delay*i, cid, min, max)
         end
         addEvent(doChangeO, 2 * 300 + 10, cid) 
      end
      
elseif spell == "Lava-Counter" then

local function sendStickEff(cid, dir)
    if not isCreature(cid) then return true end
       doAreaCombatHealth(cid, FIREDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 5)
	end

	local function doStick(cid)
	if not isCreature(cid) then return true end
	local t = {
	      [1] = SOUTHWEST,
	      [2] = SOUTH,
	      [3] = SOUTHEAST,
	      [4] = EAST,
	      [5] = NORTHEAST,
	      [6] = NORTH,
	      [7] = NORTHWEST,
	      [8] = WEST,
	      [9] = SOUTHWEST,
		}
		for a = 1, 9 do
            addEvent(sendStickEff, a * 140, cid, t[a])
		end
	end

	doStick(cid, false, cid)
	setPlayerStorageValue(cid, 98654, 1)
                 
elseif spell == "Mega Drain" then

   local uid = checkAreaUid(getThingPos(cid), check, 1, 1)
   for _,pid in pairs(uid) do
       if isCreature(cid) and isCreature(pid) and pid ~= cid then
          if isPlayer(pid) and #getCreatureSummons(pid) >= 1 then return false end
		
          local life = getCreatureHealth(pid)

	      doAreaCombatHealth(cid, GRASSDAMAGE, getThingPos(pid), 0, -min, -max, 15)

	      local newlife = life - getCreatureHealth(pid)

	      doSendMagicEffect(getThingPos(cid), 45)
		     setPlayerStorageValue(cid, 98654, 1)
	      if newlife >= 1 then
	         doCreatureAddHealth(cid, newlife)
	         doSendAnimatedText(getThingPos(cid), "+"..newlife.."", 32)
          end  
       end
   end
   
elseif spell == "Spores Reaction" then

local random = math.random(1, 3)

   if random == 1 then
      local ret = {}
      ret.id = 0
      ret.cd = math.random(2, 3)
      ret.check = 0                   --alterado v1.6
      ret.first = true
      ret.cond = "Sleep"
	
      doMoveInArea2(cid, 60, confusion, GRASSDAMAGE, 0, 0, "Spores Reaction", ret)
	     setPlayerStorageValue(cid, 98654, 1)
   elseif random == 2 then 
      local ret = {}
      ret.id = 0
      ret.cd = 6
      ret.eff = 0
      ret.check = 0
      ret.spell = spell
      ret.cond = "Stun"
    
      doMoveInArea2(cid, 85, confusion, GRASSDAMAGE, 0, 0, "Spores Reaction", ret)   
   setPlayerStorageValue(cid, 98654, 1)	  
   else
      local ret = {}
      ret.id = 0
      ret.cd = math.random(6, 10)
      ret.check = 0
      local lvl = isSummon(cid) and getMasterLevel(cid) or getPokemonLevel(cid)     --alterado v1.6
      ret.damage = math.floor((getPokemonLevel(cid)+lvl * 3)/2)
      ret.cond = "Poison"                              

      doMoveInArea2(cid, 84, confusion, POISONDAMAGE, 0, 0, "Spores Reaction", ret) 
	     setPlayerStorageValue(cid, 98654, 1)
   end

elseif spell == "Stunning Confusion" then

      if getPlayerStorageValue(cid, 32623) == 1 then  --proteçao pra n usar a spell 2x seguidas...
      return true
      end
      
      local function damage(cid)
      if isCreature(cid) then
         doAreaCombatHealth(cid, PSYCHICDAMAGE, getThingPosWithDebug(cid), bombWee3, -min, -max, 133)
      end
      end
          
      setPlayerStorageValue(cid, 32623, 1)        --proteçao
      for i = 1, 7 do
          addEvent(damage, 1*500, cid)
      end
      addEvent(setPlayerStorageValue, 3500, cid, 32623, 0)        --proteçao
	     setPlayerStorageValue(cid, 98654, 1)
      
elseif spell == "Bone-Spin" then

local function sendStickEff(cid, dir)
    if not isCreature(cid) then return true end
       doAreaCombatHealth(cid, GROUNDDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 227)
	end

	local function doStick(cid)
	if not isCreature(cid) then return true end
	local t = {
	      [1] = SOUTHWEST,
	      [2] = SOUTH,
	      [3] = SOUTHEAST,
	      [4] = EAST,
	      [5] = NORTHEAST,
	      [6] = NORTH,
	      [7] = NORTHWEST,
	      [8] = WEST,
	      [9] = SOUTHWEST,
		}
		for a = 1, 9 do
            addEvent(sendStickEff, a * 140, cid, t[a])
		end
	end

	doStick(cid, false, cid)
        setPlayerStorageValue(cid, 98654, 1)
                                                                            --alterado v1.4
elseif spell == "Amnesia" then

   if getPlayerStorageValue(cid, 253) >= 1 then return true end
   
   doCreatureSay(cid, "????", 20)              
   doSendMagicEffect(getThingPosWithDebug(cid), 132)
   setPlayerStorageValue(cid, 253, 1)
   setPlayerStorageValue(cid, 98654, 1)
   
elseif spell == "Dragon Fury" then

   if getPlayerStorageValue(cid, 32623) == 1 then
   return true
   end

   setPlayerStorageValue(cid, 32623, 1)
   setPlayerStorageValue(cid, 98654, 1)

   if isInArray({"Persian", "Raticate", "Shiny Raticate"}, getSubName(cid, target)) then  --alterado v1.6.1
      doRaiseStatus(cid, 1.5, 0, 0, 10)
   else                                               --alterado v1.5 
      doRaiseStatus(cid, 1.5, 1.5, 0, 10)     --ver isso
   end
            
   for t = 1, 7 do                  --alterado v1.5
       addEvent(sendMoveEffect, t*1500, cid, 12)
   end
   addEvent(setPlayerStorageValue, 10500, cid, 32623, 0) --alterado v1.8
   
elseif spell == "Electric Charge" then

   if getPlayerStorageValue(cid, 253) >= 1 then
   return true
   end
   
   setPlayerStorageValue(cid, 253, 1)
   setPlayerStorageValue(cid, 98654, 1)
   doSendMagicEffect(getThingPosWithDebug(cid), 207)
   doSendAnimatedText(getThingPosWithDebug(cid), "Meditate", 144)
   
elseif spell == "Shock-Counter" then

local function sendStickEff(cid, dir)
    if not isCreature(cid) then return true end
       doAreaCombatHealth(cid, ELECTRICDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 207)
	end

	local function doStick(cid)
	if not isCreature(cid) then return true end
	local t = {
	      [1] = SOUTHWEST,
	      [2] = SOUTH,
	      [3] = SOUTHEAST,
	      [4] = EAST,
	      [5] = NORTHEAST,
	      [6] = NORTH,
	      [7] = NORTHWEST,
	      [8] = WEST,
	      [9] = SOUTHWEST,
		}
		for a = 1, 9 do
            addEvent(sendStickEff, a * 140, cid, t[a])
		end
	end

	doStick(cid, false, cid)
	setPlayerStorageValue(cid, 98654, 1)
                 
elseif spell == "Mirror Coat" then

    if spell == "Magic Coat" then
      eff = 135
    else
      eff = 135
    end

	doSendMagicEffect(getThingPosWithDebug(cid), eff)
	setPlayerStorageValue(cid, 21099, 1)    
setPlayerStorageValue(cid, 98654, 1)	
	
elseif spell == "Zen Mind" then

   function doCure(cid)
   if not isCreature(cid) then return true end
   if isSummon(cid) then 
      doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
   end
   doCureStatus(cid, "all")
   end
   
   addEvent(doCure, 1000, cid)
   doSetCreatureOutfit(cid, {lookType = 1001}, 2000)
   setPlayerStorageValue(cid, 98654, 1)
   
elseif spell == "Demon Kicker" then

--[outfit] = outfit chutando,
local hitmonlees = {
["Hitmonlee"] =  652,      --hitmonlee
["Shiny Hitmonlee"] = 878,  --shiny hitmonlee
}
   
   local nome = getCreatureName(cid)  
                                                --alterado v1.6                                        --alterado v1.7
if (not hitmonlees[nome] and isCreature(target)) or (isCreature(target) and math.random(1, 100) <= passivesChances["Demon Kicker"][nome]) then
                                                         
      if getDistanceBetween(getThingPos(cid), getThingPos(target)) > 1 then
      return true
      end
      if getPlayerStorageValue(cid, 32623) == 1 then  --proteçao pra n usar a passiva 2x seguidas...
      return true
      end
      
      if not isSummon(cid) then       --alterado v1.7
         doCreatureSay(cid, string.upper(spell).."!", TALKTYPE_MONSTER)
      end
      
      local function doChangeHitmon(cid)
	  if not isCreature(cid) then return true end
         setPlayerStorageValue(cid, 32623, 0)         --proteçao
         if isSleeping(cid) and getMonsterInfo(getCreatureName(cid)).lookCorpse ~= 0 then
            doSetCreatureOutfit(cid, {lookType = 0, lookTypeEx = getMonsterInfo(getCreatureName(cid)).lookCorpse}, -1)
         else
            doRemoveCondition(cid, CONDITION_OUTFIT)
         end
      end            
       
         setPlayerStorageValue(cid, 32623, 1)       --proteçao
		 setPlayerStorageValue(cid, 98654, 1)
         
         local look = hitmonlees[nome] or getPlayerStorageValue(cid, 21104)  --alterado v1.6
   
         doCreatureSetLookDir(cid, getCreatureDirectionToTarget(cid, target))
         doSetCreatureOutfit(cid, {lookType = look}, -1)   --alterado v1.6
         doTargetCombatHealth(cid, target, FIGHTINGDAMAGE, -min, -max, 255)
         
         addEvent(doChangeHitmon, 700, cid)   		 
end

elseif spell == "Darkness Storm" then

local eff = {493, 493, 379, 379}

local area = {darkstorm1, darkstorm2, darkstorm3, darkstorm4}

addEvent(doMoveInArea2, 2*450, cid, 2, darkstorm4, DARKDAMAGE, min, max, spell)

for i = 0, 3 do

   addEvent(doMoveInArea2, i*450, cid, eff[i+1], area[i+1], DARKDAMAGE, min, max, spell)

end

elseif spell == "Illusion" then

local team = {
["Misdreavus"] = "MisdreavusTeam",
["Shiny Stantler"] = "Shiny StantlerTeam",
["Stantler"] = "StantlerTeam",
}

local function RemoveTeam(cid)
if isCreature(cid) then
  doSendMagicEffect(getThingPosWithDebug(cid), 211)
  doRemoveCreature(cid)
end
end

local function sendEff(cid, master, t)
if isCreature(cid) and isCreature(master) and t > 0 and #getCreatureSummons(master) >= 2 then
   doSendMagicEffect(getThingPosWithDebug(cid), 86, master)
   addEvent(sendEff, 1000, cid, master, t-1)                        --alterado v1.9
end
end

if getPlayerStorageValue(cid, 637500) >= 1 then
return true
end

local master = getCreatureMaster(cid)
local item = getPlayerSlotItem(master, 8)
local life, maxLife = getCreatureHealth(cid), getCreatureMaxHealth(cid)
local name = getItemAttribute(item.uid, "poke")
local pos = getThingPosWithDebug(cid)
local time = 5

doItemSetAttribute(item.uid, "hp", (life/maxLife))

local num = getSubName(cid, target) == "Misdreavus" and 3 or 2
local pk = {}

doTeleportThing(cid, {x=4, y=3, z=10}, true) 

if team[name] then
   pk[1] = cid
   for b = 2, num do
       pk[b] = doSummonCreature(team[name], pos)
       doConvinceCreature(master, pk[b])
   end

   for a = 1, num do
      addEvent(doTeleportThing, math.random(0, 5), pk[a], getClosestFreeTile(pk[a], pos), true)
      addEvent(doAdjustWithDelay, 5, master, pk[a], true, true, true)
      doSendMagicEffect(getThingPosWithDebug(pk[a]), 211)
   end 
   sendEff(cid, master, time)     --alterado v1.9
   setPlayerStorageValue(master, 637501, 1)
   addEvent(setPlayerStorageValue, time * 1000, master, 637501, -2)
   -----
   setPlayerStorageValue(pk[2], 637500, 1)
   addEvent(RemoveTeam, time * 1000, pk[2])
   -----
   setPlayerStorageValue(pk[3], 637500, 1)
   addEvent(RemoveTeam, time * 1000, pk[3])
   ----
   if getSubName(cid, target) == "Scizor" then  
      setPlayerStorageValue(pk[4], 637500, 1) 
      addEvent(RemoveTeam, time * 1000, pk[4])
   end
end


elseif spell == "Demon Puncher" then

   local name = getCreatureName(cid)
                                                                                                             --alterado v1.7
if (not hitmonchans[name] and isCreature(target)) or (isCreature(target) and math.random(1, 100) <= passivesChances["Demon Puncher"][name]) then 
                                                        
       if getDistanceBetween(getThingPosWithDebug(cid), getThingPosWithDebug(target)) > 1 then
       return true
       end
       
       if not isSummon(cid) then       --alterado v1.7
         doCreatureSay(cid, string.upper(spell).."!", TALKTYPE_MONSTER)
       end                                 
         
         if ehMonstro(cid) or not hitmonchans[name] then
            hands = 0
         else
            hands = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "hands")
         end
         
         if not hitmonchans[name] then
            tabela = hitmonchans[getCreatureName(target)][hands]
         else
            tabela = hitmonchans[name][hands]
         end
          
         doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
         doTargetCombatHealth(cid, target, tabela.type, -min, -max, 255)
         
         local alvo = getThingPosWithDebug(target)
         alvo.x = alvo.x + 1                           ---alterado v1.7
         
         if hands == 4 then
            doSendMagicEffect(alvo, tabela.eff)
         else
            doSendMagicEffect(getThingPosWithDebug(target), tabela.eff)
         end
         
         if hands == 3 then
            local ret = {}
            ret.id = target
            ret.cd = 9                     --alterado v1.6
            ret.eff = 43
            ret.check = getPlayerStorageValue(target, conds["Slow"])
            ret.first = true
            ret.cond = "Slow"
         
            doMoveDano2(cid, target, FIGHTINGDAMAGE, 0, 0, ret, spell)
			setPlayerStorageValue(cid, 98654, 1)
         end  
end


end
return true 
end