local tasksss = {
   [1] = {name = "Brave Gyarados",  sto = 10230, count = 250, time_sto = 5473, time = 1*24*60*60, sto_count = 14147, money = 1, rewardid = 11442, rewardcount = 3, rewardexp = 2000000,  text = "Parabens, voce terminou a task do Brave Rhyperior, e dentro de 24 horas podera fazer denovo."},
   [2] = {name = "Brave Electivire",  sto = 10231, count = 300, time_sto = 5480, time = 1*24*60*60, sto_count = 14148, money = 1, rewardid = 11444, rewardcount = 3, rewardexp = 2000000,  text = "Parabens, voce terminou a task do Brave Abomasnow, e dentro de 24 horas podera fazer denovo."},
   [3] = {name = "Furious Scyther",  sto = 10232, count = 300, time_sto = 5475, time = 1*24*60*60, sto_count = 14149, money = 1, rewardid = 11448, rewardcount = 3, rewardexp = 2000000,  text = "Parabens, voce terminou a task do Elder Tangela, e dentro de 24 horas podera fazer denovo."},
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