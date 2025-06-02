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
selfSay('Eu vendo Hoverboards, caso tenha interesse diga {Hoverboard} para comprar.', cid) 
elseif(msgcontains(msg, 'Hoverboard') or msgcontains(msg, 'hoverboard')) then
selfSay('O Hoverboard custa 5kk, tem certeza de que deja comprar?', cid) 
talkState[talkUser] = 1                           
  
 
-- Confirmação da Compra  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then  
if(doPlayerRemoveItem(cid, 2160, 500) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 24366, 1)
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