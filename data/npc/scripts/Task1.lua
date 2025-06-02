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
["Paulo"] = {{"Magmortar", 10}, {"Magmar", 15}, {"Charizard", 20}},
}
       
        if msgcontains(msg, 'task') or msgcontains(msg, 'tarefa') then
           if isMyTaskComplete(cid, getNpcCid()) then
              selfSay("Devolve Meu Revorve Você Ja Completou a tarefa ta ligado não", cid)
              doPlayerAddItem(cid, 20900, 1)  --premio
              local sto = getMyTaskSto(cid, getNpcCid())
              setPlayerStorageValue(cid, sto, -1)
              talkState[talkUser] = 0
              return true
           else
              selfSay("Ta Ligado Que Você Tem Que Matar {10 Magmortar, 15 Magmar e 20 Charizards}, aceita isso ae seu bucetudo??", cid)
              talkState[talkUser] = 2  
           end   
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 2 then
           if getMyTaskSto(cid, getNpcCid()) ~= -1 then
              selfSay("Você Ja Esta Fazendo Minha Tarefa,Paa Seu Bucet...", cid)
              talkState[talkUser] = 0
              return true
           end
           local sto = getFreeTaskStorage(cid)
           if sto == -1 then 
              selfSay("Você não pode pegar mais tarefas! Você já está com o máximo de "..(maxTasks).." tarefas!", cid)
              talkState[talkUser] = 0
              return true
           end
                  
           selfSay("Vai Matar Seus Alvos Com o Revorve", cid)
           setStorageArray(cid, sto, task)
           talkState[talkUser] = 0
           return true
        end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             