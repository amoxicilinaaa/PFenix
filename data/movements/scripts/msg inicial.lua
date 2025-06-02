function onStepIn(cid, item)
local msg = "###Bem vindo ao PokeChampions!###\n\nBoa Jornada.\n\n\n\nMais novidades virão!!" -- Mensagem que será mandada

if isPlayer(cid) then
doPlayerPopupFYI(cid, msg)
end
return true
end
