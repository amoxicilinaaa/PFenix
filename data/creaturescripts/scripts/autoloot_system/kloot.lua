function onKill(cid, target, lastHit)
    -- Verifica se quem matou é um jogador e se a criatura é um monstro
    if isPlayer(cid) and isMonster(target) then
        -- Verifica se a coleta automática está ativada para o jogador
        if isCollectAll(cid) then
            -- Se a coleta automática está ativada, pega todos os itens do cadáver
            local pos = getCreaturePosition(target)
            local corpse = getCorpseId(target)  -- Obtém o ID do cadáver da criatura

            -- Coleta todos os itens do corpo da criatura (sem clicar)
            local items = getItemsFromCorpse(corpse)  -- Função que retorna os itens do cadáver

            -- Percorre os itens do corpo e coleta conforme a configuração do AutoLoot
            for _, item in ipairs(items) do
                -- Verifica se o item está na lista de AutoLoot do jogador
                if isItemInAutoLootList(cid, item.id) then
                    -- Adiciona o item ao inventário do jogador
                    doPlayerAddItem(cid, item.id, item.amount)
                end
            end
            
            -- Envia uma mensagem para o jogador informando que a coleta automática foi realizada
            doSendMsg(cid, "AutoLoot: Os itens selecionados da criatura foram coletados automaticamente.")
        end
    end
    return true
end
