local tab = {
	pos = {x = 1547, y = 1817, z = 7}, -- posição x, y, z do local a teleportar o player
	item = {5432, 1}, -- {itemID, count}
	price = 15 -- quantidade em crystal coins
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                      npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if (not npcHandler:isFocused(cid)) then
		return false
	end
	
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	if (msgcontains(msg, 'teleport')) then
		talkState[talkUser] = 1
		selfSay('Are you sure?', cid)
		selfSay('Remember..you need '..tab.item[2]..' '..getItemNameById(tab.item[1])..' and '..tab.price..' crystal coins to be teleported.', cid)
	elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if (getPlayerItemCount(cid, tab.item[1]) >= tab.item[2] and doPlayerRemoveMoney(cid, tab.price * 10000)) then
			doPlayerRemoveItem(cid, tab.item[1], tab.item[2])
			doTeleportThing(cid, tab.pos)
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			selfSay('Have a good trip.', cid)
		else
			talkState[talkUser] = 0
			selfSay('I can not teleport you. You do not have the necessary items.', cid)
		end
	elseif (msgcontains(msg, 'no') and talkState[talkUser] == 1) then
		talkState[talkUser] = 0
		selfSay('Okay, maybe another time.', cid)
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())