local config = {
    delay = 400,                                  --Intervalo de tempo entre as "transformações" da porta, em milésimos.
    door = {20871, 20872, 20873},                       --{ID da porta fechada, ID da porta aberta pela metade, ID da porta aberta},
    ids = {
        [2187] = {                               --[action_id] = {
            {x = 1050, y = 1051, z = 7},         --Posições das portas.
            {x = 1053, y = 1053, z = 7},
        },
    },
}
function onStepIn(cid, item, position, fromPosition)
    if config.ids[item.actionid] then
        for _, pos in pairs(config.ids[item.actionid]) do
            if getTileItemById(pos, config.door[1]).uid > 0 then
                for i = 1, 2 do
                    addEvent(function()
                        doTransformItem(getTileItemById(pos, i == 1 and config.door[1] or config.door[2]).uid, config.door[i + 1])
                    end, i * config.delay)
                end
            end 
        end
    end
    return true
end
function onStepOut(cid, item, position, fromPosition)
    if config.ids[item.actionid] then
        for _, pos in pairs(config.ids[item.actionid]) do
            local it = getTileItemById(pos, config.door[3]).uid
            if it > 0 then
                if getSpectators(pos, 1, 1) then
                    return true
                end
            end
        end
        for _, pos in pairs(config.ids[item.actionid]) do
            if getTileItemById(pos, config.door[3]).uid > 0 then
                for i = 1, 2 do
                    addEvent(function()
                        doTransformItem(getTileItemById(pos, i == 1 and config.door[3] or config.door[2]).uid, config.door[i == 1 and 2 or 1])
                    end, i * config.delay)
                end
            end
        end
    end
    return true
end