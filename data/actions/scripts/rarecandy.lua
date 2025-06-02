function onUse(cid, item, frompos, item2, topos)
 
local cfg = {
    qnt = 1,       --Quantos boosts o pokémon irá receber.
    max = 100,      --Boost máximo do seu servidor.
    chance = 50,   --Chance de falhar, em %
    boost_fail = 50,  --A partir de quantos boosts poderá falhar. 
}
 
local addHealth = 700 -- (Vida que vai heala do Pokemon)
local myball = getPlayerSlotItem(cid, 8).uid
local summon = getCreatureSummons(cid)[1]
local boost = getItemAttribute(myball, "boost") or 0
 
    if myball <= 0 then
        return doPlayerSendCancel(cid, "Coloque um pokemon no Main Slot!")
    elseif #getCreatureSummons(cid) <= 0 then
        return doPlayerSendCancel(cid, "Voce precisa estar usando seu pokemon para conseguir boosta-lo!")
    elseif boost >= cfg.max then
        return doPlayerSendCancel(cid, "Seu pokemon ja se encontra no nivel maximo de boost!")
    end
    
    if boost >= cfg.boost_fail then
        if math.random(1, 100) <= cfg.chance then
            doItemSetAttribute(myball, "boost", (boost + cfg.qnt))
            doCreatureAddHealth(getCreatureSummons(cid)[1], addHealth)
            doSendAnimatedText(getThingPos(summon), "+1 BOOST", 215)
            doPlayerSendTextMessage(cid, 27, "Seu pokemon evoluiu do nivel [+"..tonumber(boost).."] de boost para o nivel [+"..tonumber(boost + 1).."].")
            doRemoveItem(item.uid, 1)
        else
            doSendAnimatedText(getThingPos(summon), "Fail!", 215)
            doPlayerSendTextMessage(cid, 27, "Sua Rare Candy falhou!")
            doRemoveItem(item.uid, 1)
        end
    else
 
        doItemSetAttribute(myball, "boost", (boost + cfg.qnt))
        doCreatureAddHealth(getCreatureSummons(cid)[1], addHealth)
        doSendAnimatedText(getThingPos(summon), "+1 BOOST", 215)
        doPlayerSendTextMessage(cid, 27, "Seu pokemon evoluiu do nivel [+"..tonumber(boost).."] de boost para o nivel [+"..tonumber(boost + 1).."].")
        doRemoveItem(item.uid, 1)
    end
    return true
end