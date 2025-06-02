local config = {
    positions = {
		["AREA VIP"] = { x = 1049, y = 1042, z = 6 },
		["Staff!"] = { x = 1051, y = 1042, z = 6 },
		["Leaf Valey"] = { x = 1027, y = 1062, z = 13 },
		["Fire Valey"] = { x = 1039, y = 1049, z = 13 },
		["Water Valey"] = { x = 1055, y = 1061, z = 13 },
		["Clique Aqui!"] = { x = 151, y = 125, z = 6 },
		["Bem Vindo!"] = { x = 151, y = 133, z = 6 },
		["Fishing Area"] = { x = 1053, y = 1052, z = 6 },
		["Atencao!!!"] = { x = 267, y = 490, z = 8 },
		["Atencao!!"] = { x = 265, y = 490, z = 8 },
		["Tasks"] = { x = 652, y = 1221, z = 7 },
		["Boost"] = { x = 651, y = 1222, z = 7 },
		["Boost/Tasks"] = { x = 1053, y = 1042, z = 5 },
		["Valleys/Tasks"] = { x = 1063, y = 1030, z = 7 },
		["Held Converter"] = { x = 960, y = 1063, z = 13 },
		["Held Fusion"] = { x = 955, y = 1063, z = 13 },
		["Held Machine"] = { x = 954, y = 1065, z = 13 },
		}

}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  