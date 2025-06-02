local configs = {
        rephours = 24 -- qntas em qntas horas pode dar rep, 24 para 1 dia.
}

function getTime(s)
        local n = math.floor(s / 60)
        s = s - (60 * n)
        return n, s
end

function onSay(cid, words, param)

        local cd = math.ceil(configs.rephours/2)
        local storage = 6002
        if words == "!rep" then

                if os.time()-getPlayerStorageValue(cid, storage) <= cd then
            minutes,seconds = getTime(cd-(os.time()-getPlayerStorageValue(cid, storage)))
            return doPlayerSendTextMessage(cid, 27, "Wait " .. configs.rephours .. " fours for the next rep.")
                end
                if getPlayerByName(param) then
                        local p = getPlayerByName(param)
                        if getPlayerIp(cid) == getPlayerIp(p) or getPlayerAccount(cid) == getPlayerAccount(p) then
                                return doPlayerSendTextMessage(cid, 27, "IP ACCOUNT PROTECT.")
                        end
                        setPlayerStorageValue(p, 6001, getPlayerStorageValue(p, 6001) + 1)
                        doPlayerSendTextMessage(cid, 27, "You gave reputation + 1 for " .. getCreatureName(p) .. ".")
                        doPlayerSendTextMessage(p, 21, "You received reputation + 1 of ".. getCreatureName(cid) ..".")
                        setPlayerStorageValue(cid, storage, os.time()+3600*cd)
                else
                        doPlayerSendTextMessage(cid, 27, "Player Not Found.")
                end
        elseif words == "!myrep" then
                return doPlayerSendTextMessage(cid, 27, "My Reputation : " .. getPlayerStorageValue(cid, 6001))
        elseif words == "!rankrep" then
                local e = getPlayersOnline()
                local text = ""
                for _, pid in ipairs(e) do
                        text = text .. "[" .. getCreatureName(pid) .. "] Reputation: " .. getPlayerStorageValue(pid, 6001) .. "\n\n"
                end
                text = "[RANK REPUTATION ONLINES]\n\n" .. text
                doShowTextDialog(cid, 12945, text)
        end

return TRUE
end