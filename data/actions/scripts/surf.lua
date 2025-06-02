local pokes = {

["Poliwag"] = {lookType=629, speed = 10},--
["Virus Poliwag"] = {lookType=2553, speed = 15},
["Poliwhirl"] = {lookType=488, speed = 40},
["Seaking"] = {lookType=493, speed = 40},--
["Dewgong"] = {lookType=534, speed = 80},--
["Blastoise"] = {lookType=535, speed = 80},--
["Virus Blastoise"] = {lookType=2365, speed = 90},
["Tentacruel"] = {lookType=536, speed = 80},--
["Lapras"] = {lookType=1478, speed = 80},--
["Gyarados"] = {lookType=538, speed = 80},--
["Omastar"] = {lookType=539, speed = 80},--
["Kabutops"] = {lookType=540, speed = 80},--
["Poliwrath"] = {lookType=541, speed = 80},--
["Vaporeon"] = {lookType=542, speed = 50},--
["Staryu"] = {lookType=617, speed = 30},--
["Starmie"] = {lookType=618, speed = 70},--
["Goldeen"] = {lookType=619, speed = 20},--
["Seadra"] = {lookType=621, speed = 50},--
["Golduck"] = {lookType=622, speed = 70},--
["Squirtle"] = {lookType=624, speed = 20},--
["Wartortle"] = {lookType=626, speed = 40},--
["Tentacool"] = {lookType=628, speed = 20},--
["Snorlax"] = {lookType=651, speed = 30},--
----------------Shiny----------------------
["Shiny Blastoise"] = {lookType=1009, speed = 600},--
["Shiny Tentacruel"] = {lookType=1365, speed = 600},--
["Shiny Gyarados"] = {lookType=1381, speed = 600},
["Virus Gyarados"] = {lookType=2688, speed = 700},
["Shiny Vaporeon"] = {lookType=1383, speed = 600},        --alterado v1.6
["Shiny Seadra"] = {lookType=1376, speed = 600},--
["Shiny Tentacool"] = {lookType=1364, speed = 600},--
["Shiny Snorlax"] = {lookType=3313, speed = 600},
["Shiny Feraligatr"] = {lookType=1526, speed = 600},
["Shiny Swampert"] = {lookType=1895, speed = 60},
["Shiny Hydreigon"] = {lookType=3476, speed = 60},
--["Shiny Giant Magikarp"] = {lookType=1509, speed = 600},
----------------Johto----------------------
["Mantine"] = {lookType=987, speed = 80},--
["Totodile"] = {lookType=988, speed = 20},--
["Croconow"] = {lookType=989, speed = 40},--
["Feraligatr"] = {lookType=996, speed = 80},--
["Marill"] = {lookType=990, speed = 30},--
["Azumarill"] = {lookType=642, speed = 40},
["Quagsire"] = {lookType=993, speed = 70},--
["Kingdra"] = {lookType=995, speed = 100},--
["Octillery"] = {lookType=992, speed = 70},
["Wooper"] = {lookType=991, speed = 30},--
["Milotic"] = {lookType=1641, speed = 1000},
["Wailord"] = {lookType=1305, speed = 1000},
["Marshtomp"] = {lookType=1648, speed = 600},
["Mudkip"] = {lookType=1649, speed = 600},
["Swampert"] = {lookType=1650, speed = 600},
["Wailmer"] = {lookType=1654, speed = 600},
["Wailord"] = {lookType=1656, speed = 600},

}
local configs = {
[4647] = {x = -2, y = 0},
[4645] = {x = 2, y = 0},
[4646] = {x = 0, y = 2},
[4644] = {x = 0, y = -2},
[4632] = {x = 0, y = -2},
[4635] = {x = 2, y = 0},
[4634] = {x = 0, y = 2},
[4633] = {x = -2, y = 0},

[6639] = {x = 0, y = -2},
[6640] = {x = 2, y = 0},
[6641] = {x = 0, y = 2},
[6630] = {x = -2, y = 0},

[6627] = {x = 0, y = -2},
[6628] = {x = 2, y = 0},
[6629] = {x = 0, y = 2},


}
function onUse(cid, item, fromPosition, itemEx, toPosition)
local playerpos = getCreaturePosition(cid)
if #getCreatureSummons(cid) <= 0 and getPlayerStorageValue(cid, 63215) <= 0 then
return doPlayerSendCancel(cid, "You need a pokemon to surf.")
end
local l = false
for i,x in pairs(pokes) do
if getPlayerStorageValue(cid, 63215) <= 0 and i:lower() == getCreatureName(getCreatureSummons(cid)[1]):lower() then
l = true
end
end
if not l and getPlayerStorageValue(cid, 63215) <= 0 then
return doPlayerSendCancel(cid, "This pokemon can't surf.")
end
if getPlayerStorageValue(cid, 63215) <= 0 then
doTeleportThing(cid, {x=playerpos.x+configs[itemEx.itemid].x, y=playerpos.y+configs[itemEx.itemid].y, z=playerpos.z})
setPlayerStorageValue(cid, 63215, 1)
doSetCreatureOutfit(cid, pokes[getCreatureName(getCreatureSummons(cid)[1])], -1)
doCreatureSay(cid, "Let's surf, "..getCreatureName(getCreatureSummons(cid)[1]), 1)
setPlayerStorageValue(cid, 61209, getCreatureMaxHealth(getCreatureSummons(cid)[1]))
setPlayerStorageValue(cid, 61210, getCreatureHealth(getCreatureSummons(cid)[1]))
doChangeSpeed(cid, pokes[getCreatureName(getCreatureSummons(cid)[1])].speed)
doRemoveCreature(getCreatureSummons(cid)[1])
else
        local item = getPlayerSlotItem(cid, 8)
        local pokemon = getItemAttribute(item.uid, "poke")
        local x = pokes[pokemon]
        
        doTeleportThing(cid, {x=playerpos.x-configs[itemEx.itemid].x, y=playerpos.y-configs[itemEx.itemid].y, z=playerpos.z})
        setPlayerStorageValue(cid, 63215, 0)
        doRemoveCondition(cid, CONDITION_OUTFIT)
        
        if getItemAttribute(item.uid, "nick") then
			doCreatureSay(cid, getItemAttribute(item.uid, "nick")..", I'm tired of surfing!", 1)
		else
			doCreatureSay(cid, getItemAttribute(item.uid, "poke")..", I'm tired of surfing!", 1)
        end
        
        doSummonMonster(cid, pokemon)
        local pk = getCreatureSummons(cid)[1]
		doRegainSpeed(cid)
        adjustStatus(pk, item.uid, true, false, true)
end
return true
end