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
selfSay('Eu vendo {green carpet}, {red carpet}, {blue carpet}, {purple carpet}, {darkness carpet}, {ancient carpet}, {omega carpet}, {orange supreme carpet}, {yellow supreme carpet}, {fur carpet}, {circle skin carpet}, {pink losang carpet}, {blue galaxy carpet}, {star carpet}.', cid) 
elseif(msgcontains(msg, 'Green Carpet') or msgcontains(msg, 'green carpet')) then
selfSay('O Green Carpet custa 45 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 1 
elseif(msgcontains(msg, 'Red Carpet') or msgcontains(msg, 'red carpet')) then
selfSay('O Red Carpet custa 45 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 2                     
elseif(msgcontains(msg, 'Blue Carpet') or msgcontains(msg, 'blue carpet')) then
selfSay('O Blue Carpet custa 45 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 3  
elseif(msgcontains(msg, 'Ancient Carpet') or msgcontains(msg, 'ancient carpet')) then
selfSay('O Ancient Carpet custa 45 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 4  
elseif(msgcontains(msg, 'Omega Carpet') or msgcontains(msg, 'omega carpet')) then
selfSay('O Omega Carpet custa 65 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 5  
elseif(msgcontains(msg, 'Orange Supreme Carpet') or msgcontains(msg, 'orange supreme carpet')) then
selfSay('O Orange Supreme Carpet custa 80 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 6  
elseif(msgcontains(msg, 'Yellow Supreme Carpet') or msgcontains(msg, 'yellow supreme carpet')) then
selfSay('O Yellow Supreme Carpet custa 80 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 7  
elseif(msgcontains(msg, 'Fur Carpet') or msgcontains(msg, 'fur carpet')) then
selfSay('O Fur Carpet custa 75 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 8  
elseif(msgcontains(msg, 'Circle Skin Carpet') or msgcontains(msg, 'circle skin carpet')) then
selfSay('O Circle Skin Carpet custa 85 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 9  
elseif(msgcontains(msg, 'Pink Losang Carpet') or msgcontains(msg, 'pink losang carpet')) then
selfSay('O Pink Losang Carpet custa 100 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 10
elseif(msgcontains(msg, 'Purple Carpet') or msgcontains(msg, 'purple carpet')) then
selfSay('O Pink Losang Carpet custa 75 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 11
elseif(msgcontains(msg, 'Blue Galaxy Carpet') or msgcontains(msg, 'blue galaxy carpet')) then
selfSay('O Blue Galaxy Carpet custa 150 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 12
elseif(msgcontains(msg, 'Star Carpet') or msgcontains(msg, 'star carpet')) then
selfSay('O Star Carpet custa 250 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 13
elseif(msgcontains(msg, 'Darkness Carpet') or msgcontains(msg, 'darkness carpet')) then
selfSay('O Darkness Carpet custa 100 TDs, voce quer comprar?', cid) 
talkState[talkUser] = 14
-- Confirmação da Compra  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then  
if(doPlayerRemoveItem(cid, 2160, 45) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22113, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then  
if(doPlayerRemoveItem(cid, 2160, 45) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22109, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then  
if(doPlayerRemoveItem(cid, 2160, 45) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22111, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then  
if(doPlayerRemoveItem(cid, 2160, 45) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22107, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then  
if(doPlayerRemoveItem(cid, 2160, 65) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22706, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then  
if(doPlayerRemoveItem(cid, 2160, 80) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22714, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 7) then  
if(doPlayerRemoveItem(cid, 2160, 80) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22716, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 8) then  
if(doPlayerRemoveItem(cid, 2160, 75) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22718, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 9) then  
if(doPlayerRemoveItem(cid, 2160, 85) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22720, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 10) then  
if(doPlayerRemoveItem(cid, 2160, 100) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22722, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 11) then  
if(doPlayerRemoveItem(cid, 2160, 75) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22724, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 12) then  
if(doPlayerRemoveItem(cid, 2160, 150) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22726, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 13) then  
if(doPlayerRemoveItem(cid, 2160, 250) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22728, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem dinheiro suficiente.', cid) 
talkState[talkUser] = 0  
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 14) then  
if(doPlayerRemoveItem(cid, 2160, 100) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22731, 1)
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