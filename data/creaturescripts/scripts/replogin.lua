function onLogin(cid) 
if getPlayerStorageValue(cid, 6003) <= 0 then
    setPlayerStorageValue(cid, 6001, 0)
    setPlayerStorageValue(cid, 6003, 1)
end
return TRUE
end