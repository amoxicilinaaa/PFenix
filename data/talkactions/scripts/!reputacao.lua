function onSay(cid, words)
local msg = [[ Bom o sistema de Reputação fuciona da seguinte forma:


•1- !rep (nome do player) - dá REP para o player.


•2- !myrep - consulta minha reputação.


•3- !rankrep - confere os REP's de quem está online.


•4- Você pode ganhar muitos REP's ajudando as pessoas.



------ OBS: Pode haver eventos no server para quem tiver ------
             uma certa quantidade de reputação. 
]]

doPlayerPopupFYI(cid, msg)
return true
end