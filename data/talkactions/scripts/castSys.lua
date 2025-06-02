--[[ Perfect Cast System 1.0 by Roksas ]]--



function onSay(cid, words, param)
local player = getPlayerByName(param)


if not isInArray({"list", "exit", "off", "on"}, param) and not param or param == "" then
doSendMagicEffect(getThingPos(cid), 2)
doPlayerSendTextMessage(cid, 20, "Enter the name of the player, which you want to cast in parameters.")
return true
end

if param == "on" then
if getPlayerStorageValue(cid, 10359) >= 1 then
doSendMagicEffect(getThingPos(cid), 2)
doPlayerSendTextMessage(cid, 20, "Your Cast System is already running ONLINE!")
return true
end

castOn(cid)
doSendMagicEffect(getThingPos(cid), 39)
doPlayerSendTextMessage(cid, 20, "You have activated your Cast System, now others can cast you, to disable this feature, use the parameter '!cast off'.")
return true
end

if param == "off" then
if getPlayerStorageValue(cid, 10359) < 1 then
doSendMagicEffect(getThingPos(cid), 2)
doPlayerSendTextMessage(cid, 20, "Your Cast System is already OFFLINE!")
return true
end

castOff(cid)
doSendMagicEffect(getThingPos(cid), 39)
doPlayerSendTextMessage(cid, 20, "You have disabled your Cast System, from now on no one can watch you, unless you turn on the Cast, using the parameter '!cast on'.")
return true
end

if param == "exit" then
if getPlayerStorageValue(cid, 12269) < 1 then
doSendMagicEffect(getThingPos(cid), 2)
doPlayerSendTextMessage(cid, 20, "You no are casting players.")
return true
end

cancelCast(cid)
doSendMagicEffect(getThingPos(cid), 39)
doPlayerSendTextMessage(cid, 20, "You stopped casting, use the parameter '!cast list' to see who can be casted.")
return true
end

if param == "list" then

if #whoCasted() < 1 then
doSendMagicEffect(getThingPos(cid), 2)
doPlayerSendTextMessage(cid, 20, "At this time, no player can be casted, try again later.")
return true
end

doPlayerSendTextMessage(cid, 20, "Players can be casteds:\n\n")
for k, v in ipairs(whoCasted()) do
doPlayerSendTextMessage(cid, 20, " - "..getCreatureName(v).."")
end 

return true
end

if not isPlayer(player) then
doSendMagicEffect(getThingPos(cid), 2)
doPlayerSendTextMessage(cid, 20, "This player is offline or does not exist. Use the parameter '!cast list' to see who can be casted.")
return true
end

if getPlayerStorageValue(player, 10359) < 1 then
doSendMagicEffect(getThingPos(cid), 2)
doPlayerSendTextMessage(cid, 20, "You can only cast one person with the Cast System is activated, use the parameter '!cast list' to see who can be assisted.")
return true
end

if getPlayerStorageValue(cid, 10359) >= 1 then
doSendMagicEffect(getThingPos(cid), 2)
doPlayerSendTextMessage(cid, 20, "To cast a player, you must first disable your Cast System using the parameter '!cast off'.")
return true
end

if not getTileInfo(getThingPos(cid)).protection then
return doPlayerSendTextMessage(cid, 20, "You need enter in Protection Zone to use the Cast System.") and true
end

setPlayerStorageValue(cid, 12269, 1)
castPlayer(cid, player)
doSendMagicEffect(getThingPos(cid), 39)
doPlayerSendTextMessage(cid, 20, "You are casting the player "..getCreatureName(player)..", to exit just use the command '!cast exit'.")
doPlayerSendTextMessage(player, 20, "You are casted by "..getCreatureName(cid).." player to disable your Cast, simply use the parameter '!cast off'.")
return true
end

function cancelCast(uid)

mayNotMove(uid, false)
doCreatureSetHideHealth(uid, false)
setPlayerStorageValue(uid, 12269, -1)
doRemoveCondition(uid, CONDITION_OUTFIT) 
return doTeleportThing(uid, getTownTemplePosition(getPlayerTown(uid))) or doTeleportThing(uid, getPlayerMasterPos(uid)) and true
end

function castOn(uid)
return setPlayerStorageValue(uid, 10359, 1) and true
end

function castOff(uid)
return setPlayerStorageValue(uid, 10359, -1) and true
end

function castPlayer(uid, player)
if not isPlayer(player) then
cancelCast(uid)
return true
end

if getPlayerStorageValue(player, 10359) < 1 then
cancelCast(uid)
return true
end

if getPlayerStorageValue(uid, 12269) < 1 then
cancelCast(uid)
return true
end

mayNotMove(uid, true)
doSetItemOutfit(uid, 1934, -1)
doCreatureSetHideHealth(uid, true)
doTeleportThing(uid, getThingPos(player))
return addEvent(castPlayer, 1 * 1000, uid, player) and true
end

function whoCasted()
local casteds = {}

for _, pid in ipairs(getPlayersOnline()) do
if getPlayerStorageValue(pid, 10359) >= 1 then
table.insert(casteds, pid)
end
end

return #casteds > 0 and casteds or {}
end