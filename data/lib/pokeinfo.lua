function doPokeInfoAttr(cid)

if not getCreatureSummons(cid)[1] then
doPlayerSendCancel(cid, "##77PIN:RMATTR")
doPlayerSendCancel(cid, "")
return true
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["fly"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,FLY")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["rock smash"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,RSM")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["light"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,LGT")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["dig"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,DIG")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["blink"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,BLK")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["ride"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,RDI")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["surf"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,SRF")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["teleport"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,TPR")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["cut"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,CUT")
doPlayerSendCancel(cid, "")
end
end

function doUpdatePokeInfo(cid)
local owner = getCreatureMaster(cid)
if getCreatureSummons(owner)[1] then
local pokeball = getPlayerSlotItem(cid, 8)
doPokeInfoAttr(cid)
doPlayerSendCancel(owner, "PokeInfo@"..getItemAttribute(pokeball.uid, "poke").."@"..getItemAttribute(pokeball.uid, "poke").."@"..getItemAttribute(pokeball.uid, "poke").."")
doPlayerSendCancel(owner, "")
else
doPlayerSendCancel(owner, "")
end
end

function doUsePokemon(cid)
if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid >= 1 then
doUseItem(cid, getPlayerSlotItem(cid, 8).uid)
else
doPlayerSendCancel(cid, "")
end
end

function doPokeInfoAttack(cid)
doPlayerSendCancel(getCreatureMaster(cid), "PokeInfoAtk")
doPlayerSendCancel(getCreatureMaster(cid), "")
end

function doPokeInfoReset(cid)
local owner = getCreatureMaster(cid)
doPlayerSendCancel(owner, "PokeInfoReset")
doPlayerSendCancel(owner, "")
end