local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
------------------- Configuração dos Itens -----------------------

local items = {12683, 12682, 12684, 12684, 12681, 2365, 15600, 23828, 17069, 24151} -- ID dos Itens
local nome = {'pokeball backpack', 'greatball backpack', 'superball backpack', 'ultraball backpack', 'facebook backpack', 'backpack of holding', 'love teddy', 'dogs house', 'music box', 'birds house'}


------------------- MESSAGES INICIAIS ----------------------------------------
if msgcontains(msg, nome[1]) then
selfSay('Deseja comprar 1x {'..getItemNameById(items[1])..'} Por 10 online points?', cid)
selfSay('Para saber quantos pontos possui digite {!opshop}.', cid)
talkState[talkUser] = 1

elseif msgcontains(msg, nome[2]) then
selfSay('Deseja comprar um {'..getItemNameById(items[2])..'} Por 13 online points?', cid)
selfSay('Para saber quantos pontos possui digite {!opshop}.', cid)
talkState[talkUser] = 2

elseif msgcontains(msg, nome[3]) then
selfSay('Deseja comprar um {'..getItemNameById(items[3])..'} Por 15 online points?', cid)
selfSay('Para saber quantos pontos possui digite {!opshop}.', cid)
talkState[talkUser] = 3

elseif msgcontains(msg, nome[4]) then
selfSay('Deseja comprar um {'..getItemNameById(items[4])..'} Por 17 online points?', cid)
selfSay('Para saber quantos pontos possui digite {!opshop}.', cid)
talkState[talkUser] = 4

elseif msgcontains(msg, nome[5]) then
selfSay('Deseja comprar um {'..getItemNameById(items[5])..'} Por 20 online points?', cid)
selfSay('Para saber quantos pontos possui digite {!opshop}.', cid)
talkState[talkUser] = 5

elseif msgcontains(msg, nome[6]) then
selfSay('Deseja comprar um {'..getItemNameById(items[6])..'} Por 30 online points?', cid)
selfSay('Para saber quantos pontos possui digite {!opshop}.', cid)
talkState[talkUser] = 6

elseif msgcontains(msg, nome[7]) then
selfSay('Deseja comprar um {'..getItemNameById(items[7])..'} Por 35 online points?', cid)
selfSay('Para saber quantos pontos possui digite {!opshop}.', cid)
talkState[talkUser] = 7

elseif msgcontains(msg, nome[8]) then
selfSay('Deseja comprar um {'..getItemNameById(items[8])..'} Por 50 online points?', cid)
selfSay('Para saber quantos pontos possui digite {!opshop}.', cid)
talkState[talkUser] = 8

elseif msgcontains(msg, nome[9]) then
selfSay('Deseja comprar um {'..getItemNameById(items[9])..'} Por 45 online points?', cid)
selfSay('Para saber quantos pontos possui digite {!opshop}.', cid)
talkState[talkUser] = 9

elseif msgcontains(msg, nome[10]) then
selfSay('Deseja comprar um {'..getItemNameById(items[10])..'} Por 35 online points?', cid)
selfSay('Para saber quantos pontos possui digite {!opshop}.', cid)
talkState[talkUser] = 10

elseif (msgcontains(msg, 'negociar') or msgcontains(msg, 'trade')) then
selfSay('No momento tenho disponivel em meu estoque os seguintes itens: {'..getItemNameById(items[1])..'}, {'..getItemNameById(items[2])..'}, {'..getItemNameById(items[3])..'}, {'..getItemNameById(items[4])..'}, {'..getItemNameById(items[5])..'}, {'..getItemNameById(items[6])..'}, {'..getItemNameById(items[7])..'}, {'..getItemNameById(items[8])..'}, {'..getItemNameById(items[9])..'} e {'..getItemNameById(items[10])..'}.', cid)
talkState[talkUser] = 0

---------------------- NEGOCIAÇÃO -------------------------------

elseif talkState[talkUser] == 1 then
if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
local qnt = 10
local bonuscoin = 5984548
    if getPlayerStorageValue(cid, bonuscoin) >= qnt then
        setPlayerStorageValue(cid, bonuscoin, getPlayerStorageValue(cid, bonuscoin) - qnt)
        doPlayerAddItem(cid, items[1], 1)
        selfSay('Parabéns, voce acabou de adquirir 1x '..getItemNameById(items[1])..'!', cid)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Agora voce tem: " .. getPlayerStorageValue(cid,5984548) .. " Online Bonus.")
    else
        selfSay('Voce precisa de 10 online bonus para adquirir esse item.', cid)
     talkState[talkUser] = 0
    end
end

elseif talkState[talkUser] == 2 then
if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
local qnt = 13
local bonuscoin = 5984548
    if getPlayerStorageValue(cid, bonuscoin) >= qnt then
        setPlayerStorageValue(cid, bonuscoin, getPlayerStorageValue(cid, bonuscoin) - qnt)
        doPlayerAddItem(cid, items[2], 1)
        selfSay('Parabens, voce acaba de adquirir um '..getItemNameById(items[2])..'.', cid)
    else
        selfSay('Voce precisa de 13 online bonus para adquirir esse item.', cid)
    talkState[talkUser] = 0
    end
end

elseif talkState[talkUser] == 3 then
if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
local bonuscoin = 5984548
local qnt = 15
    if getPlayerStorageValue(cid, bonuscoin) >= qnt then
        setPlayerStorageValue(cid, bonuscoin, getPlayerStorageValue(cid, bonuscoin) - qnt)
        doPlayerAddItem(cid, items[3], 1)
        selfSay('Parabens, voce acaba de adquirir um '..getItemNameById(items[3])..'.', cid)
    else
        selfSay('Voce precisa de 15 online bonus para adquirir esse item.', cid)
    talkState[talkUser] = 0
    end
end

elseif talkState[talkUser] == 4 then
if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
    if getPlayerStorageValue(cid, 5984548) >= 17 then
        setPlayerStorageValue(cid, 5984548, getPlayerStorageValue(cid, 5984548) - 10)
        doPlayerAddItem(cid, items[4], 1)
        selfSay('Parabens, voce acaba de adquirir um '..getItemNameById(items[4])..'.', cid)
    else
        selfSay('Voce precisa de 17 online bonus para adquirir esse item.', cid)
    talkState[talkUser] = 0
    end
end

elseif talkState[talkUser] == 5 then
if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
if getPlayerStorageValue(cid, 5984548) >= 20 then
        setPlayerStorageValue(cid, 5984548, getPlayerStorageValue(cid, 5984548) - 10)
        doPlayerAddItem(cid, items[5], 1)
        selfSay('Parabens, voce acaba de adquirir um '..getItemNameById(items[5])..'.', cid)
    else
        selfSay('Voce precisa de 20 online bonus para adquirir esse item.', cid)
    talkState[talkUser] = 0
    end
end

elseif talkState[talkUser] == 6 then
if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
if getPlayerStorageValue(cid, 5984548) >= 30 then
        setPlayerStorageValue(cid, 5984548, getPlayerStorageValue(cid, 5984548) - 10)
        doPlayerAddItem(cid, items[6], 1)
        selfSay('Parabens, voce acaba de adquirir um '..getItemNameById(items[6])..'.', cid)
    else
        selfSay('Voce precisa de 30 online bonus para adquirir esse item.', cid)
    talkState[talkUser] = 0
    end
end

elseif talkState[talkUser] == 7 then
if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
if getPlayerStorageValue(cid, 5984548) >= 35 then
        setPlayerStorageValue(cid, 5984548, getPlayerStorageValue(cid, 5984548) - 10)
        doPlayerAddItem(cid, items[7], 1)
        selfSay('Parabens, voce acaba de adquirir um '..getItemNameById(items[7])..'.', cid)
    else
        selfSay('Voce precisa de 35 online bonus para adquirir esse item.', cid)
    talkState[talkUser] = 0
    end
end

elseif talkState[talkUser] == 8 then
if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
if getPlayerStorageValue(cid, 5984548) >= 50 then
        setPlayerStorageValue(cid, 5984548, getPlayerStorageValue(cid, 5984548) - 10)
        doPlayerAddItem(cid, items[8], 1)
        selfSay('Parabens, voce acaba de adquirir um '..getItemNameById(items[8])..'.', cid)
    else
        selfSay('Voce precisa de 40 online bonus para adquirir esse item.', cid)
    talkState[talkUser] = 0
    end
end

elseif talkState[talkUser] == 9 then
if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
if getPlayerStorageValue(cid, 5984548) >= 45 then
        setPlayerStorageValue(cid, 5984548, getPlayerStorageValue(cid, 5984548) - 10)
        doPlayerAddItem(cid, items[9], 1)
        selfSay('Parabens, voce acaba de adquirir um '..getItemNameById(items[9])..'.', cid)
    else
        selfSay('Voce precisa de 45 online bonus para adquirir esse item.', cid)
    talkState[talkUser] = 0
    end
end

elseif talkState[talkUser] == 10 then
if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
if getPlayerStorageValue(cid, 5984548) >= 35 then
        setPlayerStorageValue(cid, 5984548, getPlayerStorageValue(cid, 5984548) - 10)
        doPlayerAddItem(cid, items[10], 1)
        selfSay('Parabens, voce acaba de adquirir um '..getItemNameById(items[10])..'.', cid)
    else
        selfSay('Voce precisa de 35 online bonus para adquirir esse item.', cid)
    talkState[talkUser] = 0
    end
end

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())