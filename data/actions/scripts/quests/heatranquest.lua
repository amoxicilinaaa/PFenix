local posis = {
{'Volcanic',    {x=1159, y=376, z=7}}, --nome de cada clan e a pos aonde o player desse clan tem q tar...
{'Seavell',     {x=1158, y=376, z=7}},
{'Orebound',    {x=1157, y=376, z=7}},
{'Wingeon',     {x=1156, y=376, z=7}},
}

local toPosi = {x=1168, y=391, z=8} --pos pra onde os players serao teleportados

function onUse(cid, item, frompos, item2, topos)


for _, array in ipairs(posis) do
local p = getRecorderPlayer(array[2])
if not isPlayer(p) or getPlayerLevel(cid) <= 100 then
doPlayerSendTextMessage(cid, 27, "Algum dos players não está na posição correta ou não possui level 100!")
return true
end
end
for _, array in ipairs(posis) do
local p = getRecorderPlayer(array[2])
if isPlayer(p) then
doTeleportThing(p, toPosi)
doSendMagicEffect(getThingPos(p), 21)
end
end

return true
end