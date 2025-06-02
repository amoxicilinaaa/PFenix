local vaultStorage = 99991 -- storage em que ficara armazenado os golds

------------------//* Functions //-------------------
local function getPlayerFreeSpace(cid) -- by MaTTch
    local checkSlots, space = {3,5,6,10}, 0
    local function getContainerFree(container)
        local free = 0
        if(not isContainer(container.uid)) then
            return free
        end
        for i = 0, (getItemInfo(container.itemid).maxItems -1) do
            local item = getContainerItem(container.uid, i)
            if(item.itemid == 0) then
                free = free + 1
            elseif(isContainer(item.uid)) then
                free = free + getContainerFree(item)
            end
        end
        return free
    end
    for _, i in ipairs(checkSlots) do
        local slotItem = getPlayerSlotItem(cid, i)
        if(i ~= CONST_SLOT_BACKPACK and slotItem.itemid == 0) then
            space = space + 1
        elseif(isContainer(slotItem.uid)) then
            space = space + getContainerFree(slotItem)
        end
    end
    return space
end

local function withdrawMoneySecurity(cid, value, storage) -- by MaTTch
    local storageMoney, countValue = getPlayerStorageValue(cid, storage), 0
    local config = {
	
        [1] = {ITEM_CRYSTAL_COIN, math.floor(value/getItemInfo(ITEM_CRYSTAL_COIN).worth)},
        [2] = {ITEM_PLATINUM_COIN, math.floor((value/getItemInfo(ITEM_PLATINUM_COIN).worth)-(math.floor(value/getItemInfo(ITEM_CRYSTAL_COIN).worth)*100))},
        [3] = {ITEM_GOLD_COIN, math.floor(value%100)}
    }
    for i = 1, #config do
        local count = config[i][2]
        if(count > 0) then
            while(count > 0) do
                storageMoney = getPlayerStorageValue(cid, storage)
                local a, itemCap = count > 100 and 100 or count, getItemInfo(config[i][1]).weight
                if(getPlayerFreeCap(cid) >= (itemCap*a)) then
                    if(getPlayerFreeSpace(cid) >= 1) then
                        doPlayerAddItem(cid, config[i][1], a)
                        setPlayerStorageValue(cid, storage, (storageMoney - (getItemInfo(config[i][1]).worth * a)))
                        countValue = countValue + (getItemInfo(config[i][1]).worth * a)
                        count = count - a
                    else
                        return doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You do not have enough space in container. You have took "..countValue.." gold"..(countValue > 1 and "s" or "").." from vault.")
                    end
                else
                    return doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You do not have enough cap. You have took "..countValue.." gold"..(countValue > 1 and "s" or "").." from vault.")
                end
            end
        end
    end
    return doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have took "..countValue.." gold"..(countValue > 1 and "s" or "").." from vault.")
end
------------------//* End Functions //-------------------


function onUse(cid, item, fromPosition, itemEx, toPosition)
    local cidMoney, vaultMoney = getPlayerMoney(cid), getPlayerStorageValue(cid, vaultStorage)
    if(vaultMoney <= 0) then
        if(cidMoney <= 0) then
            return doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You do not have money.")
        end
        doPlayerRemoveMoney(cid, cidMoney)
        setPlayerStorageValue(cid, vaultStorage, cidMoney)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have added "..cidMoney.." gold"..(cidMoney > 1 and "s" or "").." to vault. Now your money is kept in the vault chest, you can take it whenever you want.")
    else
        withdrawMoneySecurity(cid, vaultMoney, vaultStorage)
    end
    return true
end