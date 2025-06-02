local config = {
    boss = "aggron, Lairon",
    msg = "O teleport irá sumir em dois minutos.",
    timeToRemove = 120, -- Tempo para remover em segundos.
    teleport = { x = 796, y = 1413, z = 6 }, -- Local onde irá aparecer o TP.
    toteleport = { x = 447, y = 819, z = 13 } -- Local para onde o teleport irá mandar o player.
}

local function removal(position)
    position.stackpos = 1
    if (getThingfromPos(position).itemid == 1387) then
        doRemoveItem(getThingfromPos(position).uid)
    end
    return TRUE
end

function onKill(cid, target)
    if(isMonster(target) and string.lower(getCreatureName(target)) == config.boss) then
        doCreateTeleport(1387, config.toteleport, config.teleport)
        doCreatureSay(target, config.msg, TALKTYPE_ORANGE_1, 0, 0, getCreaturePosition(target))
        addEvent(removal, config.timeToRemove * 1000, config.teleport)
    end
    return true
end


