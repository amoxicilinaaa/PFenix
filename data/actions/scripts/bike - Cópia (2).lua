local strgs = {17000, 17001} -- Coloque a Storage de Controle dos Sistemas Que Deseja Bloquear.
local config = {
    outfitMale = 2099, -- Outfit male
    outfitFemale = 2098, -- Outfit female
    storageValue = 32001, -- Storage Para a bike
}
 
function onUse(cid, item, itemEx, fromPosition, toPosition)
    ctrl = 0
    for x = 1, #strgs do
        if getPlayerStorageValue(cid, strgs[x]) > 0 then
            ctrl = ctrl + 1
        end
    end
    if ctrl < 1 then
        if isPlayer(cid) and getCreatureOutfit(cid).lookType == 814 then
            return false
        end
        if getPlayerStorageValue(cid, config.storageValue) <= 0 then
            local a = {lookType = config.outfitMale, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
            local b = {lookType = config.outfitFemale, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
            setPlayerStorageValue(cid, 32001, ""..getPlayerStamina(cid).."")
			doChangeSpeed(cid, 1 * 500)
            setPlayerStorageValue(cid, config.storageValue, 1)        
            if getPlayerSex(cid) == 0 then
                doSetCreatureOutfit(cid, b, -1)
            else
                doSetCreatureOutfit(cid, a, -1)
            end
        else
            setPlayerStorageValue(cid, config.storageValue, 0)
            doRemoveCondition(cid, CONDITION_OUTFIT)
			doChangeSpeed(cid, 1 * -500)
        end
    else
        doPlayerSendCancel(cid, "Voc� n�o pode usar bike enquanto est� no Fly/Hide.")
    end
return true
end