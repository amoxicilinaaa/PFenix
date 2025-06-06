local ballcatch = {                    --id normal, id da ball shiy
[2394] = {cr = 4, on = 193, off = 192, ball = {11826, 11737}, send = 47, typeee = "normal", boost = "0"},  --alterado v1.9  \/
[2391] = {cr = 8, on = 198, off = 197, ball = {11832, 11740}, send = 48, typeee = "great", boost = "0"},
[2393] = {cr = 12, on = 202, off = 201, ball = {11835, 11743}, send = 46, typeee = "super", boost = "0"},
[2392] = {cr = 17, on = 200, off = 199, ball = {11829, 11746}, send = 49, typeee = "ultra", boost = "0"},
[12617] = {cr = 14, on = 204, off = 203, ball = {10975, 12621}, send = 35, typeee = "saffari", boost = "0"}, 
[12832] = {cr = 100000, on = 196, off = 196, ball = {12826, 12829}, send = 181, typeee = "dark", boost = "50"},


[15677] = {cr = 20, on = 313, off = 314, ball = {16181, 16204}, send = 72, typeee = "magu", boost = "0", type = {"fire", "ground"}},
[15676] = {cr = 20, on = 316, off = 317, ball = {16182, 16205}, send = 73, typeee = "sora", boost = "0", type = {"ice", "flying"}},
[15678] = {cr = 20, on = 320, off = 321, ball = {16183, 16206}, send = 74, typeee = "yume", boost = "0", type = {"normal", "psychic"}},
[15680] = {cr = 20, on = 322, off = 323, ball = {16184, 16207}, send = 75, typeee = "dusk", boost = "0", type = {"rock", "fighting"}},
[15673] = {cr = 20, on = 331, off = 332, ball = {16187, 16210}, send = 78, typeee = "tale", boost = "0", type = {"dragon", "fairy"}},
[15674] = {cr = 20, on = 334, off = 335, ball = {16188, 16211}, send = 79, typeee = "moon", boost = "0", type = {"dark", "ghost"}},
[15675] = {cr = 20, on = 337, off = 338, ball = {16189, 16212}, send = 80, typeee = "net", boost = "0", type = {"bug", "water"}},
[15679] = {cr = 20, on = 343, off = 344, ball = {16191, 16214}, send = 82, typeee = "premier", boost = "0", type = {"rock", "fighting"}},
[15681] = {cr = 20, on = 346, off = 347, ball = {16192, 16215}, send = 83, typeee = "tinker", boost = "0", type = {"electric", "steel"}},


[15682] = {cr = 20, on = 325, off = 326, ball = {16185, 16208}, send = 76, typeee = "fast", boost = "0", pokes = {"Pikachu", "Raichu"}},
[15672] = {cr = 20, on = 328, off = 329, ball = {16186, 16209}, send = 77, typeee = "heavy", boost = "0", pokes = {"Snorlax", "Venusaur"}},
}

function onUse(cid, item, frompos, item3, topos)

local item2 = getTopCorpse(topos)
if item2 == null then
   return true
end

if getItemAttribute(item2.uid, "catching") == 1 then
   return true
end  

if getItemAttribute(item2.uid, "golden") and getItemAttribute(item2.uid, "golden") == 1 then
   return doPlayerSendCancel(cid, "You can't try to catch a pokemon in the Golden Arena!")   
end

local name = string.lower(getItemNameById(item2.itemid))
      name = string.gsub(name, "fainted ", "")
      name = string.gsub(name, "defeated ", "")
      name = doCorrectPokemonName(name)
local x = pokecatches[name]

if not x then return true end

local shinys = {""}
if item.itemid == 12832 and isInArray(shinys, name) then
   doPlayerSendCancel(cid, "Voc� n�o pode catar esse pokemon com a master ball!")
return true
end
	
local storage = newpokedex[name].stoCatch 
if getPlayerStorageValue(cid, storage) == -1 or not string.find(getPlayerStorageValue(cid, storage), ";") then  --alterado v1.9 
   setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, dark = 0;")             --alterado v1.9 
end     

local owner = getItemAttribute(item2.uid, "corpseowner")
	
if owner and isCreature(owner) and isPlayer(owner) and cid ~= owner then   
   doPlayerSendCancel(cid, "You are not allowed to catch this pokemon.")
   return true
end

local newidd = isShinyName(name) and ballcatch[item.itemid].ball[2] or ballcatch[item.itemid].ball[1] --alterado v1.9       
local typeee = ballcatch[item.itemid].typeee
local boost = ballcatch[item.itemid].boost
	

local catchinfo = {}
      catchinfo.rate = ballcatch[item.itemid].cr
      catchinfo.catch = ballcatch[item.itemid].on
      catchinfo.fail = ballcatch[item.itemid].off
      catchinfo.newid = newidd                      
      catchinfo.name = doCorrectPokemonName(name)
      catchinfo.topos = topos
      catchinfo.chance = x.chance

doSendDistanceShoot(getThingPos(cid), topos, ballcatch[item.itemid].send)
doRemoveItem(item.uid, 1)

local d = getDistanceBetween(getThingPos(cid), topos)
		
if getPlayerStorageValue(cid, 98796) >= 1 and getPlayerItemCount(cid, 12617) <= 0 then  --alterado v1.9
   setPlayerStorageValue(cid, 98796, -1) 
   setPlayerStorageValue(cid, 98797, -1)                                              
   doTeleportThing(cid, SafariOut, false)
   doSendMagicEffect(getThingPos(cid), 21)
   doPlayerSendTextMessage(cid, 27, "You spend all your saffari balls, good luck in the next time...")
end

addEvent(doSendPokeBall, d * 70 + 100 - (d * 14) , cid, catchinfo, false, false, typeee) 
addEvent(doSendMagicEffect, (d * 70 + 100 - (d * 14)) - 100, topos, 3)
return true
end
