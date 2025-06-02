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
 
-- Conversa Jogador/NPC  
if(msgcontains(msg, 'offer') or msgcontains(msg, 'Offer')) then
selfSay('Eu vendo {Yellow Rose Plant}, {Pink Rose Plant}, {Red Rose Plant}, {Flowering Shrub}, {Ornamented Plant}, {Xerophytic Plant}.', cid) 
elseif(msgcontains(msg, 'Yellow Rose Plant') or msgcontains(msg, 'yellow rose plant')) then
selfSay('A Yellow Rose Plant custa 75 hd, quer comprar?', cid) 
talkState[talkUser] = 1 
elseif(msgcontains(msg, 'Pink Rose Plant') or msgcontains(msg, 'pink rose plant')) then
selfSay('A Pink Rose Plant custa 75 hd, quer comprar?', cid) 
talkState[talkUser] = 2    
elseif(msgcontains(msg, 'Red Rose Plant') or msgcontains(msg, 'red rose plant')) then
selfSay('A Red Rose Plant custa 75 hd, quer comprar?', cid) 
talkState[talkUser] = 3    
elseif(msgcontains(msg, 'Flowering Shrub') or msgcontains(msg, 'flowering shrub')) then
selfSay('A Flowering Shrub custa 85 hd, quer comprar?', cid) 
talkState[talkUser] = 4     
elseif(msgcontains(msg, 'Ornamented Plant') or msgcontains(msg, 'ornamented plant')) then
selfSay('A Ornamented Plant custa 80 hd, quer comprar?', cid) 
talkState[talkUser] = 5         
elseif(msgcontains(msg, 'Xerophytic Plant') or msgcontains(msg, 'xerophytic plant')) then
selfSay('A Xerophytic Plant custa 60 hd, quer comprar?', cid) 
talkState[talkUser] = 6   
 
-- Confirmação da Compra  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then  
if(doPlayerRemoveItem(cid, 2160, 75) == true) then  
selfSay('Obligado!', cid) 
doPlayerAddItem(cid, 23129, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem  dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then  
if(doPlayerRemoveItem(cid, 2160, 75) == true) then
selfSay('Obligado!', cid) 
doPlayerAddItem(cid, 23130, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem  dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then 
if(doPlayerRemoveItem(cid, 2160, 75) == true) then
selfSay('Obligado!', cid) 
doPlayerAddItem(cid, 23131, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem  dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then 
if(doPlayerRemoveItem(cid, 2160, 85) == true) then
selfSay('Obligado!', cid) 
doPlayerAddItem(cid, 23132, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem  dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then 
if(doPlayerRemoveItem(cid, 2160, 80) == true) then
selfSay('Obligado!', cid) 
doPlayerAddItem(cid, 23133, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem  dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then 
if(doPlayerRemoveItem(cid, 2160, 60) == true) then
selfSay('Obligado!', cid) 
doPlayerAddItem(cid, 23134, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem  dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end
end
return TRUE
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())