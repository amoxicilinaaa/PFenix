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
selfSay('Eu vendo os helds: {X-Attack T1}, {X-Attack T2},{Y-Cure T1}, {Y-Cure T2}, {X-Return T1}, {X-Return T2}. Diga qual voce quer adquirir.', cid) 
elseif(msgcontains(msg, 'x-attack t1') or msgcontains(msg, 'X-Attack T1')) then
selfSay('O X-Attack T1, custa 250k (25 thd) voce deseja comprar?', cid) 
talkState[talkUser] = 1 
elseif(msgcontains(msg, 'x-attack t2') or msgcontains(msg, 'X-Attack T2')) then
selfSay('O X-Attack T2, custa 500k (50 thd) voce deseja comprar?', cid) 
talkState[talkUser] = 2
elseif(msgcontains(msg, 'y-cure t1') or msgcontains(msg, 'Y-Cure T1')) then
selfSay('O Y-Cure T1, custa 250k (25 thd) voce deseja comprar?', cid) 
talkState[talkUser] = 3
elseif(msgcontains(msg, 'y-cure t2') or msgcontains(msg, 'Y-Cure T2')) then
selfSay('O Y-Cure T2, custa 500k (50 thd) voce deseja comprar?', cid) 
talkState[talkUser] = 4
elseif(msgcontains(msg, 'x-return t1') or msgcontains(msg, 'X-Return T1')) then
selfSay('O X-Return T1, custa 250k (25 thd) voce deseja comprar?', cid) 
talkState[talkUser] = 5
elseif(msgcontains(msg, 'x-return t2') or msgcontains(msg, 'X-Return T2')) then
selfSay('O X-Return T2, custa 500k (50 thd) voce deseja comprar?', cid) 
talkState[talkUser] = 6
  
 
-- Confirmação da Compra  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then  
if(doPlayerRemoveItem(cid, 2160, 25) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13948, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end  

elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then  
if(doPlayerRemoveItem(cid, 2160, 50) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13949, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end  

elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then  
if(doPlayerRemoveItem(cid, 2160, 25) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13983, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end  

elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then  
if(doPlayerRemoveItem(cid, 2160, 50) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13984, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end  

elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then  
if(doPlayerRemoveItem(cid, 2160, 25) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13969, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end  

elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then  
if(doPlayerRemoveItem(cid, 2160, 50) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13970, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end  

end
return TRUE
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())