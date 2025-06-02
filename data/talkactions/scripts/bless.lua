local bless = {1, 2, 3, 4, 5}
local cost = 50

function onSay(cid, words, param)

for i = 1, table.maxn(bless) do

if(getPlayerBlessing(cid, bless[i])) then
doPlayerSendCancel(cid, "Voce ja tem todas as bless.")
return TRUE
end
end

if(doPlayerRemoveItem(cid, 2160, cost) == TRUE) then
for i = 1, table.maxn(bless) do
doPlayerAddBlessing(cid, bless[i])
end

doCreatureSay(cid, "You are now blessed!" ,19)
doSendMagicEffect(getPlayerPosition(cid), 49)
else
doPlayerSendCancel(cid, "Voce precisa de 10 diamonds para a bless.")
end
return TRUE
end	