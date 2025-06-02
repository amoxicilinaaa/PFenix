dofile("./petConfig.lua")
function onSay(cid, words, param)
if isExhausted(cid) == 1 then
	return 0
end
local daPet = getPlayerStorageValue(cid, storages.petUid)
if isCreature(daPet) == 1 then
	if param ~= "" then
		param = tonumber(param)
		if type(param) == "number" then
			if param <= maxItems then
				if getPlayerStorageValue(cid, petItems[param]) ~= 0 and getPlayerStorageValue(cid, petItems[param]) ~= -1 then
					local that = getPlayerStorageValue(cid, petItems[param])
					local item = math.floor(that/100)
					local count = that-item*100
					doPlayerAddItem(cid, item, count)
					if count == 1 then

if count > 1 then
doCreatureSay(daPet, 'Here are your ' .. count .. ' ' .. getItemName(item) .. 's', TALKTYPE_ORANGE_1)
else
doCreatureSay(daPet, 'Here is your ' .. getItemName(item) .. '', TALKTYPE_ORANGE_1)
end

					else
						doCreatureSay(daPet, 'Here are your ' .. count .. ' ' .. getItemName(item) .. 's', TALKTYPE_ORANGE_1)
					end
					setPlayerStorageValue(cid, petItems[param], 0)
				end
			end
		end
	end
end
return setExhausted(cid)
end