function onTimer(cid, interval, lastExecution) 

doBroadcastMessage("Golden Arena começará daqui a 10 minutos!")
addEvent(doBroadcastMessage, 30000, "Golden Arena começará em 5 minutos!") --300000
addEvent(puxaParticipantes, 50000)  	--480000
addEvent(doWave, 60000, true) --alterado v1.8       --480000 / 600000

return true
end



