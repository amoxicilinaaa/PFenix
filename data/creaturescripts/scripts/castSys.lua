function onLogout(cid)

if getPlayerStorageValue(cid, 12269) > 0 then
doPlayerSendCancel(cid, "To logout, you need to exit the Cast System first. Use the parameter '!cast exit'.")
return false
end

setPlayerStorageValue(cid, 10359, -1)
return true
end
function onAttack(cid, target)

return false

end

function onStatsChange(cid, attacker, type, combat, value)

if not isCreature(cid) then
return true
end

if getPlayerStorageValue(cid, 12269) >= 1 and isMonster(attacker) or isPlayer(attacker) then
return false
end

return true
end

function onAttack(cid, target)
return false
if not isPlayer(cid) or not isPlayer(target) then
return true
end

if getPlayerStorageValue(cid, 12269) > 0 then
doRemoveCondition(cid, CONDITION_INFIGHT)
return false
end

return true
end