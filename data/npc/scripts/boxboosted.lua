local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function Saffari(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end

local pokeball = {12832} -- whit this pokeballs you CANT enter in the quest.
for i = 1, #pokeball do
if getPlayerItemCount(cid, pokeball[i]) >= 1 then
npcHandler:say('Deposit your Master Ball on the DP!', cid)
return true
end
end
if parameters.premium == false and not isPremium(cid) then
npcHandler:say('Sorry, you need to be premium account!', cid)
return true
elseif doPlayerRemoveMoney(cid, parameters.price) == FALSE then
npcHandler:say('Sorry, you dont have enought money!', cid)
return true
end
doPlayerSendTextMessage(cid,22,'Good Luck!.')
doTeleportThing(cid, parameters.enter)
npcHandler:resetNpc()
return true
end
local node1 = keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Nessa {quest} possui monstros muito fortes voc� esta pronto para enfrenta-los?? Se estiver com Masterball deixe-a no CP....ah voc� so tem 60 minutos de tempo para realizar essa quest diga yes'})
node1:addChildKeyword({'yes'}, Saffari, {premium = no,price = 0,enter = {x=85, y=1351, z=8}, exit = {x=1049, y=1045, z=7}, minutes = 60})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
npcHandler:addModule(FocusModule:new())