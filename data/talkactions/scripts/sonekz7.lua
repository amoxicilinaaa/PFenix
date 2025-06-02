 --- [SONEKZ OTCLIENT] --- ]
 --- (TPWINDOW: POKEMON LIST TELEPORT HABILITY) --- ]

function onSay(cid, words, param, channel)
	
local item = 1949
file = io.open('./data/[SONEKZ OTCLIENT] - TPWINDOW_POKEMONSLIST.txt','r')
sonekzotclient = file:read(-1)
doShowTextDialog(cid,item,sonekzotclient)
doPlayerSendCancel(cid, "")
return true
end