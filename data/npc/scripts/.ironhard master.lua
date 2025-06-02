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
 
       
        if (msgcontains(msg, 'clan') or msgcontains(msg, 'Clan')) then   --alterado v1.7
           if getPlayerClanName(cid) == 'Ironhard' then   --alterado v1.7
              selfSay("Você já é do clã ironhard!", cid)
              talkState[talkUser] = 0
              return true
           elseif getPlayerClanNum(cid) ~= -1 then     --alterado v1.7
              selfSay("Você já é de outro clã!", cid)
              talkState[talkUser] = 0
              return true    
           end
              selfSay("Então você quer participar do meu clã ... Tem certeza disso?", cid)
              talkState[talkUser] = 2  
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 2 then
           if getPlayerLevel(cid) < 80 then
              selfSay("Você está muito fraco ainda ... Você precisa ser atleast nível 80 para entrar no clã!", cid)
              talkState[talkUser] = 0
              return true
           end
           selfSay("OK então ... Agora você é um grande membro do clã ironhard!", cid)
           setPlayerClan(cid, 'Ironhard')   --alterado v1.7
           talkState[talkUser] = 0
           
           
        elseif (msgcontains(msg, 'leave') or msgcontains(msg, 'deixar')) then  --alterado v1.7  \/
           if getPlayerClanName(cid) ~= 'Ironhard' then 
              selfSay("Você não é do clã, saia daqui!", cid)
              talkState[talkUser] = 0
              return true
           else
              selfSay("Então você quer deixar o clã ... Tem certeza disso?", cid)
              talkState[talkUser] = 3
           end
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 3 then 
           if removePlayerClan(cid) then
              selfSay("Ok então, boa sorte!", cid)
              talkState[talkUser] = 0
              return true
           else
              selfSay("Você tem alguma tarefa para terminar de um treinador! Vá terminá-lo!", cid)
              talkState[talkUser] = 0
              return true
           end
           
           
        elseif (msgcontains(msg, 'shiny') or msgcontains(msg, 'Shiny')) then    --alterado v1.7
           if getPlayerClanName(cid) ~= 'Ironhard' then    --alterado v1.7
              selfSay("Você não é do clã Ironhard! Saia daqui!", cid)
              return true
           else   
              selfSay("Então você quer transformar seu Metagross em um Shiny Metagross? Vai custar 500k!", cid)
              talkState[talkUser] = 4
           end
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 4 then
           if getPlayerSlotItem(cid, 8).uid <= 0 then
              selfSay("Desculpe, você não tem um pokemon no slot principal!", cid)
              talkState[talkUser] = 0
		      return true
	       end 
	                                                                             --alterado v1.2
	       if #getCreatureSummons(cid) >= 1 then
	          selfSay("Volte seu pokemon!", cid)
              talkState[talkUser] = 0
              return true
           end
	       
	       local pb = getPlayerSlotItem(cid, 8).uid
	       
	       if getItemAttribute(pb, "poke") ~= "Metagross" then
	          selfSay("Put a Metagross's pokeball atleast +20 in main slot!", cid)
              talkState[talkUser] = 0
              return true
           end
              
           if not getItemAttribute(pb, "boost") or getItemAttribute(pb, "boost") < 20 then
              selfSay("Sorry, your Metagross is not boosted +20!", cid)
              talkState[talkUser] = 0
              return true
           end
                                          --100000 = 1k, 1000000 = 10k, 10000000 = 100k
           if doPlayerRemoveMoney(cid, 50000000) == true then
              selfSay("So there is it! Enjoy!", cid)
              doItemSetAttribute(pb, "hp", 1)
              doItemSetAttribute(pb, "poke", "Shiny Metagross")
		      doItemSetAttribute(pb, "description", "Contains a Shiny Metagross.")
		      doItemEraseAttribute(pb, "boost")
		      doTransformItem(getPlayerSlotItem(cid, 7).uid, fotos["Shiny Metagross"])

		doItemSetAttribute(pb, "Icone", "yes")	
		doTransformItem(pb, icons[getItemAttribute(pb, "poke")].on)

		      if useKpdoDlls then
		        doCreatureExecuteTalkAction(cid, "/pokeread")
	          end
		      talkState[talkUser] = 0
		      return true
	      else
	          selfSay("You don't have enough money!", cid)
	          talkState[talkUser] = 0
	          return true
          end
        end

return true
end
     