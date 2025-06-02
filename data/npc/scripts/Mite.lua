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

--//
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
local moveis = {
--[msg] = {id q vai add, qnt money custa},
["black freezer"] = {11489, 500},
["black stove"] = {11408, 500},
["big black television"] = {11395, 1000},
["black plasma television"] = {11397, 3000},
["play2"] = {11455, 3000},
["pc preto"] = {11466, 1000},

}
local package = 13824 --id do package aki
--//

if (msgcontains(msg, 'moveis') or msgcontains(msg, 'mooveis')) then  
   selfSay("digite {trade} para ver as ofertas.", cid)
   talkState[talkUser] = 2
   return true
elseif (msgcontains(msg, 'trade') or msgcontains(msg, 'comprar'))  and talkState[talkUser] == 2 then
   selfSay("The mobile I have to sell it are: {black freezer, black stove, big black television, black plasma television, play2, Pc preto} What is it you want to buy?", cid)
   talkState[talkUser] = 2
elseif moveis[msg] and talkState[talkUser] == 2 then
   TABLE = moveis[msg]
   selfSay("Ok, quantos você quer? ...", cid)
   talkState[talkUser] = 3
elseif tonumber(msg) and tonumber(msg) >= 1 and talkState[talkUser] == 3 then
   qnt = tonumber(msg)
   if qnt == 1 then
      selfSay("Hum .. Vai custar "..TABLE[2].."dolar(s), tem certeza que quer comprar??", cid)
   else
      selfSay("Hum .. Vai custar "..TABLE[2]*qnt.."dolar(s), tem certeza que quer comprar?", cid)
   end
   talkState[talkUser] = 4
elseif (msgcontains(msg, "yes") or msgcontains(msg, "sim")) and talkState[talkUser] == 4 then
   if doPlayerRemoveMoney(cid, (TABLE[2]*qnt)*100) then 
      for i = 1, qnt do     
          local pack = doPlayerAddItem(cid, package, 1)
          doSetItemAttribute(pack, "movel", TABLE[1])
      end
      selfSay("Moveis, trivago!", cid)  
   else
      selfSay("Sorry, but you do not have enough money!", cid)
   end
   talkState[talkUser] = 0
   return true
elseif msgcontains(msg, 'no') then
   selfSay("Ok then, tell me again what you want...", cid)
   talkState[talkUser] = 0
   return true 
end 
return true
end       
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())         