function spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function onSay(cid, words, param, channel)

    local infoToSend = {
        action = "showPokeBallsOptions",
        pokes = {},
        page = 0,
        pageMax = math.ceil(#pokes_info/10),
    }


    if param and tonumber(param) then
        local value = tonumber(param) * 10
        local limit = 10 + value
        local iter = 0
        
        for pokeName, info in spairs(pokes_info, function(tab, a, b) return tab[a].dex < tab[b].dex end) do
            if iter >= limit then
                break
            end
    
            if info.dex and iter >= value then
                table.insert(infoToSend.pokes, {pokeName = pokeName, brokes = getPokemonBrokes(cid, pokeName), points = getPokemonCatchPoints(cid, pokeName), needed_points = info.points_required, balls = info.info.balls, xp_received = info.info.xp_received, npc_price = info.info.npc_price, dex = info.dex})
            end

            iter = iter + 1
        end
        infoToSend.page = tonumber(param)
        doSendPlayerExtendedOpcode(cid, 24, json.encode(infoToSend))

        return true
    end

    if param and tostring(param) and tostring(param) ~= "" then
        local limit = 10
        local iter = 0
        
        for pokeName, info in spairs(pokes_info, function(tab, a, b) return tab[a].dex < tab[b].dex end) do
            if iter >= limit then
                break
            end
    
            if info.dex and string.find(string.lower(pokeName), string.lower(tostring(param))) then
                table.insert(infoToSend.pokes, {pokeName = pokeName, brokes = getPokemonBrokes(cid, pokeName), points = getPokemonCatchPoints(cid, pokeName), needed_points = info.points_required, balls = info.info.balls, xp_received = info.info.xp_received, npc_price = info.info.npc_price, dex = info.dex})
                iter = iter + 1
            end

        end
        infoToSend.page = tonumber(param)
        doSendPlayerExtendedOpcode(cid, 24, json.encode(infoToSend))

        return true
    end

    local limit = 10
    for pokeName, info in spairs(pokes_info, function(tab, a, b) return tab[a].dex < tab[b].dex end) do
        if limit <= 0 then
            break
        end

        if info.dex then
            table.insert(infoToSend.pokes, {pokeName = pokeName, brokes = getPokemonBrokes(cid, pokeName), points = getPokemonCatchPoints(cid, pokeName), needed_points = info.points_required, balls = info.info.balls, xp_received = info.info.xp_received, npc_price = info.info.npc_price, dex = info.dex})

            limit = limit - 1
        end
    end

    doSendPlayerExtendedOpcode(cid, 24, json.encode(infoToSend))

	return true
end
