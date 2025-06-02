local effect = 169                                   --Efeito drop stone
local arrow = {169, 10}                    --Respectivamente, efeito e duração (segundos).
local items = {20904,20898,20899,20900,20901,20902,20903,20905,21079,21996,21997,21998,21999,22000,22001,22002,22003}          --Tabela para configurar os items.  (ID DOS ITEMS RAROS)
function sendEffect(pos, time)
    if time < 0 then
        return true
    end
    doSendMagicEffect(pos, arrow[1])
    addEvent(sendEffect, 1000, pos, time - 1)
end
local function func(cid, position, corpseid, effect)
    if not isCreature(cid) then return true end
    local corpse = getTileItemById(position, corpseid).uid
    if corpse <= 1 then return end
    if not isContainer(corpse) then return true end
    for slot = 0, (getContainerSize(corpse)-1) do                                     
        local item = getContainerItem(corpse, slot)                                   
        if item.uid <= 1 then return end
        if isInArray(items, item.itemid) then
            return doSendMagicEffect(getThingPos(cid), effect) and sendEffect(position, arrow[2])
        end
    end
end
function onKill(cid, target, lastHit)
 
    if not isMonster(target) then return true end
    local corpse = getMonsterInfo(getCreatureName(target)).lookCorpse
 
    addEvent(func, 5, getCreatureSummons(cid)[1], getThingPos(target), corpse, effect)
    return true
end