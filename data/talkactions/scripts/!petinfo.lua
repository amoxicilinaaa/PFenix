dofile("./petConfig.lua")
function onSay(cid, words, param)
if isExhausted(cid) == 1 then
	return 0
end
local request = 0
local daPet = getPlayerStorageValue(cid, storages.petUid)
if isCreature(daPet) == 1 then
	param = string.lower(param)
	if param == "lv" then
		request = getPlayerStorageValue(cid, storages.petLevel)
			elseif param == "ml" then
		request = getPlayerStorageValue(cid, storages.petMag)
	elseif param == "mana" then		
		request = getPlayerStorageValue(cid, storages.petMana)
	elseif param == "health" then
		request = getCreatureHealth(daPet)
	end
	if request ~= 0 then
		doPlayerSendTextMessage(cid, 19, 'Pet' .. param .. ': ' .. request .. '.')
	end
else
	doPlayerSendCancel(cid, 'You haven\'t call your <span class="highlight">pet</span>!')
end
return setExhausted(cid)
end