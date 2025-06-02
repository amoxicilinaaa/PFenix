local stoneEffect = {
    ["fire stone"] = 699,
    ["water stone"] = 700,
    ["leaf stone"] = 701,
    ["heart stone"] = 702,
    ["thunder stone"] = 703,
    ["venom stone"] = 704,
    ["enigma stone"] = 705,
    ["rock stone"] = 706,
    ["earth stone"] = 707,
    ["ice stone"] = 708,
    ["darkness stone"] = 709,
    ["punch stone"] = 710,
    ["cocoon stone"] = 711,
    ["metal stone"] = 712,
    ["ancient stone"] = 713,
    ["crystal stone"] = 714,
    ["feather stone"] = 715,
}

local function func(cid, position, corpseid)
    if not isCreature(cid) then return true end

    local corpse = getTileItemById(position, corpseid).uid
    if corpse <= 1 or not isContainer(corpse) then return true end

    for slot = 0, (getContainerSize(corpse) - 1) do
        local item = getContainerItem(corpse, slot)
        if item.uid > 1 and isStone(item.itemid) then
            local itemName = getItemNameById(item.itemid):lower()
            local effect = stoneEffect[itemName]
            if effect then
                local posCorpse = getThingPos(item.uid)
                if posCorpse then
                    -- Efeitos na posição do item
                    doSendMagicEffect(posCorpse, effect)
                    doSendMagicEffect(posCorpse, 169)

                    -- Efeito e mensagem no jogador
                    local playerWinner = getCreatureMaster(cid)
                    if isPlayer(playerWinner) then
                        local playerPos = getThingPos(playerWinner)
                        doSendMagicEffect(playerPos, 173)
                        doPlayerSendTextMessage(playerWinner, MESSAGE_STATUS_CONSOLE_BLUE, "Parabéns! Você recebeu uma " .. itemName .. "!")
                    end

                    -- Efeito adicional com atraso
                    posCorpse.x = posCorpse.x + 0
                    posCorpse.y = posCorpse.y + 0
                    addEvent(doSendMagicEffect, 2000, posCorpse, 761)
                else
                    print("[Error] getThingPos returned false for item:", item.uid)
                end
            else
                print(string.format("[Error] Nenhum efeito encontrado para a pedra: %s", itemName))
            end
        end
    end
end

function onKill(cid, target, lastHit)
    if not ehMonstro(target) then return true end

    local corpse = getMonsterInfo(getCreatureName(target)).lookCorpse
    addEvent(func, 5, getCreatureSummons(cid)[1], getThingPos(target), corpse)
    return true
end
