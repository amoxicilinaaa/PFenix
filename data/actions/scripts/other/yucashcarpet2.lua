 -- Edited By Yucash Cifer --
 -- mantenha os créditos <3 --
 -- NÃO É IDENTICO ao otpokémon. Ele apenas TRANSFORMA e VOLTA o item de acordo com a function. (onUse). É algo simples. Espero ter ajudado.
 -- FAÇA exatamente como está REGISTRADO neste código. Eu não me responsabilizo pelas suas edições futuras. xD

local Carpetyucash = {

--
	[24338] =  24341,
	[24341] =  24338,
--
    [24337] = 24340,
    [24340] = 24337,
--
    [24336] =  24339,
	[24339] =  24336,
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