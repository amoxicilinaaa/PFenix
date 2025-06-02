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
msg = string.lower(msg)
---------
local configs = {
diamondsID = 22049,  --id do diamond no items.xml/otb... (achu q vais ter q criar, ou pegar algum item q ja tenha ae...)
SEX = {cost = 50},   --cost = custo para trocar de sexo...
}  


           
        if (msgcontains(msg, 'mudar') or msgcontains(msg, 'sex')) then
           selfSay("Então você quer mudar de sexo? Vai custar"..configs.SEX.cost.." Cepos De Madeira", cid) 
           talkState[talkUser] = 3
           return true
        
        elseif msgcontains(msg, 'yes') and talkState[talkUser] == 3 then
           if getPlayerItemCount(cid, configs.diamondsID) >= configs.SEX.cost then
              local sex = getPlayerSex(cid)
              selfSay("Ok então, agora você é do sexo "..(sex == 0 and "female" or "male")..". Apreciar!", cid)
              doPlayerSetSex(cid, (sex == 0 and 1 or 0))
              doPlayerRemoveItem(cid, configs.diamondsID, configs.SEX.cost)
              talkState[talkUser] = 0
              return true
           else
              selfSay("Você precisou pelo menos "..configs.SEX.cost.." Cepos De Madeira", cid)
              talkState[talkUser] = 0
              return true
           end
           
           
        elseif msgcontains(msg, 'yes') and talkState[talkUser] == 4 then
           selfSay("Ok then, tell me what city do you want?", cid)
           talkState[talkUser] = 5
           return true
           
        elseif places[msg] and talkState[talkUser] == 5 then
           if getPlayerItemCount(cid, configs.diamondsID) >= configs.TOWN.cost then
              selfSay("Done, enjoy your new city!", cid)
              doPlayerSetTown(cid, places[msg]) 
              doPlayerRemoveItem(cid, configs.diamondsID, configs.TOWN.cost)
              talkState[talkUser] = 0
              return true
           else
              selfSay("You need atleast "..configs.TOWN.cost.." diamonds to do that!", cid)
              talkState[talkUser] = 0
              return true
           end 
           
        elseif msgcontains(msg, 'no') then
          selfSay("Ok then, tell me again what you want...", cid)
          talkState[talkUser] = 0
          return true 
        end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             