local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local petState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local PetPrices = {
["Raikou"] = {1000, 200},
}

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid

if msgcontains(msg, "sell") then
local say = "I can offer you these pet species: "
for pet_name, k in pairs(PetPrices) do
local first = true
if Pets[pet_name] then
say = say .. (first == true and "" or ", ") .."{".. pet_name .. "}"
first = false
end
end
selfSay(say, cid)
talkState[talkUser] = 1
elseif msgcontains(msg, "revive") then
if getCreatureStorage(cid, PET_SPECIE) == -1 then
selfSay("You don't have a pet", cid)
return true
end

if getCreatureStorage(cid, PET_ALIVE) == 0 then
if doPlayerRemoveMoney(cid, PetPrices[getCreatureStorage(cid, PET_SPECIE):lower()][2]) then
selfSay("Your pet is now alive.", cid)
doCreatureSetStorage(cid, PET_ALIVE, 1)
else
selfSay("Sorry, you need ".. PetPrices[getCreatureStorage(cid, PET_SPECIE)][2] .." gold.", cid)
end
else
selfSay("Sorry, your pet is alive.", cid)
end
elseif talkState[talkUser] == 1 then
if PetPrices[msg] then
selfSay("A good choice, so do you want to buy a ".. msg .." pet? It will cost ".. PetPrices[msg][1] .." gold.", cid)
talkState[talkUser] = 2
petState[talkUser] = msg
else
selfSay("Sorry, I don't know this pet specie", cid)
end
elseif talkState[talkUser] == 2 then
if msgcontains(msg, "yes") then
if get_pet(cid) or getCreatureStorage(cid, PET_SPECIE) ~= -1 then
selfSay("Sorry, you already have a pet.", cid)
return true
end

local pet = petState[talkUser]
if getPlayerMoney(cid) < PetPrices[pet][1] then
selfSay("Sorry, you don't have enough money", cid)
return true
end

selfSay("This is your new pet, take care of it.", cid)
Pets[pet]:create():hatch(cid)
elseif msgcontains(msg, "no") then
selfSay("Then not.", cid)
talkState[talkUser] = 0
end
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())