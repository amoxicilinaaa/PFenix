dofile("./petConfig.lua")	 
function onSay(cid, words, param)

if isExhausted(cid) == 1 then
	return 0
end

local lookDirs = {[0] = {x = 0, y = -1},
				  [1] = {x = 1, y = 0},
				  [2] = {x = 0, y = 1},
				  [3] = {x = -1, y = 0}
				 }

local myAttack = 0 
local CRONOMETRO = 0
local CRONOMETRO2 = 0
local TIEMPO = 0

function formulaAttack(magicLevel, level, maxb, maxa, minb, mina)
return {minD = (level * 2 + magicLevel * 3) * (1 + mina) + minb,
		maxD = (level * 2 + magicLevel * 3) * (1 + maxb) + maxa
	   }
end
function getPetMlvl(manaSpent)
	local i = 0
	while manaSpent >= (1600 * (1.2^i))*magicLevelRate do
		i = i + 1
	end
	return i
end

local daPet = getPlayerStorageValue(cid, storages.petUid)
if isCreature(daPet) == 1 then 
	if param ~= nil then

		param = string.lower(param)
		local petPos = getCreaturePosition(daPet)
		local lookDir = getPlayerLookDir(cid) -- getPlayerLookDir(daPet plz ! ! !)
		local damage = {}
		CRONOMETRO = getPlayerStorageValue(cid, storages.petExha)
		CRONOMETRO2 = os.clock()
		TIEMPO = os.difftime(CRONOMETRO2, CRONOMETRO)

		for i = 1, #attacks do
			if param == attacks[i].param then
				myAttack = i
				break
			end
		end

		if myAttack ~= 0 then
			if attacks[myAttack].exhausted - TIEMPO > attacks[myAttack].exhausted or CRONOMETRO == -1 then
				setPlayerStorageValue(cid, storages.petExha, CRONOMETRO2+1)
			end
			if getPlayerStorageValue(cid, storages.petMana) >= attacks[myAttack].manaSpent then
				if attacks[myAttack].needLevel <= getPlayerLevel(cid) then
					if attacks[myAttack].needMag <= getPlayerStorageValue(cid, storages.petMag) then
						if attacks[myAttack].exhausted - TIEMPO <= 0 then
							if attacks[myAttack].theFunction == false then
								damage = formulaAttack(getPlayerStorageValue(cid, storages.petMag), getPlayerLevel(cid),  attacks[myAttack].formula.maxb, attacks[myAttack].formula.maxa, attacks[myAttack].formula.minb, attacks[myAttack].formula.mina)
								doAreaCombatHealth(daPet*((attacks[myAttack].self - 1)*-1), attacks[myAttack].combatType, {x = petPos.x + attacks[myAttack].range*lookDirs[lookDir].x, y = petPos.y + attacks[myAttack].range*lookDirs[lookDir].y, z = petPos.z}, attacks[myAttack].area, math.floor(damage.minD*-1*attacks[myAttack].offensive), math.floor(damage.maxD*-1*attacks[myAttack].offensive), attacks[myAttack].combatAni)
							else
								attacks[myAttack].theFunction({cid = cid, words = words, param = param})
							end
							doCreatureSay(daPet, '' .. param .. '!', TALKTYPE_ORANGE_1)
							if getPlayerStorageValue(cid, storages.petIsHealing) == 0 or getPlayerStorageValue(cid, storages.petIsHealing) == -1 then
								addEvent(addMana, manaGainTicks, {cid = cid})
								setPlayerStorageValue(cid, storages.petIsHealing, 1)
							end
							setPlayerStorageValue(cid, storages.petExha, CRONOMETRO2+1)
							setPlayerStorageValue(cid, storages.petManaSpent, getPlayerStorageValue(cid, storages.petManaSpent) + attacks[myAttack].manaSpent)
							setPlayerStorageValue(cid, storages.petMana, getPlayerStorageValue(cid, storages.petMana) - attacks[myAttack].manaSpent)
							if getPetMlvl(getPlayerStorageValue(cid, storages.petManaSpent)) > getPlayerStorageValue(cid, storages.petMag) then
								setPlayerStorageValue(cid,  storages.petMag, getPetMlvl(getPlayerStorageValue(cid, storages.petManaSpent)))
								doCreatureSay(daPet, 'You advanced to magic level ' .. getPlayerStorageValue(cid, storages.petMag) .. '!', TALKTYPE_ORANGE_1)
							end
						else
							doCreatureSay(daPet, '' .. frases[math.random(1, #frases)] .. '!', TALKTYPE_ORANGE_1)
						end
					else
						doCreatureSay(daPet, 'My magic level is too low!', TALKTYPE_ORANGE_1)
					end
				else
					doCreatureSay(daPet, 'AAh Im out of mana!', TALKTYPE_ORANGE_1)
				end
			else
				doCreatureSay(daPet, 'Woups! I can\'t use that spell yet', TALKTYPE_ORANGE_1)
			end				
		else
			----------------special attacks ?----------------------
		end
	else
		doPlayerSendCancel(cid, 'You must spesific a spell.')
	end
else
	doPlayerSendCancel(cid, 'You haven\'t call your <span class="highlight">pet</span>!.')
end
return setExhausted(cid)
end