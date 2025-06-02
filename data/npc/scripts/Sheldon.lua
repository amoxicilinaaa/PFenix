local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item1 = {24141, 15512}, -- item1 item que será pedido e que será dado na primeira troca
          item2 = {24142, 15515}, -- item2 item que será pedido e que será dado na segunda troca
		  item3 = {24140, 15515},
		  item4 = {24146, 15515}
		  
}
local counts = {
          count1 = {1, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
          count2 = {1, 1}, -- count2 quantidade que será pedido e que será dado na segunda troca
		  count3 = {1,1},
		  count4 = {1,1}
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if msgcontains(msg, 'pascoa') or msgcontains (msg, 'Pascoa') then
                    if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] and getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] and getPlayerItemCount(cid, items.item3[1]) >= counts.count3[1] and getPlayerItemCount(cid, items.item4[1]) >= counts.count4[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
							  doPlayerRemoveItem(cid, items.item3[1], counts.count3[1])
							  doPlayerRemoveItem(cid, items.item4[1], counts.count4[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('Voce trocou '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..' por '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'.', cid)
                    else
                              selfSay('Voce precisa de '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' Blue Easter Egg, '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..'Pink Easter Egg, '.. counts.count3[1] ..' '.. getItemNameById(items.item3[1]) ..' Red Easter Egg e '.. counts.count4[1] ..' '.. getItemNameById(items.item4[1]) ..' Golden Easter Egg para receber sua recompensa..', cid)
                    end
          end
          return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())