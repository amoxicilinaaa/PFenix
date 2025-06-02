local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
 
local cfg = {
          toPos = {x=1547,y=1817,z=7}, -- Posição que o jogador sera teleportado
          level = 100, -- Level necessário para ser teleportado
          price = 50000 -- Dinheiro a ser cobrado para ser teleportado
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
          if msgcontains(msg, 'Snow Island') or msgcontains(msg, 'snow island') then
                    selfSay('Você tem certeza de que deseja ir? Não me responsabilizo pelos riscos do local. É um lugar muito perigoso.', cid)
                    talkState[talkUser] = 1
          elseif talkState[talkUser] == 1 then
                    if msgcontains(msg, 'yes') then
                              if getPlayerLevel(cid) >= cfg.level then
                                        if doPlayerRemoveMoney(cid, cfg.price) then
                                                  doTeleportThing(cid, cfg.toPos)
                                                  talkState[talkUser] = 0
                                        else
                                                  selfSay('Você não tem dinheiro suficiente.', cid)
                                        end
                              else
                                        selfSay('Voce precisa de level '.. cfg.level ..'.', cid)
                              end
                    elseif msgcontains(msg, 'no') then
                              selfSay('Skirt here!', cid)
                    end
          end
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())