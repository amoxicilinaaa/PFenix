function onUse(cid, item, frompos, item2, topos) 
    if isWatchingTv(cid) then 
        return true 
    end

    local quemMatou = getItemAttribute(item.uid, "corpseowner")
    if quemMatou then
        local player = getCreatureByName(quemMatou)
        if isPlayer(player) then
            local isInPartyWithPlayer = false
            if isInParty(cid) and isInParty(player) then
                isInPartyWithPlayer = isPartyEquals(player, cid)
            end

            if getCreatureName(cid) ~= getCreatureName(player) and not isInPartyWithPlayer then
                doPlayerSendCancel(cid, "Você não pode abrir um loot que não é seu.")    
                return true
            end
        end
    end

    local autoLootList = getAllItensInMyList(cid)
    local bag = getPlayerSlotItem(cid, 3).uid
    local itemsToRemove = {}
    local items = {}

    if isCollectAll(cid) then
        for a = 0, getContainerSize(item.uid) do
            local it = getContainerItem(item.uid, a)
            if it.uid > 0 then
                if addItemInFreeBag(bag, it.itemid, it.type) ~= false then
                    table.insert(itemsToRemove, it.uid)
                    table.insert(items, {i = it.itemid, q = it.type}) -- Adicionando o item na lista de itens a enviar
                end
            end
        end
    end

    if #autoLootList > 0 and not isCollectAll(cid) then
        for a = 0, getContainerSize(item.uid) do
            local it = getContainerItem(item.uid, a)
            if it.uid > 0 then
                for i = 1, #autoLootList do 
                    if getItemInfo(it.itemid).name == autoLootList[i] then
                        if addItemInFreeBag(bag, it.itemid, it.type) ~= false then
                            table.insert(itemsToRemove, it.uid)
                            table.insert(items, {i = it.itemid, q = it.type}) -- Adicionando o item na lista de itens a enviar
                        end
                    end
                end
            end
        end
    end

    if #itemsToRemove > 0 then
        for i = 1, #itemsToRemove do
            doChangeTypeItem(itemsToRemove[i], 0)
        end
    end

    if #items > 0 then
        local itemsToSend = {}
        for y = 1, #items do
            local lootidclient = getItemInfo(items[y].i).clientId
            if lootidclient then
                table.insert(itemsToSend, lootidclient .. "-" .. items[y].q)
                doPlayerAddItemStacking(cid, items[y].i, items[y].q)
               -- print("Item enviado para o jogador: " .. items[y].i .. " Quantidade: " .. items[y].q)
            else
               -- print("Erro: clientId para o item " .. items[y].i .. " não encontrado.")
            end
        end

        -- Corrigir a formatação da string antes de enviar
        local buffer = table.concat(itemsToSend, "-")
        if string.sub(buffer, -1) == "-" then
            buffer = string.sub(buffer, 1, -2) -- Remover o último hífen
        end

        --print("Enviando itens para a tela do jogador.")
        doSendPlayerExtendedOpcode(cid, 60, buffer)
        return true
    else
        --print("Nenhum item para exibir.")
        return false
    end
end
