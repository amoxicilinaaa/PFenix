dofile("./petConfig.lua")
function onSay(cid, words, param)

if isExhausted(cid) == 1 then
	return 0
end
local mySto = 0
local daPet = getPlayerStorageValue(cid, storages.petUid)
if isCreature(daPet) == 1 then
	local pos = getCreaturePosition(daPet)
	local a = 1
	while a < 10 do
		if getItemWeight(getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = a}).itemid, 1) ~= 0  then
			break
		end
		a = a + 1
	end
	local carryingItem = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = a})
	if getItemWeight(carryingItem.itemid, 1) ~= 0 then
		if isContainer(carryingItem.uid) == 0 then
			for b = 1, #petItems do
				if getPlayerStorageValue(cid, petItems[b]) == 0 or getPlayerStorageValue(cid, petItems[b]) == -1 then
					mySto = b
					break
				end
			end
			local count = 1
			if mySto ~= 0 then
				local theID = carryingItem.itemid
				if isItemStackable(theID) == 1 then
					count = carryingItem.type
					doRemoveItem(carryingItem.uid, carryingItem.type)
				else
					doRemoveItem(carryingItem.uid, 1)
				end
				setPlayerStorageValue(cid, petItems[mySto], theID*100+count)
				if count == 1 then
					doCreatureSay(daPet, 'Hmm, a ' .. getItemName(theID) .. ', I\'ll save it on my bag number ' .. mySto .. '!', TALKTYPE_ORANGE_1)
				else
					doCreatureSay(daPet, 'Hmm, ' .. count .. ' ' .. getItemName(theID) .. 's, I\'ll save them on my bag number ' .. mySto .. '!', TALKTYPE_ORANGE_1)
				end
			else
				doCreatureSay(daPet, 'I have no space!', TALKTYPE_ORANGE_1)
			end
		else
			doCreatureSay(daPet, 'I can\'t take containers!', TALKTYPE_ORANGE_1)
		end
	else
		doCreatureSay(daPet, 'I can\'t see any item!', TALKTYPE_ORANGE_1)
	end
else
	doPlayerSendCancel(cid, 'You haven\'t call your <span class="highlight">pet</span>!')
end
return setExhausted(cid)
end