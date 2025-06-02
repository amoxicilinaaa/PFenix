local posis = {
{'Volcanic',    {x=163, y=438, z=7}}, --nome de cada clan e a pos aonde o player desse clan tem q tar...
{'Seavell',     {x=163, y=440, z=7}},
{'Orebound',    {x=163, y=442, z=7}},
{'Wingeon',     {x=165, y=443, z=7}},
{'Malefic',     {x=167, y=442, z=7}},
{'Gardestrike', {x=167, y=440, z=7}},
{'Psycraft',    {x=167, y=438, z=7}},
{'Naturia',     {x=165, y=440, z=7}},
{'Raibolt',     {x=165, y=437, z=7}},
}

local toPosi = {x=120, y=423, z=8} --pos pra onde os players serao teleportados

function onUse(cid, item, frompos, item2, topos)


for _, array in ipairs(posis) do
local p = getRecorderPlayer(array[2])
if not isPlayer(p) or getPlayerLevel(cid) <= 200 then
doPlayerSendTextMessage(cid, 27, "Algum dos players não está na posição correta ou não possui level 200+!")
return true
end
end
for _, array in ipairs(posis) do
local p = getRecorderPlayer(array[2])
if isPlayer(p) then
doTeleportThing(p, toPosi)
doSendMagicEffect(getThingPos(p), 21)
doPlayerSendTextMessage(cid, 27, "Voce entrou na Golden Quest! Boa Sorte!")
end
end

return true
end