function onLogin(cid)



local config = {
msginiciantes = "Bem vindo ao Pokemon Roxy.",
sto = 13540, -- STORAGE
}
if getPlayerStorageValue(cid, sto) <= 0 then
doPlayerPopupFYI(cid, config.msginiciantes)
setPlayerStorageValue(sto, 1)
end
return true
end