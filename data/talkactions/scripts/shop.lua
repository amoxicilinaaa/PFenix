local config = {

	["fire stone"] = {id = 11447, sell = 'yes 20000', buy = 'yes 30000' },

	["leaf stone"] = {id = 11441, sell = 'yes 20000', buy = 'no' },

	["water stone"] = {id = 11442, sell = 'yes 20000', buy = 'no' }

}


function upperfirst(first, rest)

	return first:upper()..rest:lower()

end


function onSay(cid, words, param, channel)


	if (param == nil or param == '' or param == 'lista' or param == 'list') then

		if (words == "!sell" or words == "/sell") then

			str = "Showing items that you can sell:\n\n"

		else

			str = "Showing items that you can buy:\n\n"

		end

		for item, vars in pairs(config) do

			if (words == "!sell" or words == "/sell") then

				expl = string.explode(vars.sell, " ")

			else

				expl = string.explode(vars.buy, " ")

			end

			item = item:gsub("(%a)([%w_']*)", upperfirst)

			if (expl[1] == 'no') then

				str = str

			else

				str = str .. item.. " - " .. expl[2] .. " gps\n"

			end

		end

		return doShowTextDialog(cid, 2160, str)

	end

	local item = config[param:lower()]

	param = param:lower()

	if (item) then

		local sell = string.explode(item.sell, " ")

		local buy = string.explode(item.buy, " ")

		if (words == "!sell" or words == "/sell") then

			if (sell[1] == "yes") then

				if (doPlayerRemoveItem(cid, item.id, 1)) then

					doPlayerAddMoney(cid, sell[2])

					doSendMagicEffect(getPlayerPosition(cid), 30)

					return doPlayerSendTextMessage(cid,29,"Here are, you sold "..param.." for "..sell[2].." gold coins.")

				else

					doSendMagicEffect(getPlayerPosition(cid), 2)

					return doPlayerSendTextMessage(cid,29,"You don't have anything "..param.." to sell.")

				end

			else

				doSendMagicEffect(getPlayerPosition(cid), 2)

				return doPlayerSendTextMessage(cid,29,"Sorry, "..param.." cannot be sold.")

			end

		else

			if (buy[1] == "yes") then

				if (doPlayerRemoveMoney(cid, buy[2])) then

					doPlayerAddItem(cid, item.id)

					doSendMagicEffect(getPlayerPosition(cid), 28)

					return doPlayerSendTextMessage(cid,29,"Here are, you bought "..param.." for "..buy[2].." gold coins.")

				else

					doSendMagicEffect(getPlayerPosition(cid), 2)

					return doPlayerSendTextMessage(cid,29,"You don't have enough money.")

				end

			else

				doSendMagicEffect(getPlayerPosition(cid), 2)

				return doPlayerSendTextMessage(cid,29,"Sorry, "..param.." cannot be bought.")

			end

		end


	else

		doSendMagicEffect(getPlayerPosition(cid), 2)

		if (words == "!sell") then

			return doPlayerSendTextMessage(cid,29,"Sorry, this item cannot be sold or it does't exist.")	

		else

			return doPlayerSendTextMessage(cid,29,"Sorry, this item cannot be bought or it does't exist.")	

		end

	end

end	
