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

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if msgcontains(msg, 'torneio') or msgcontains(msg, 'enter') then


selfSay('Você quer entrar no torneio por 10 HDS?', cid)
talkState[talkUser] = 2


elseif talkState[talkUser] == 2 then

if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then

if getPlayerItemCount(cid, torneio.revivePoke) >= 1 then
selfSay('Desculpa você não pode entrar com: {revives},{potions} ou {robos} porfavor tire para poder entrar no torneio.', cid)
return false
end

if getPlayerItemCount(cid, 12345) >= 1 then
selfSay('Desculpa você não pode entrar com: {revives},{potions} ou {robos}. Por favor retire todos para poder entrar no torneio.', cid)
return false
end

if getPlayerItemCount(cid, 12346) >= 1 then
selfSay('Desculpa você não pode entrar com: {revives},{potions} ou {robos} porfavor tire para poder entrar no torneio.', cid)
return false
end

if getPlayerItemCount(cid, 12347) >= 1 then
selfSay('Desculpa você não pode entrar com: {revives},{potions} ou {robos} porfavor tire para poder entrar no torneio.', cid)
return false
end

if getPlayerItemCount(cid, 12348) >= 1 then
selfSay('Desculpa você não pode entrar com: {revives},{potions} ou {robos} porfavor tire para poder entrar no torneio.', cid)
return false
end

if getPlayerItemCount(cid, 22096) >= 1 then
selfSay('Desculpa você não pode entrar com: {revives},{potions} ou {robos} porfavor tire para poder entrar no torneio.', cid)
return false
end

if getPlayerItemCount(cid, 22097) >= 1 then
selfSay('Desculpa você não pode entrar com: {revives},{potions} ou {robos} porfavor tire para poder entrar no torneio.', cid)
return false
end

if getPlayerItemCount(cid, 22098) >= 1 then
selfSay('Desculpa você não pode entrar com: {revives},{potions} ou {robos} porfavor tire para poder entrar no torneio.', cid)
return false
end

if os.date("%X") < torneio.startHour or os.date("%X") > torneio.endHour then
selfSay('As incrições para o torneio ja fechou.', cid)
return true
end

if doPlayerRemoveMoney(cid, torneio.price) and getPlayerItemCount(cid, torneio.revivePoke) == 0 then
doTeleportThing(cid, torneio.waitPlace)
else

selfSay('Você não tem dinheiro para entrar no torneio ou esta com revive, é preciso ter 10 HDS para poder entrar no torneio', cid)
end
else
selfSay('Você não quer participar do torneio? Ok,vejo você na próxima vez!', cid)
talkState[talkUser] = 0
end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())