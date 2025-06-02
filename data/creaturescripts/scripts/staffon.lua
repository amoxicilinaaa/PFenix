local groups = {2, 3, 4}
function onLogin(cid)
    if isInArray(groups, getPlayerGroupId(cid)) then
        doBroadcastMessage(""..getPlayerName(cid).." esta online")
    end
    return true
end