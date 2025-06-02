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
 
local task = {
["Roger"] = {{"Goldeen", 15}, {"Horsea", 15}, {"Magikarp", 25}},
}
       
        if msgcontains(msg, 'task') or msgcontains(msg, 'tarefa') then
           if isMyTaskComplete(cid, getNpcCid()) then
              selfSay("Uau, você já completou a minha tarefa! Ok então, pegue a sua recompensa!", cid)
              doPlayerAddExperience(cid, 100000)  --premio -- Quase 2 Leveis no nivel 131 ~~ 'testado'
              doPlayerAddItem(cid, 2160, 5)
              local sto = getMyTaskSto(cid, getNpcCid())
              setPlayerStorageValue(cid, sto, -1)
              setPlayerStorageValue(cid, 181605, 1) --storage da outfit
              talkState[talkUser] = 0
              return true
           else
              selfSay("Então, é uma tarefa simples, eu quero que você mate {15 Goldeens, 15 Horseas and 15 Magikarp}, Você aceita a tarefa?", cid)
              talkState[talkUser] = 2  
           end   
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 2 then
           if getMyTaskSto(cid, getNpcCid()) ~= -1 then
              selfSay("You are already doing my task! go end it!", cid)
              talkState[talkUser] = 0
              return true
           end
           local sto = getFreeTaskStorage(cid)
           if sto == -1 then 
              selfSay("Você não pode pegar mais tarefas! Você já está com o máximo de "..(maxTasks).." Tarefas!", cid)
              talkState[talkUser] = 0
              return true
           end
                  
           selfSay("OK então... Vá matar seus alvos!", cid)
           setStorageArray(cid, sto, task)
           talkState[talkUser] = 0
           return true
        end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             