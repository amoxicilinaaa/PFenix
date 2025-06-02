local msg = [[
|--------Comandos Auto Loot--------|
/aloot add: fire stone (Exexmplo)
/aloot remove: fire stone (Exemplo)
/aloot list  (Para ver a sua lista)
]]
function onSay(cid, words, param)
doPlayerPopupFYI(cid, msg)
end