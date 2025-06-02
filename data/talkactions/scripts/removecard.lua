function onSay(cid, words, param)

local summons = getCreatureSummons(cid)

for _, k in ipairs(summons) do

doRemoveCreature(k)

return true

end

return true

end