local DESTINO = {x = 1978, y = 277, z = 7} -- POSIÇÃO DE DESTINO
local SAFFRON = {x = 1049, y = 1044, z = 7} -- POSIÇÃO DE Saffron
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg:lower())   end
function onThink()                  npcHandler:onThink()                  end
local talkState = {}
 
function creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
      return false
   end
 
   local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
   if msgcontains(msg, "sim") or msgcontains(msg, "yes") then
      selfSay("Você foi teleportado para genesect quest!", cid)
      doSendMagicEffect(getThingPos(cid), 21)
      npcHandler:releaseFocus(cid)
      doTeleportThing(cid, DESTINO)
      doSendMagicEffect(DESTINO, 21)
   elseif msgcontains(msg, "nao") or msgcontains(msg, "no") then
      selfSay("Então rala maluco poha.", cid)
      doSendMagicEffect(getThingPos(cid), 21)
      npcHandler:releaseFocus(cid)
      doTeleportThing(cid, SAFFRON)
      doSendMagicEffect(SAFFRON, 21)
   end
 
   return true
end
 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())