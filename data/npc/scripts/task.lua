local tasksss = {
   [1] = {name = "Blastoise",  sto = 10201, count = 40, time_sto = 5451, time = 1*20*60*60, sto_count = 14141, money = 1, rewardid = 11442, rewardcount = 3, rewardexp = 100000,  text = "Parabens, voce terminou a task do Blastoise, e dentro de 20 horas podera fazer denovo."},
   [2] = {name = "Charizard",  sto = 10202, count = 40, time_sto = 5452, time = 1*20*60*60, sto_count = 14142, money = 1, rewardid = 11447, rewardcount = 3, rewardexp = 100000,  text = "Parabens, voce terminou a task do Blastoise, e dentro de 20 horas podera fazer denovo."},
   [3] = {name = "Venusaur",  sto = 10203, count = 40, time_sto = 5453, time = 1*20*60*60, sto_count = 14143, money = 1, rewardid = 11441, rewardcount = 3, rewardexp = 100000,  text = "Parabens, voce terminou a task do Blastoise, e dentro de 20 horas podera fazer denovo."},

   }

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
    value = -1
    for i = 1, #tasksss do
        if msgcontains(msg, tasksss[i].name) and not value ~= -1 then
            value = i
        end
    end
    if value == -1 then
        selfSay('I don\'t have a this task!', cid)
        talkState[talkUser] = 0
        return true
    end
    local configss = tasksss[value]
    local name = configss.name
    local m_sto = configss.sto
    local time_sto = configss.time_sto
    local count_sto = configss.sto_count
    local total_count = configss.count
    local rest = total_count - getPlayerStorageValue(cid, count_sto)
        if getPlayerStorageValue(cid, time_sto) < os.time() then -- verifica se o player ainda está no prazo
            if getPlayerStorageValue(cid, m_sto) <= 0 then -- verifica se o player não pegou está task
                selfSay('Ready! Now you need kill a '.. total_count .. ' '.. name .. '!', cid)
                setPlayerStorageValue(cid, m_sto, 1)
                setPlayerStorageValue(cid, total_count, 0)
                talkState[talkUser] = 0               
            else
                if rest <= 0 then -- Verifica se o player matou todos os monstros nescessários
                    doPlayerAddItem(cid, configss.rewardid, configss.rewardcount)
                    setPlayerStorageValue(cid, count_sto, 0) 
                    setPlayerStorageValue(cid, m_sto, -1) 
                    setPlayerStorageValue(cid, time_sto, os.time() + configss.time)
                    doPlayerAddExperience(cid, configss.rewardexp)
                    doSendAnimatedText(getCreaturePosition(cid), configss.rewardexp, 215)
                    selfSay(configss.text, cid) 
                    talkState[talkUser] = 0
                else
                    selfSay('You need to kill '..rest..' '..name..' to gain a reward.', cid)
                    talkState[talkUser] = 0
                end
            end
        else
            selfSay('You already did this task, player. Wait '..math.ceil((getPlayerStorageValue(cid, time_sto) - os.time())/(60*60))..' hours to do it again.', cid)
            talkState[talkUser] = 0
        end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())