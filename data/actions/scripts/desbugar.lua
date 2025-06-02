   local
   texto = "..."
   
   function onUse (cid)
   setPlayerStorageValue(cid, t.s, -1)
   doPlayerSendTextMessage (cid, 21, texto)
   end