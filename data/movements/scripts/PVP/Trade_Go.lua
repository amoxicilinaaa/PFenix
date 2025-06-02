local s = {
--[action id] = {pos de volta}
[33691] = {x=845,y=1398,z=7}, -- Cinnabar
[33692] = {x=722,y=849,z=7}, -- pewter
[33693] = {x=1058,y=902,z=7}, -- cerulean
[33694] = {x=1059,y=1051,z=6}, -- saffron
[33695] = {x=1079,y=1235,z=7}, -- vermillion
[33696] = {x=1211,y=1323,z=7}, -- fuchsia
[33697] = {x=704,y=1088,z=7}, -- viridian
[33698] = {x=859,y=1098,z=6}, -- celadon
[33699] = {x=1204,y=1044,z=7}, -- Lavender
[33711] = {x=269,y=1167,z=7}, -- Larrosse
[33712] = {x=246,y=1033,z=7}, -- Orre
[33713] = {x=257,y=1263,z=6}, -- Canavale
[33714] = {x=734,y=1195,z=7}, -- Pallet
[33715] = {x=2619,y=989,z=7}, -- Alagoinha
[33716] = {x=764,y=222,z=7}, -- Castelia
[33717] = {x=1864,y=1902,z=7}, -- Goldenrod
[33718] = {x=1938,y=1926,z=7}, -- Azalea
[33719] = {x=1986,y=1882,z=7}, -- Violet
[33720] = {x=2042,y=1910,z=7}, -- Cherrygrove
[33721] = {x=1788,y=1832,z=7}, -- Olivine
[33722] = {x=1839,y=1831,z=7}, -- Ecruteak
[33723] = {x=1921,y=1824,z=7}, -- Mahogany
[33724] = {x=1767,y=1921,z=7}, -- Cianwood
[33725] = {x=2000,y=1821,z=7}, -- Blackthorn
}

local b = {
--[action id] = {{pos para onde ir}, {pos de volta}},
[33702] = {{x=907,y=1086,z=13}, {x=985,y=1083,z=13}}, -- Clan Psycraft
[33703] = {{x=862,y=1086,z=13}, {x=982,y=1083,z=13}}, -- Clan Orebound
[33704] = {{x=820,y=1086,z=13}, {x=979,y=1083,z=13}}, -- Clan Wingeon
[33705] = {{x=779,y=1085,z=13}, {x=976,y=1083,z=13}}, -- Clan Naturia
[33706] = {{x=737,y=1085,z=13}, {x=973,y=1083,z=13}}, -- Clan Seavel
[33707] = {{x=697,y=1085,z=13}, {x=970,y=1083,z=13}}, -- Clan Gardestrike
[33708] = {{x=656,y=1085,z=13}, {x=967,y=1083,z=13}}, -- Clan Malefic
[33709] = {{x=616,y=1085,z=13}, {x=964,y=1083,z=13}}, -- Clan Raibolt
[33710] = {{x=575,y=1085,z=13}, {x=961,y=1083,z=13}}, -- Clan Volcanic
}

function onStepIn(cid, item, pos)
if isSummon(cid) then
return false
end
--
local posi = {x=969, y=1068, z=13} --posiçao do Trade Center...
local pos = s[item.actionid]
local storage = 171877 
--
if b[item.actionid] then
   pos = b[item.actionid][2]
   posi = b[item.actionid][1] 
   storage = 171878
end
setPlayerStorageValue(cid, storage, "/"..pos.x..";"..pos.y..";"..pos.z.."/")
--
if #getCreatureSummons(cid) >= 1 then
   for i = 1, #getCreatureSummons(cid) do
       doTeleportThing(getCreatureSummons(cid)[i], {x=posi.x - 1, y=posi.y, z=posi.z}, false)
   end
end 
doTeleportThing(cid, {x=posi.x, y=posi.y, z=posi.z}, false)  
return true
end