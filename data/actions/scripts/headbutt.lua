local tempo = 3 -- tempo em segundos

local monsters = {
    [80] = {"Caterpie", "Kakuna", "Metapod", "Weedle", "Paras"}, --[chance] = {para cair um dos monstros}
    [60] = {"Beedrill", "Parasect", "Wurmple", "Venonat", "Spinarak", "Pinsir"},
    [50] = {"Butterfree", "Yanma", "Silcoon", "Joltik"},
    [40] = {"Dustox", "Burmy", "Swadloon", "Ledian"},
    [30] = {"Leavanny", "Shelmet", "Vespiquen", "Heracross"},
    [10] = {"Yanmega", "Forretress", "Accelgor", "Galvantula"}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid, 23491) >= os.time() then
    doPlayerSendCancel(cid, "You must wait " .. tempo .. " to use again.")
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
    return true
end
local e = {2,3,4,5,6,9}
local t = {}
for _, v in pairs(monsters) do 
table.insert(t, _)
end
table.sort(t)
for _, v in pairs(t) do
if math.random(1, 100) < v then
c = v
break
end
end
local m = monsters[c][math.random(1,#monsters[c])]
local monster = doCreateMonster(m, getPlayerPosition(cid))
doSendMagicEffect(getCreaturePosition(monster), CONST_ME_TELEPORT)
doSendMagicEffect(toPosition, e[math.random(1,#e)])
doCreatureSay(monster, m.." was hidden on top of the tree! HAHAHA!", TALKTYPE_ORANGE_1)
setPlayerStorageValue(cid, 23491, tempo + os.time())
return true
end