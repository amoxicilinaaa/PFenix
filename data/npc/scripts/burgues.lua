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
selfSay('Eu vendo {Virus}, {Shiny Stone}, {Vip 1 Mes}, {Vip 1 Ano}, {Glice Stone}, {Green Stone}, {Mag Stone}, {Electri Stone}, {Perior Stone}, {Kiss Stone}, {Zone Stone}, {Gladi Stone}, {Llade Stone}, {Scor Stone}, {Licky Stone}, {Poryz Stone}, {Probo Stone}, {Wea Stone}, {Yanm Stone}, {Fros Stone}, {Special Stone}, {Rare Candys}, {Pocao de Experiencia Dupla}, {Pocao de Experiencia Tripla}, {Bike}, {Held X Attack Tier 3}, {Held X Attack Tier 4}, {Held X Attack Tier 5}, {Held X Attack Tier 6}, {Held X Attack Tier 7}, {Held X Return Tier 3}, {Held X Return Tier 4}, {Held X Return Tier 5}, {Held X Return Tier 6}, {Held X Return Tier 7}, {Held Y Cure Tier 3}, {Held Y Cure Tier 4}, {Held Y Cure Tier 5}, {Held Y Cure Tier 6}, {Held Y Cure Tier 7}. Diga qual voce quer adquirir.', cid) 
elseif(msgcontains(msg, 'virus') or msgcontains(msg, 'virus stone')) then
selfSay('A Virus "stone" custa 100 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 1 
elseif(msgcontains(msg, 'Shiny Stone') or msgcontains(msg, 'shiny stone')) then
selfSay('A Shiny stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 2 
elseif(msgcontains(msg, 'Vip 1 Mes') or msgcontains(msg, 'vip 1 mes')) then
selfSay('O VIP 30 dias Custa 30 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 3
elseif(msgcontains(msg, 'Vip 1 Ano') or msgcontains(msg, 'vip 1 ano')) then
selfSay('O VIP 365 dias Custa 200 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 4
elseif(msgcontains(msg, 'Glice Stone') or msgcontains(msg, 'glice stone')) then
selfSay('A Glice stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 5
elseif(msgcontains(msg, 'Green Stone') or msgcontains(msg, 'green stone')) then
selfSay('A Green Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 6
elseif(msgcontains(msg, 'Mag Stone') or msgcontains(msg, 'mag stone')) then
selfSay('A Mag Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 7 
elseif(msgcontains(msg, 'Electri Stone') or msgcontains(msg, 'electri stone')) then
selfSay('A Electri Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 8
elseif(msgcontains(msg, 'Perior Stone') or msgcontains(msg, 'perior stone')) then
selfSay('A Perior Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 9
elseif(msgcontains(msg, 'Kiss Stone') or msgcontains(msg, 'kiss stone')) then
selfSay('A Kiss Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 10 
elseif(msgcontains(msg, 'Zone Stone') or msgcontains(msg, 'zone stone')) then
selfSay('A Zone Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 11
elseif(msgcontains(msg, 'Gladi Stone') or msgcontains(msg, 'gladi stone')) then
selfSay('A Gladi Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 12
elseif(msgcontains(msg, 'Llade Stone') or msgcontains(msg, 'llade stone')) then
selfSay('A Llade Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 13
elseif(msgcontains(msg, 'Scor Stone') or msgcontains(msg, 'scor stone')) then
selfSay('A Scor Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 14
elseif(msgcontains(msg, 'Licky Stone') or msgcontains(msg, 'licky stone')) then
selfSay('A Licky Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 15
elseif(msgcontains(msg, 'Poryz Stone') or msgcontains(msg, 'poryz stone')) then
selfSay('A Poryz Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 16
elseif(msgcontains(msg, 'Probo Stone') or msgcontains(msg, 'probo stone')) then
selfSay('A Probo Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 17
elseif(msgcontains(msg, 'Wea Stone') or msgcontains(msg, 'wea stone')) then
selfSay('A Wea Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 18
elseif(msgcontains(msg, 'Yanm Stone') or msgcontains(msg, 'yanm stone')) then
selfSay('A Yanm Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 19
elseif(msgcontains(msg, 'Fros Stone') or msgcontains(msg, 'fros stone')) then
selfSay('A Fros Stone Custa 20 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 20 
elseif(msgcontains(msg, 'Special Stone') or msgcontains(msg, 'special stone')) then
selfSay('A Special Stone Custa 10 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 21
elseif(msgcontains(msg, 'Rare Candys') or msgcontains(msg, 'rare candys')) then
selfSay('As 100x Rare Candys Custa 100 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 22
elseif(msgcontains(msg, 'Bike') or msgcontains(msg, 'bike')) then
selfSay('Uma Bike Custa 50 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 23
elseif(msgcontains(msg, 'Held X Attack Tier 3') or msgcontains(msg, 'held x attack tier 3')) then
selfSay('Um Held X Attack Tier 3 Custa 15 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 25
elseif(msgcontains(msg, 'Held X Attack Tier 4') or msgcontains(msg, 'held x attack tier 4')) then
selfSay('Um Held X Attack Tier 4 Custa 25 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 26
elseif(msgcontains(msg, 'Held X Attack Tier 5') or msgcontains(msg, 'held x attack tier 5')) then
selfSay('Um Held X Attack Tier 5 Custa 30 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 27 
elseif(msgcontains(msg, 'Held X Attack Tier 6') or msgcontains(msg, 'held x attack tier 6')) then
selfSay('Um Held X Attack Tier 6 Custa 40 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 28
elseif(msgcontains(msg, 'Held X Attack Tier 7') or msgcontains(msg, 'held x attack tier 7')) then
selfSay('Um Held X Attack Tier 7 Custa 50 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 29
elseif(msgcontains(msg, 'Held X Return Tier 3') or msgcontains(msg, 'held x return tier 3')) then
selfSay('Um Held X Return Tier 3 Custa 15 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 30
elseif(msgcontains(msg, 'Held X Return Tier 4') or msgcontains(msg, 'held x return tier 4')) then
selfSay('Um Held X Return Tier 4 Custa 25 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 31
elseif(msgcontains(msg, 'Held X Return Tier 5') or msgcontains(msg, 'held x return tier 5')) then
selfSay('Um Held X Return Tier 5 Custa 30 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 32 
elseif(msgcontains(msg, 'Held X Return Tier 6') or msgcontains(msg, 'held x return tier 6')) then
selfSay('Um Held X Return Tier 6 Custa 40 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 33
elseif(msgcontains(msg, 'Held X Return Tier 7') or msgcontains(msg, 'held x return tier 7')) then
selfSay('Um Held X Return Tier 7 Custa 50 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 34
elseif(msgcontains(msg, 'Held Y Cure Tier 3') or msgcontains(msg, 'held y cure tier 3')) then
selfSay('Um Held Y Cure Tier 3 Custa 15 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 35
elseif(msgcontains(msg, 'Held Y Cure Tier 4') or msgcontains(msg, 'held y cure tier 4')) then
selfSay('Um Held Y Cure Tier 4 Custa 25 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 36
elseif(msgcontains(msg, 'Held Y Cure Tier 5') or msgcontains(msg, 'held y cure tier 5')) then
selfSay('Um Held Y Cure Tier 5 Custa 30 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 37 
elseif(msgcontains(msg, 'Held Y Cure Tier 6') or msgcontains(msg, 'held y cure tier 6')) then
selfSay('Um Held Y Cure Tier 6 Custa 40 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 38
elseif(msgcontains(msg, 'Held Y Cure Tier 7') or msgcontains(msg, 'held y cure tier 7')) then
selfSay('Um Held Y Cure Tier 7 Custa 50 Roxy Points, Voce vai querer?', cid) 
talkState[talkUser] = 39                           
  
 
-- Confirmação da Compra  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then  
if(doPlayerRemoveItem(cid, 18918, 150) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 20897, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 20904, 1)
talkState[talkUser] = 0
else
selfSay('Voce nao tem  Roxy Points suficiente.', cid) 
talkState[talkUser] = 0  
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then  
if(doPlayerRemoveItem(cid, 18918, 30) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 9004, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem  Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then  
if(doPlayerRemoveItem(cid, 18918, 200) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22045, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 20898, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 20899, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 7) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 20900, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 8) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 20901, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 9) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 20902, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 10) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 20903, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 11) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 20905, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 12) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 21079, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 13) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 21996, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 14) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 21997, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem  Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 15) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 21998, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem  Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 16) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 21999, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 17) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22000, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 18) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22001, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 19) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22002, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 20) then  
if(doPlayerRemoveItem(cid, 18918, 20) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22003, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 21) then  
if(doPlayerRemoveItem(cid, 18918, 15) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 22004, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 22) then  
if(doPlayerRemoveItem(cid, 18918, 50) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 6569, 100)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 23) then  
if(doPlayerRemoveItem(cid, 18918, 5) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 14440, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 25) then  
if(doPlayerRemoveItem(cid, 18918, 15) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13950, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 26) then  
if(doPlayerRemoveItem(cid, 18918, 25) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13951, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 27) then  
if(doPlayerRemoveItem(cid, 18918, 30) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13952, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 28) then  
if(doPlayerRemoveItem(cid, 18918, 40) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13953, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 29) then  
if(doPlayerRemoveItem(cid, 18918, 50) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13954, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 30) then  
if(doPlayerRemoveItem(cid, 18918, 15) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13971, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 31) then  
if(doPlayerRemoveItem(cid, 18918, 25) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13972, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 32) then  
if(doPlayerRemoveItem(cid, 18918, 30) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13973, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 33) then  
if(doPlayerRemoveItem(cid, 18918, 40) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13974, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 34) then  
if(doPlayerRemoveItem(cid, 18918, 50) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13975, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 35) then  
if(doPlayerRemoveItem(cid, 18918, 200) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13985, 20)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 36) then  
if(doPlayerRemoveItem(cid, 18918, 25) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13986, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 37) then  
if(doPlayerRemoveItem(cid, 18918, 35) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13987, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 38) then  
if(doPlayerRemoveItem(cid, 18918, 40) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13988, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 39) then  
if(doPlayerRemoveItem(cid, 18918, 50) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 13989, 1)
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem Roxy Points suficiente.', cid) 
talkState[talkUser] = 0
end 
end
return TRUE
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())