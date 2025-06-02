local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item1 = {10305, 12331}, -- item1 item que será pedido e que será dado na primeira troca
          item2 = {10097, 15515} -- item2 item que será pedido e que será dado na segunda troca
}
local counts = {
          count1 = {1, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
          count2 = {1, 1} -- count2 quantidade que será pedido e que será dado na segunda troca
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if msgcontains(msg, 'shiny abra') then
                    if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] and getPlayerItemCount(cid, items.item2[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('Voce trocou '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..' por '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'.', cid)
                    else
                              selfSay('Voce precisa de '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' e um Vodoo doll para obte-lo.', cid)
                    end
          end
          return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())