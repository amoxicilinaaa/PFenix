function onTimer(cid, interval, lastExecution) 

doBroadcastMessage("As inscrições para o torneio abriu e fechará daqui 5minutos! fale com o NPC torneio para entrar no torneio!")
addEvent(doBroadcastMessage, 300000, "As inscrições para o torneio fechou!") 
addEvent(puxaParticipantes, 480000)  	
addEvent(doWave, 600000, true)            --alterado v1.8       

return true
end