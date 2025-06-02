function onSay(cid, words)
local msg = [[ Bom o sistema de Headbutt funciona da seguinte maneira:


•1- Você dá DEX em um pokemon e vê se ele tem a 
    habilidade de Headbutt.

•2- Vá até uma árvore habitada que tem em todo o mapa.


•3- Solte seu Pokemon, e dê order, logo apos 
    clique na árvore habitada.

•4- No mesmo instante virá um ou mais pokémons.




------ OBS: Pode dropar itens raros nesses pokemons que  ------
                  você retirar das árvores.
]]

doPlayerPopupFYI(cid, msg)
return true
end