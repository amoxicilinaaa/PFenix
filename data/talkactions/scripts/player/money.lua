function onSay(cid, words, param, channel)
    local cooldownStorage = 188735 -- Storage para o cooldown
    local moneyStorage = 188734 -- Storage para o dinheiro
    local maxMoneyStorage = 188736 -- Storage para o valor máximo configurável
    local cooldownTime = 0 * 10 -- 5 minutos em segundos
    local currentTime = os.time()

    -- Verifica se o valor no storage do dinheiro está diferente de zero e reseta
    if getPlayerStorageValue(cid, moneyStorage) ~= 0 then
        setPlayerStorageValue(cid, moneyStorage, 0)
    end

    -- Verifica se o jogador ainda está no cooldown
    local lastUsage = getPlayerStorageValue(cid, cooldownStorage)
    if lastUsage ~= -1 and currentTime < lastUsage + cooldownTime then
        local remainingTime = (lastUsage + cooldownTime) - currentTime
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 
            string.format("Aguarde %d segundos para usar o comando novamente.", remainingTime))
        return true
    end

    -- Se o cooldown terminou, reseta o storage do dinheiro
    if lastUsage ~= -1 and currentTime >= lastUsage + cooldownTime then
        setPlayerStorageValue(cid, moneyStorage, 0)
    end

    -- Atualiza o tempo de uso do comando no storage
    setPlayerStorageValue(cid, cooldownStorage, currentTime)

    -- Armazena o valor atual do jogador (em gold)
    local totalMoney = getPlayerMoney(cid)
    
    -- Obtém o valor máximo configurável
    local maxMoney = getPlayerStorageValue(cid, maxMoneyStorage)
    if maxMoney == -1 then
        -- Define um valor padrão caso o storage não tenha sido configurado (exemplo: 5 milhões)
        maxMoney = 7000000000
        setPlayerStorageValue(cid, maxMoneyStorage, maxMoney)
    end
    
    -- Verifica se o jogador tem mais do que o valor máximo configurável
    if totalMoney > maxMoney then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 
            string.format("Você não pode usar este comando com mais de %d de dinheiro.", maxMoney))
        return true
    end
    
    -- Armazena o valor do dinheiro no storage
    setPlayerStorageValue(cid, moneyStorage, totalMoney)

    -- Remove o dinheiro do jogador
    doPlayerRemoveMoney(cid, totalMoney)

    -- Adiciona o dinheiro de volta para o jogador (de acordo com o valor armazenado no storage)
    local storedMoney = getPlayerStorageValue(cid, moneyStorage)
    doPlayerAddMoney(cid, storedMoney)

    -- Simula a conversão de gold para dólares e centavos (100 gold = 1 dólar)
    local dollars = math.floor(storedMoney / 100)
    local cents = storedMoney % 100

    -- Função para formatar o valor de forma detalhada (milhões, mil, etc.)
    local function formatMoney(value)
        local millions = math.floor(value / 1e6)
        local thousands = math.floor((value % 1e6) / 1e3)
        local hundreds = value % 1e3

        local formatted = ""

        if millions > 0 then
            formatted = formatted .. string.format("%d milhões ", millions)
        end

        if thousands > 0 then
            formatted = formatted .. string.format("%d mil ", thousands)
        end

        if hundreds > 0 or (millions == 0 and thousands == 0) then
            formatted = formatted .. string.format("%d", hundreds)
        end

        return formatted
    end

    -- Reseta o valor do storage para 0 após uso
    setPlayerStorageValue(cid, moneyStorage, 0)

    -- Envia um efeito mágico na posição do jogador
    doSendMagicEffect(getCreaturePosition(cid), 316)

    -- Exibe a mensagem com o valor formatado (dólares formatados e centavos como valor exato)
    local formattedDollars = formatMoney(dollars)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 
        string.format("Você tem %s dólares e %d centavos.", formattedDollars, cents))
    
    return true
end
