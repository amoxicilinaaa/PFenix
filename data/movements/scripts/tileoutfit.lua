local female = {lookType = 1408, lookHead = 79, lookBody = 91, lookLegs = 91, lookFeet = 91, lookTypeEx = 0, lookAddons = 3} -- Outfit Female
local male = {lookType = 1407, lookHead = 86, lookBody = 86, lookLegs = 86, lookFeet = 86, lookTypeEx = 0, lookAddons = 3} -- Outfit Male

function onStepIn(cid, item, position, fromPosition)
    if getPlayerStorageValue(cid, 30211) == 1 then
        return true
    end
    if isPlayer(cid) then
        local outfit = getCreatureOutfit(cid)
        local out = getPlayerSex(cid) == 0 and female or male
        setPlayerStorageValue(cid, 30211, 1)
        doChangeSpeed(cid, -getCreatureSpeed(cid))
        doChangeSpeed(cid, 1000)
        doSetCreatureOutfit(cid, {lookType = out, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, 1)
        end
end
function onStepOut(cid, item, position, fromPosition)
    if isPlayer(cid) then
        setPlayerStorageValue(cid, 30211, -1)
        doChangeSpeed(cid, -getCreatureSpeed(cid))
        doRegainSpeed(cid)
        doRemoveCondition(cid, CONDITION_OUTFIT)
    end
end