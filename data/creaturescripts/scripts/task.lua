local tasksss = {
   [1] = {name = "Blastoise",  sto = 10201, count = 40, time_sto = 5451, time = 1*20*60*60, sto_count = 14141, money = 1, rewardid = 11442, rewardcount = 3, rewardexp = 100000,  text = "Parabens, voce terminou a task do Blastoise, e dentro de 20 horas podera fazer denovo."},
   [2] = {name = "Charizard",  sto = 10202, count = 40, time_sto = 5452, time = 1*20*60*60, sto_count = 14142, money = 1, rewardid = 11447, rewardcount = 3, rewardexp = 100000,  text = "Parabens, voce terminou a task do Blastoise, e dentro de 20 horas podera fazer denovo."},
   [3] = {name = "Venusaur",  sto = 10203, count = 40, time_sto = 5453, time = 1*20*60*60, sto_count = 14143, money = 1, rewardid = 11441, rewardcount = 3, rewardexp = 100000,  text = "Parabens, voce terminou a task do Blastoise, e dentro de 20 horas podera fazer denovo."},

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