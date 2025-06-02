OPCODE_LANGUAGE = 1

function spliting(str, pat)
   local t = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = string.find(str, fpat, 1)

   while s do
      if s ~= 1 or cap ~= "" then
        table.insert(t,cap)
      end

      last_end = e+1
      s, e, cap = string.find(str, fpat, last_end)
   end

   if last_end <= #str then
      cap = string.sub(str, last_end)
      table.insert(t, cap)
   end

   return t
end

function onExtendedOpcode(cid, opcode, buffer)
        if opcode == OPCODE_LANGUAGE then
         -- otclient language
         if buffer == 'en' or buffer == 'pt' then
                 -- example, setting player language, because otclient is multi-language...
                 --doCreatureSetStorage(cid, CREATURE_STORAGE_LANGUAGE, buffer)
         end
        elseif opcode == opcodes.OPCODE_TV_CAM then -- TVCam
          --doCreatePrivateChannel(cid)
          --doInviteToPrivateChannel(cid, playerName)
          --doRemoveIntoPrivateChannel(cid, playerName)
          if getGlobalStorageValue(globalsTV) == -1 then -- iniciar sistema
            setGlobalStorageValue(globalsTV, "")
          end
          local action = buffer:explode("/")[1]
          
          if action == "create" then
            createChannel(cid, buffer)
            
          elseif action == "close" then
            closeInClientChannmel(cid)
            
          elseif action == "watch" then
          
            local playerToWatch = getCreatureByName(buffer:explode("/")[2])
               if isCreature(playerToWatch) then
                if getPlayerStorageValue(playerToWatch, storages.playerTVPass) ~= "" and getPlayerStorageValue(playerToWatch, storages.playerTVPass) ~= "notASSenha" then
                   doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_TV_CAM, "requestPass|" .. getPlayerStorageValue(playerToWatch, storages.playerTVPass) .. "|" .. buffer:explode("/")[2]) 
                else
                 doWatch(cid, playerToWatch)
                end
              else
               doSendMsg(cid, "Este player não está mais gravando.")
               end
               
          elseif action == "watchWithPass" then
          
            local playerToWatch = getCreatureByName(buffer:explode("/")[2])
               if isCreature(playerToWatch) then
                  doWatch(cid, playerToWatch)
               else
               doSendMsg(cid, "Este player não está mais gravando.")
               end
               
          elseif action == "errou" then
                 doSendMsg(cid, "Senha do digitada incorreta.")
          end
	elseif opcode == opcodes.OPCODE_PLAYER_SHOW_AUTOLOOT then -- Autoloot
			if buffer:find("load/") then
			  local itens = getAllItensAutoLoot()	
			  doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_PLAYER_SHOW_AUTOLOOT, (isCollectAll(cid) and "yes" or "no") .. "|" .. itens .. "|" .. getAllItensInMyListToClient(cid))
			elseif buffer:find("all") then
			    doCollectAll(cid, true)
				--doSendMsg(cid, "AutoLoot: Coletar tudo foi ativado.ssss")
        doSendAnimatedText(getThingPos(cid), "AutoLoot:ON", 66)
			elseif buffer:find("no") then
			    doCollectAll(cid, false)
				--doSendMsg(cid, "AutoLoot: Coletar tudo foi desativado.")
        doSendAnimatedText(getThingPos(cid), "AutoLoot:OFF", 181)
			else
			  doSaveItems(cid, buffer)
			end
	elseif opcode == 44 then
    if string.find(buffer, "revive=") then
	  local tab = spliting(buffer, "revive=")
	  -- alguma verificaÃ§Ã£o de poke
	  -- print(tab[1])
	  doRevivePokemon(cid, tab[1])
	end
end
 return true
end