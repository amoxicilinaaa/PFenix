dofile("./petConfig.lua")



function doPlayerAddSummon(cid, name, pos)
local MyCreature = doSummonCreature(name, pos)	
doConvinceCreature(cid, MyCreature)
return MyCreature
end


local myPet = ""
local myPetUid = 0

function onSay(cid, words, param)

if isExhausted(cid) == 1 then
	return 0
end
if getPlayerStorageValue(cid, storages.petMag) == -1 then
	setPlayerStorageValue(cid, storages.petMag, 0)
end
if isCreature(getPlayerStorageValue(cid, storages.petUid)) == 0 then
	if getTilePzInfo(getCreaturePosition(cid)) == 0 then
		if getPlayerStorageValue(cid, storages.petIsOnline) == 1 or getPlayerStorageValue(cid, storages.petIsOnline) == -1 then
			for i = 1, #pets do
				if isInArray(pets[i].vocations, getPlayerVocation(cid)) == 1 then
					for k = 1, #pets[i].pets do							
						if pets[i].pets[k].level <= getPlayerLevel(cid) then
							myPet = pets[i].pets[k].name
							break
						end
					end
				break
				end
			end
			myPetUid = doPlayerAddSummon(cid, myPet, getCreaturePosition(cid))
			if myPetUid ~= -1 then
				setPlayerStorageValue(cid, storages.petUid, myPetUid)
				if getPlayerStorageValue(cid, storages.petDamage) ~= 0 and getPlayerStorageValue(cid, storages.petDamage) ~= -1  then
					if getPlayerStorageValue(cid, storages.petDamage) < getCreatureMaxHealth(getPlayerStorageValue(cid, storages.petUid)) then
						doCreatureAddHealth(getPlayerStorageValue(cid, storages.petUid), getPlayerStorageValue(cid, storages.petDamage)*-1)
					end
				end
				doChangeSpeed(myPetUid, getCreatureBaseSpeed(cid) - getCreatureBaseSpeed(myPetUid))
				doCreatureSay(myPetUid, 'Hello!', TALKTYPE_ORANGE_1)
				addMana({cid = cid})
				setPlayerStorageValue(cid, storages.petIsOnline, 2)
			else
				doPlayerSendCancel(cid, 'Not enought room.')
			end
		else			
			doPlayerSendCancel(cid, 'Your <span class="highlight">pet</span> died! You have to revive it.')
		end
	else
		doPlayerSendCancel(cid, 'You cannot summon your <span class="highlight">pet</span> in PZ.')
	end		
else
local daPet = getPlayerStorageValue(cid, storages.petUid)
	setPlayerStorageValue(cid, storages.petDamage, getCreatureMaxHealth(daPet) - getCreatureHealth(daPet))
	doCreatureSay(daPet, 'Byebye !', TALKTYPE_ORANGE_1)
	setPlayerStorageValue(cid, storages.petIsOnline, 1)
	doSendMagicEffect(getCreaturePosition(daPet), CONST_ME_POFF)
	doRemoveCreature(daPet)
end
return setExhausted(cid)
end