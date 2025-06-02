local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local itemid = 22049 -- Novos points ( default é scarab coin )
local shopWindow = {}
local t = {
 [20897] = {price = 500},
 }
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
if  t[item] and getPlayerItemCount(cid, itemid) < t[item].price then
selfSay("you do not have "..t[item].price.." Nugget Coins.", cid)
else
doPlayerAddItem(cid, item)
doPlayerRemoveItem(cid, itemid, (t[item].price))
selfSay("Here you item", cid)
  end
return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
for var, ret in pairs(t) do
table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
end
openShopWindow(cid, shopWindow, onBuy, onSell)
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())