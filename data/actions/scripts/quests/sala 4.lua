local position = {x = 172, y = 462, z = 8} --posición al que quieres que lleve

function onUse(cid, item, item2, fromPosition, toPosition, itemEx, toPosition)
     if (getCreatureCondition(cid, CONDITION_INFIGHT) == FALSE) then
      doTeleportThing(cid, position)
        doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)

     else 
     doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
     doCreatureSay(cid, "Mate todos os pokes antes de ir para a proxima wave.", TALKTYPE_ORANGE_1)
     end
    return true
    end