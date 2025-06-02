local posis = {
{'Volcanic',    {x=624, y=525, z=7}}, --nome de cada clan e a pos aonde o player desse clan tem q tar...
{'Seavell',     {x=623, y=525, z=7}},
{'Orebound',    {x=622, y=525, z=7}},
{'Wingeon',     {x=621, y=525, z=7}},
}

local toPosi = {x=641, y=552, z=8} --pos pra onde os players serao teleportados

function onUse(cid, item, frompos, item2, topos)


for _, array in ipairs(posis) do
local p = getRecorderPlayer(array[2])
if not isPlayer(p) or getPlayerLevel(cid) <= 150 then
doPlayerSendTextMessage(cid, 27, "Algum dos players não está na posição correta ou não possui level 150!")
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