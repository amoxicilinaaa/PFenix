function onKill(cid, target, lastHit)
    -- Verifica se quem matou � um jogador e se a criatura � um monstro
    if isPlayer(cid) and isMonster(target) then
        -- Verifica se a coleta autom�tica est� ativada para o jogador
        if isCollectAll(cid) then
            -- Se a coleta autom�tica est� ativada, pega todos os itens do cad�ver
            local pos = getCreaturePosition(target)
            local corpse = getCorpseId(target)  -- Obt�m o ID do cad�ver da criatura

            -- Coleta todos os itens do corpo da criatura (sem clicar)
            local items = getItemsFromCorpse(corpse)  -- Fun��o que retorna os itens do cad�ver

            -- Percorre os itens do corpo e coleta conforme a configura��o do AutoLoot
            for _, item in ipairs(items) do
                -- Verifica se o item est� na lista de AutoLoot do jogador
                if isItemInAutoLootList(cid, item.id) then
                    -- Adiciona o item ao invent�rio do jogador
                    doPlayerAddItem(cid, item.id, item.amount)
                end
            end
            
            -- Envia uma mensagem para o jogador informando que a coleta autom�tica foi realizada
            doSendMsg(cid, "AutoLoot: Os itens selecionados da criatura foram coletados automaticamente.")
        end
    end
    return true
end
