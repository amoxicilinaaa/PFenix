function onLogout(cid)
    if getPlayerStorageValue(cid, 12120) > 0 then
        return doPlayerSendCancel(cid, "You can't logout while riding in the bike.") and false
    end
return true
end?