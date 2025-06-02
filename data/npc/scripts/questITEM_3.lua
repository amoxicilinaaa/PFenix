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
   local need = {
      {id = 12161, qt = 1000}, --water gem
	  {id = 12170, qt = 100}, -- water pendant
   }
   local rewards = {
      {id = 11442, qt = 3}, --water stone
   }
   local stoFinish = 92091
   ---------
   
   if msgcontains(msg, 'help') or msgcontains(msg, 'quest') then
      if getPlayerStorageValue(cid, stoFinish) >= 1 then
         selfSay("Desculpe, voca ja fez essa missao.", cid)
         talkState[talkUser] = 0
         return true
      end
      selfSay("Ola, meu amigo, voce pode me trazer: 1000 Water Gem e 100 Water Pendant? Eu recompensarei você!",cid)
      talkState[talkUser] = 1
      return true 
   elseif msgcontains(msg, 'yes') or msgcontains(msg, 'sim') and talkState[talkUser] == 1 then
      if getPlayerItemCount(cid, need[1].id) < need[1].qt or getPlayerItemCount(cid, need[2].id) < need[2].qt then
         selfSay("Voce nao trouxe para mim todos os itens que eu pedi ...", cid)
         selfSay("Lembre-se, voce precisa me trazer 1000 Water Gem e 100 Water Pendant ...", cid)
         talkState[talkUser] = 0
         return true
      end
      for i = 1, #need do
          doPlayerRemoveItem(cid, need[i].id, need[i].qt)
      end
      for i = 1, #rewards do
          doPlayerAddItem(cid, rewards[i].id, rewards[i].qt)
		                doPlayerAddExperience(cid, 10000)
      end
	  selfSay("thanks you, bye!", cid)
      setPlayerStorageValue(cid, stoFinish, 1)
      talkState[talkUser] = 0
      return true
   end
   return true
end       
                    
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
   