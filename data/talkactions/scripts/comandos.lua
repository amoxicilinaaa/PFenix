local msg = [[
|--------------------Comandos--------------------|
-!vantagensvip ou !vantagens para saber mais 
sobre ser VIP account.
-!bug, para retornar ao CP
-!house, para ver comandos de casas
-!afk on, ou !afk off.
-!anuncio "msg", anunciar para todo o server.
-"correr", para aumentar sua velocidade.
-!pokeballs "pokemon" para ver balls usadas.
-!report "msg", para reportar um bug,
ou se preferir use CTRL+R.
-/pos, para ver sua posicao e reportar 
-possiveis erros de mapa.
-!luz 
-!bank, para ver os comandos do bank system.

|------------------Server Info-------------------|
-Exp Rate: 35x (easy/medium)
-Catch rate: 20x (medium/hard)
-Spawn rate: 5x (easy)
]]
function onSay(cid, words, param)
doPlayerPopupFYI(cid, msg)
end