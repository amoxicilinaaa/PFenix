local msg = [[

|---------------------------------BANK-----------------------------------|

--Atencao: O banco tem o limite de 5kk para retirada e deposito!--

!balance (Para voce ver quanto voce tem na sua conta bancaria).

!q (Para verificar quanto de dinheiro vc tem na backpack).

!deposit 999(Para voce depositar certa quantia Ex:!deposit 100).

!withdraw (Para voce Retirar certa quantia Ex:!withdraw 100).

!transfer (Para voce transferir certa quantia para outro player).

!depositall (Para voce depositar tudo o que tem na Backpack).

!transferall nome (Para voce transferir tudo o que tem para outro player).
]]
function onSay(cid, words, param)
doPlayerPopupFYI(cid, msg)
end