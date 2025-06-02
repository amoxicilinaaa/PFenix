local tasksss = {
   [1] = {name = "Elder Conkeldurr",  sto = 10227, count = 300, time_sto = 5476, time = 1*24*60*60, sto_count = 14144, money = 1, rewardid = 11446, rewardcount = 3, rewardexp = 2000000,  text = "Parabens, voce terminou a task do Brave Rhyperior, e dentro de 24 horas podera fazer denovo."},
   [2] = {name = "Elder Spiritomb",  sto = 10228, count = 300, time_sto = 5477, time = 1*24*60*60, sto_count = 14145, money = 1, rewardid = 11450, rewardcount = 3, rewardexp = 2000000,  text = "Parabens, voce terminou a task do Brave Abomasnow, e dentro de 24 horas podera fazer denovo."},
   [3] = {name = "Exonered Typhlosion",  sto = 10229, count = 300, time_sto = 5478, time = 1*24*60*60, sto_count = 14146, money = 1, rewardid = 11447, rewardcount = 3, rewardexp = 2000000,  text = "Parabens, voce terminou a task do Elder Tangela, e dentro de 24 horas podera fazer denovo."},
   }


function onKill(cid, target)
        for _, t in ipairs(tasksss) do
            local total_count = t.count
            local m_sto = t.sto
            local count_sto = t.sto_count
            if getPlayerStorageValue(cid, m_sto) ~= -1 then
                if getCreatureName(target) == t.name then
                	if (total_count - getPlayerStorageValue(cid, count_sto)) == 1 then
                		setPlayerStorageValue(cid, count_sto, getPlayerStorageValue(cid, count_sto) + 1)
                    	doPlayerSendTextMessage(cid, 20, "You are killed ".. getPlayerStorageValue(cid, count_sto) .." " .. t.name .. " and finished the task!")
                    	return true
                    elseif (total_count - getPlayerStorageValue(cid, count_sto)) >= 1 then
                        setPlayerStorageValue(cid, count_sto, getPlayerStorageValue(cid, count_sto) + 1)
                        doPlayerSendTextMessage(cid, 20, "You are killed ".. getPlayerStorageValue(cid, count_sto) .." of ".. total_count .." " .. t.name .. " kills to finish the task.")
                        return true
                    end
                end
            end
        end
    return true
end