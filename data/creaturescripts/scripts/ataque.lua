function onAttack(cid, target, attacker, type, combat, value)

if isPlayer(target) and #getCreatureSummons(target) >= 1 then
doMonsterSetTarget(cid, getCreatureSummons(target)[1])
end

return true
end

function onCombat(cid, target)
    if isMonster(target) then
        if not isInArray(passivepokemons, getCreatureName(target)) then
            doCreatureSetStorage(target, "hostile", 1)
        end
        doMonsterSetTarget(target, cid)
    end
    return true
end