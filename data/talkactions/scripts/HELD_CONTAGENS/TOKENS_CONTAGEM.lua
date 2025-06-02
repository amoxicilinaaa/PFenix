function onSay(cid, words, param, channel)

txt = "         [CONTAGEM DE HELD TOKENS]:\n\n\*Devoted Tokens (Verde): "..getPlayerItemCount(cid, 24149).."x\n\*Mighty Tokens (Azul): " .. getPlayerItemCount(cid, 24150) .. "x\n\*Honored Tokens: (Vermelho): " .. getPlayerItemCount(cid, 24148) .. "x"
doShowTextDialog(cid, 24149, txt)
	return true
	end

