function onUse(cid, item, fromPos, item2, toPos)

if getPlayerStorageValue(cid, 54843) == -1 then
setPlayerStorageValue(cid, 54843, 0)
end

if getPlayerStorageValue(cid, 54844) == -1 then
setPlayerStorageValue(cid, 54844, 0)
end

		local stt = ""

		stt = "• Tentativas de capturar pokemons: "..getPlayerStorageValue(cid, 54843).."\n"
		stt = stt.."• Capturar que deram certo: "..getPlayerSoul(cid).."\n"
		stt = stt.."• Capturas que deram errado: "..getPlayerStorageValue(cid, 54843) - getPlayerSoul(cid).."\n\n"
		
		stt = stt.."Ele capturou esses pokemon:\n"

local t = getCatchList(cid)

if #t <= 0 then
	stt = stt.."\nNone."
	doShowTextDialog(cid, 7385, stt)
return true
end

for b = 1, #oldpokedex do
	for a = 1, #t do
		if t[a] == oldpokedex[b][1] then
		stt = stt.."\n["..threeNumbers(b).."] - "..t[a]..""
		end
	end
end
		
	doShowTextDialog(cid, 7385, stt)


return true
end
