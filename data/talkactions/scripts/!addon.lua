function onSay(cid, words)
local msg = [[ Bom o sistema de Addon pra pokemons funciona da seguinte maneira:


•1- Pegue um item de addon, que é encotrado nas box addon,
    que cai em todos os pokemonns do mapa.

•2- Der LOOK no item e veja de que pokemon ele pertence.


•3- depois puxe se pokemon para dentro da Pokebola, e de Use no 
    item do addon.

•4- Logo após solte seu pokemon. Pronto seu pokemon agora 
    ta com uma Roupa.


•5 - (OBS: Sistema de Addon ainda não disponível) :)



------ OBS: Para retirar o addon so diga !addons remove ------
]]

doPlayerPopupFYI(cid, msg)
return true
end