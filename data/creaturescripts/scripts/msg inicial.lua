function onStepIn(cid, item)
local msg = "Bem vindo ao Pokemon Roxy!" -- Mensagem que será mandada

if isPlayer(cid) then
doPlayerPopupFYI(cid, msg)
end
return true
end
