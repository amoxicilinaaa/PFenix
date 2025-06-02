local msg = [[
Server Info
|---Comandos de House---|
!comprarcasa ou !buyhouse para comprar
!convidar ou aleta sio para convidar outro jogador
!morador para nomear um sub-dono 
!abandonar ou !leavehouse para abandonar 
!vender "name" ou !sellhouse "name" para vender
]]
function onSay(cid, words, param)
doPlayerPopupFYI(cid, msg)
end