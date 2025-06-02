local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
 
local cfg = {
          toPos = {x=593, y=698, z=6}, -- Posição que o jogador sera teleportado
          level = 200, -- Level necessário para ser teleportado
          price = 2000000 -- Dinheiro a ser cobrado para ser teleportado
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
          if msgcontains(msg, 'outland') then
                    selfSay('You are sure you want to travel?', cid)
                    talkState[talkUser] = 1
          elseif talkState[talkUser] == 1 then
                    if msgcontains(msg, 'yes') then
                              if getPlayerLevel(cid) >= cfg.level then
                                        if doPlayerRemoveMoney(cid, cfg.price) then
                                                  doTeleportThing(cid, cfg.toPos)
                                                  talkState[talkUser] = 0
                                        else
                                                  selfSay('You don\'t have enough money.', cid)
                                        end
                              else
                                        selfSay('You need level having above '.. cfg.level ..'.', cid)
                              end
                    elseif msgcontains(msg, 'no') then
                              selfSay('Skirt here!', cid)
                    end
          end
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())