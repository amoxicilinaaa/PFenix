function onSay(cid, words)
local msg = [[ Bom o sistema de Clan funciona da seguinte maneira:


•1- Vá ate o PvP, logo acima você vai encotrar várias entradas.


•2- Lá irão ter as áreas de clans.


•3- Entre na qual você acha que o tipo é melhor.


•4- Logo após fale com o NPC "hi" depois "clan" depois "yes".




------ OBS: Vantagens: o pokemon do tipo do clan que você está, ------
                 ele terá ataques mais fortes.
]]

doPlayerPopupFYI(cid, msg)
return true
end