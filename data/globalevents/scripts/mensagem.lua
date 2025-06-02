function onThink(interval, lastExecution)
MENSAGEM = {
"{[PokeFênix]\nNão deixe de ficar por dentro das atualizações e noticias do servidor, acesse nosso discord: dicord.gg/pokefenix}",
"[PokeFênix]\nLembre-se jogadores premium tem vantagem em: Exp/Catch/dropes.",
"[PokeFênix]\nGaranta já sua premium, ganhe benefícios acesse já nossa loja.",
"[Sistema-PokeFênix]\nUse !comandos para ver alguns comandos disponíveis no servidor.",
"[Sistema-PokeFênix]\nNão deixe de atualizar nosso client para evitar erros e percas.",
"[Dica-PokeFênix]\nVocê pode usar o atalho CTRL+Z para usar a vara de pesca.",
"[Dica-PokeFênix]\nDúvidas? tire elas no Canal Help!",
"[Sistema-PokeFênix]\nPara saber mais dos benefícios premium acesso nossa loja.",
"[Dica-PokeFênix]\nUse !comandos para ver alguns comandos disponíveis.",
"[Sistema-PokeFênix]\nNosso site: ********",
"[Sistema-PokeFênix]\nFaça uma doação e ajude o servidor florecer.",
"[Dica-PokeFênix]\nPara fazer a Mega Box Quest você precisa juntar 100 fire piece, 100 water piece e 100 leaf piece para poder entrar. São Dropados na outland e em alguns outros pokemons.",
"[Dica-PokeFênix]\nPara saber quantos Online Points você possui, digite: !opshop.",
"[Sistema-PokeFênix]\nPara saber as vantagens de ser Premium account, acesse nossa loja agora mesmo."
}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],22)
return TRUE
end