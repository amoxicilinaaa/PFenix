function onSay(cid, words, param, channel)
    if(param == '') then
        return true
    end
 
local list = {}
for i, tid in ipairs(getPlayersOnline()) do
list[i] = tid
end
for i = 1, #list do
doSendPlayerExtendedOpcode(list[i], 90, param)
end
    return true
end