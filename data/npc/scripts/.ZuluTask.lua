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
["Zulu"] = {{"Venusaur", 100}, {"Ivysaur", 75}},
}
       
        if msgcontains(msg, 'task') or msgcontains(msg, 'Task') then
           if isMyTaskComplete(cid, getNpcCid()) then
              selfSay("Uau, você já completou a minha tarefa! Ok então, pegue a sua recompensa!", cid)
              doPlayerAddExperience(cid, 1500000)  --premio
              doPlayerAddItem(cid, 2160, 10)
              local sto = getMyTaskSto(cid, getNpcCid())
              setPlayerStorageValue(cid, sto, -1)
              setPlayerStorageValue(cid, 181603, 1) --storage da outfit
              talkState[talkUser] = 0
              return true
           else
              selfSay("Então, é uma tarefa simples, eu quero que você mate {100 Venusaur, 75 Ivysaur,}, Você aceita a tarefa?", cid)
              talkState[talkUser] = 2  
           end     
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 2 then
           if getMyTaskSto(cid, getNpcCid()) ~= -1 then
              selfSay("Você já está fazendo a minha tarefa! Vá acabar com isso", cid)
              talkState[talkUser] = 0
              return true
           end
           local sto = getFreeTaskStorage(cid)
           if sto == -1 then 
              selfSay("Você não pode pegar mais tarefas! Você já está com o máximo de "..(maxTasks).." tarefas!", cid)
              talkState[talkUser] = 0
              return true
           end
                  
           selfSay("OK, então... Vá matar seus alvos!", cid)
           setStorageArray(cid, sto, task)
           talkState[talkUser] = 0
           return true
        end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             