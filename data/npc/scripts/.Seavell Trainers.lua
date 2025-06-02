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

---------------------- Configs --------------------------- 
local clanNpcs = {
["Drop Trainer"] = {
                       task1 = {
                             ["Drop Trainer"] = {{"Pidgeot", 5}, {"Sandslash", 5}, {"Houndoom", 5}},
                       },                     
                       task2 = {
                             ["Drop Trainer"] = {{"Venusaur", 5}, {"Muk", 5}, {"Dragonair", 5}},
                       },
                       itens = {{12161, 100}, {12170, 25}, {12201, 10}},
                       poke = "Dewgong",
                       level = 90,
                       prevRank = 1,
                       nextRank = 2,
},
["Icelake Trainer"] = {
                       task1 = {
                             ["Icelake Trainer"] = {{"Tangela", 5}, {"Rhydon", 5}, {"Dragonite", 5}},
                       },                     
                       task2 = {
                             ["Icelake Trainer"] = {{"Scyther", 5}, {"Venomoth", 5}, {"Primeape", 5}},
                       },
                       itens = {{12272, 5}, {12236, 5}, {12158, 20}},
                       poke = "Jynx",
                       level = 100,
                       prevRank = 2,
                       nextRank = 3,
},
["Waterfall Trainer"] = {
                       task1 = {
                             ["Waterfall Trainer"] = {{"Charizard", 5}, {"Slowking", 5}, {"Jolteon", 5}},
                       },                     
                       task2 = {
                             ["Waterfall Trainer"] = {{"Weezing", 5}, {"Exeggutor", 5}, {"Sneasel", 5}},
                       },
                       itens = {{12161, 100}, {12170, 25}, {12201, 10}},
                       poke = "Lapras",
                       level = 110,
                       prevRank = 3,
                       nextRank = 4,
},
["Frost Trainer"] = {
                       task1 = {
                             ["Frost Trainer"] = {{"Skarmory", 5}, {"Arcanine", 5}, {"Charizard", 5}},
                       },                     
                       task2 = {
                             ["Frost Trainer"] = {{"Vileplume", 5}, {"Electabuzz", 5}, {"Dragonair", 5}},
                       },
                       itens = {{12272, 2}, {12236, 5}, {12158, 20}},
                       poke = "Blastoise",
                       level = 120,
                       prevRank = 4,
                       nextRank = 5,
},
}
------------------------------------------------------------------------------
local npc = clanNpcs[getNpcName()]
       
         if msgcontains(msg, 'help') or msgcontains(msg, 'ajuda') then
            if getPlayerLevel(cid) < npc.level or getPlayerClanName(cid) ~= 'Seavell' or getPlayerClanRank(cid) ~= npc.prevRank then
               selfSay("Eu não preciso de sua ajuda!", cid)
               talkState[talkUser] = 0 
               return true
            elseif getPlayerStorageValue(cid, 854789) <= -1 then
               selfSay("Então você quer subir de posição no nosso clã... Então, você precisa trazer alguns itens para mim... Você quer fazer isso?", cid)
               talkState[talkUser] = 1 
               return true
            elseif getPlayerStorageValue(cid, 854789) == 1 then
               selfSay("Então você trouxe para mim os itens que eu pedi?", cid)
               talkState[talkUser] = 1 
               return true
            elseif getPlayerStorageValue(cid, 854789) == 2 then
               selfSay("O próximo passo é você pegar um pokemon para mim... Você quer fazer isso?", cid)
               talkState[talkUser] = 1 
               return true
            elseif getPlayerStorageValue(cid, 854789) == 3 then
               selfSay("Então você pegou o pokemon o que eu pedi?", cid)
               talkState[talkUser] = 1 
               return true 
            elseif getPlayerStorageValue(cid, 854789) == 4 then
               selfSay("Agora você precisa fazer algumas tarefas para mim ... Você quer fazer isso?", cid)
               talkState[talkUser] = 1 
               return true 
            elseif getPlayerStorageValue(cid, 854789) == 5 then
               selfSay("Então você terminou a primeira tarefa que eu pedi?", cid)
               talkState[talkUser] = 1 
               return true
            elseif getPlayerStorageValue(cid, 854789) == 6 then
               selfSay("E agora vem a última tarefa ... Você quer começar?", cid)
               talkState[talkUser] = 1 
               return true
            elseif getPlayerStorageValue(cid, 854789) == 7 then
               selfSay("Então você terminou a última tarefa que eu pedi?", cid)
               talkState[talkUser] = 1 
               return true
            end      
         elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 1 then 
            if getPlayerStorageValue(cid, 854789) <= -1 then
               local str = "Ok then, you need bring to me: "
               for a = 1, #npc.itens do
                   str = str..(a == #npc.itens and " and " or a ~= 1 and ", " or "{")..(npc.itens[a][2]).." "..(getItemNameById(npc.itens[a][1]))
               end 
               str = str.."}, Volte quando você juntar esses itens!"   
               selfSay(str, cid)
               setPlayerStorageValue(cid, 854789, 1)
               talkState[talkUser] = 0 
               return true 
            elseif getPlayerStorageValue(cid, 854789) == 1 then
               local check = checkItensForTask(cid, npc.itens)
               if check == 0 then
                  selfSay("Ok então, você completou a missão, fale comigo novamente quando quiser continuar!", cid)
                  setPlayerStorageValue(cid, 854789, 2)
                  talkState[talkUser] = 0 
                  return true
               else
                  selfSay(check, cid)
                  talkState[talkUser] = 0 
                  return true
               end
            elseif getPlayerStorageValue(cid, 854789) == 2 then
               selfSay("Ok então, você precisa pegar um {"..(npc.poke).."},E trazê-lo para mim... Volte quando você fizer isso!", cid)
               setPlayerStorageValue(cid, 854789, 3)
               setPlayerStorageValue(cid, 854788, npc.poke)
               talkState[talkUser] = 0 
               return true
            elseif getPlayerStorageValue(cid, 854789) == 3 then 
               if getPlayerStorageValue(cid, 854788) == 'done' then
                  selfSay("Muito bem, fale comigo novamente quando quiser continuar!", cid)
                  setPlayerStorageValue(cid, 854789, 4)
                  setPlayerStorageValue(cid, 854788, -1)
                  setPlayerStorageValue(cid, 854787, npc.poke)
                  talkState[talkUser] = 0 
                  return true
               else
                  selfSay("Você não pegou o pokemon o que eu pedi! Vá fazê-lo!", cid)
                  talkState[talkUser] = 0 
                  return true
               end
            elseif getPlayerStorageValue(cid, 854789) == 4 then 
               local sto = getFreeTaskStorage(cid)
               local c = 0
               if sto == -1 then 
                  selfSay("Você não pode obter mais tarefas! Você já está com o máximo de "..(maxTasks).." tarefas!", cid)
                  talkState[talkUser] = 0
                  return true
               end
               
               local str = "Ok então, agora você precisa matar: {"
               for e, f in pairs(npc.task1) do
                   for a = 1, #f do
                       str = str..((a == #f and c ~= 0) and " and " or a ~= 1 and ", " or "")..f[a][2].." "..f[a][1]
                       c = c+1
                   end
               end
               str = str.."}com o {"..(npc.poke).."} Que você pego!"
               selfSay(str, cid)
               setPlayerStorageValue(cid, 854789, 5)
               setStorageArray(cid, sto, npc.task1)
               talkState[talkUser] = 0 
               return true
            elseif getPlayerStorageValue(cid, 854789) == 5 then 
               if isMyTaskComplete(cid, getNpcCid()) then
                  selfSay("Muito bem, você fez a minha primeira tarefa ... Fale comigo novamente quando quiser continuar!", cid) 
                  local sto = getMyTaskSto(cid, getNpcCid())
                  setPlayerStorageValue(cid, sto, -1)
                  setPlayerStorageValue(cid, 854789, 6)
                  talkState[talkUser] = 0
                  return true
               else
                  selfSay("Você não completou minha tarefa ainda... Vá acabar com isso!", cid)
                  talkState[talkUser] = 0
                  return true
               end
            elseif getPlayerStorageValue(cid, 854789) == 6 then 
               local sto = getFreeTaskStorage(cid)
               local c = 0
               if sto == -1 then 
                  selfSay("Você não pode pegar mais tarefas! Você já está com o máximo de "..(maxTasks).." Tarefas!", cid)
                  talkState[talkUser] = 0
                  return true
               end
               
               local str = "Ok então,agora para sua última tarefa que você precisa para matar: {"
               for e, f in pairs(npc.task2) do
                   for a = 1, #f do
                       str = str..((a == #f and c ~= 0) and " and " or a ~= 1 and ", " or "")..f[a][2].." "..f[a][1]
                       c = c+1
                   end
               end
               str = str.."} com o {"..(npc.poke).."} Que você pego!"
               selfSay(str, cid)
               setPlayerStorageValue(cid, 854789, 7)
               setStorageArray(cid, sto, npc.task2)
               talkState[talkUser] = 0 
               return true
            elseif getPlayerStorageValue(cid, 854789) == 7 then
               if isMyTaskComplete(cid, getNpcCid()) then
                  ---
                  local storages = {17000, 63215, 17001, 13008, 5700}     --alterado v1.8
                  for s = 1, #storages do
                      if getPlayerStorageValue(cid, storages[s]) >= 1 then
                         selfSay("Você não pode fazer isso enquanto está voando, equitação, surf, mergulho ou montar uma bicicleta!", cid) 
                         talkState[talkUser] = 0
                         return true
                      end
                  end
                  if #getCreatureSummons(cid) >= 1 then     --alterado v1.8
                     selfSay("Retorne seu pokemon!", cid) 
                     talkState[talkUser] = 0
                     return true
                  end  
                  ---
                  if checkPokemonForTask(cid, npc.poke) then
                     setPlayerClanRank(cid, npc.nextRank)
                     selfSay("Então você completa a minha última tarefa! Congradulations! Agora você se move acima do Rank e transforma-se {"..lookClans[getPlayerClanNum(cid)][getPlayerClanRank(cid)].."}!", cid)
                     setPlayerStorageValue(cid, 854789, -1)
                     setPlayerStorageValue(cid, 854787, -1)
                     local sto = getMyTaskSto(cid, getNpcCid())
                     setPlayerStorageValue(cid, sto, -1)
                     talkState[talkUser] = 0
                     return true
                  else
                     selfSay("Você não está com o "..(npc.poke).." Que você pegou antes em seu pokebag! Vai buscar!", cid)
                     talkState[talkUser] = 0
                     return true
                  end   
               else
                  selfSay("Você não completou minha tarefa ainda... Vá acabar com isso!", cid)
                  talkState[talkUser] = 0
                  return true
               end        
            end
         end
              
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             