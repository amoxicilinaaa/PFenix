 -- Edited By Yucash Cifer --
 -- mantenha os créditos <3 --
 -- NÃO É IDENTICO ao otpokémon. Ele apenas TRANSFORMA e VOLTA o item de acordo com a function. (onUse). É algo simples. Espero ter ajudado.
 -- FAÇA exatamente como está REGISTRADO neste código. Eu não me responsabilizo pelas suas edições futuras. xD

local Carpetyucash = {
	-- carpet vermelho--
	[22107] = 22108, -- [ ] = id que está o item
	[22108] = 22107, -- id fora das caixas = id que ele vai virar
	-- carpet vermelho diferente --
	[22109] = 22110,
	[22110] = 22109,
	-- carpet azul 22111 --
        [22111] = 22112,
        [22112] = 22111,
	-- carpet verde --
		[22113] = 22114,
		[22114] = 22113,
	-- vinho e rosa
		[22706] = 22707,
		[22707] = 22706,
	--  desenhado azul
	    [22714] = 22715,
		[22715] = 22714,
	--  desenhado amarelo
	    [22717] = 22716,
		[22716] = 22717,
	--  onça
	    [22718] = 22719,
		[22719] = 22718,
	--  felpudo
	    [22720] = 22721,
		[22721] = 22720,
	--  losangulo roza
	    [22722] = 22723,
		[22723] = 22722,
	--  azul esc. detalhe quadrado
	    [22724] = 22725,
		[22725] = 22724,
	--  redondo azul claro
	    [22726] = 22727,
		[22727] = 22726,
	--  estrela amarela
	    [22728] = 22729,
		[22729] = 22728,
	--  gengar
	    [22731] = 22730,
		[22730] = 22731,
	--  azul e vermelho
	    [22732] = 22733,
		[22733] = 22732,
	--  azul e roxo
	    [22734] = 22735,
		[22735] = 22734,
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(not Carpetyucash[item.itemid]) then
		return true
	end

	doTransformItem(item.uid, Carpetyucash[item.itemid])
	doDecayItem(item.uid)
	return true
end



-- tags que eu usei e que não constam erros na distro nem na function --

-- 	<action fromid="13156" toid="13157" event="script" value="other/yucashcarpet.lua"/>
--	<action fromid="13033" toid="13034" event="script" value="other/yucashcarpet.lua"/>
--	<action fromid="13021" toid="13027" event="script" value="other/yucashcarpet.lua"/>