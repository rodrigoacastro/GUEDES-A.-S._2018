# TESTE Z para frequencia dos adverbios

# Preliminares

rm(list=ls())

# definindo diretorio
getwd()
# setwd(choose.dir())
# setwd("C:/Users/Rodrigo.Castro/Dropbox/Rodrigo/UFMG 2017 2_Doutorado/Doutorado_Annallena/Analysis part 2/Mutual Information")

dir()

# importando pacotes

require(xlsx)

require(dplyr)

# lendo arquivos


# Tabela Adverbios
tabela_advs = read.xlsx("Tabela_freq_Viaes_adv.xls",sheetIndex=1)
tabela_advs = tabela_advs[,-5]

tabela_advs = tabela_advs[-29,]

row.names(tabela_advs) = tabela_advs[,1]

tabela_advs = tabela_advs[,-1]


tabela_advs


# tabela de proporcoes

tabela_advs_prop = tabela_advs

for (linhas in 1:nrow(tabela_advs)) {
	tabela_advs_prop[linhas,] = 
		tabela_advs[linhas,1:2]/sum(tabela_advs[linhas,1:2])

}

tabela_advs_prop

# exportando tabela 
#write.xlsx(tabela_advs_prop,"tabela_advs_prop.xlsx")


# teste de proporcoes z



# loop para fazer teste Z e acrescentar resultado (p-valor) na tabela

tabela_advs$p_value = 0

for (linhas in 1:nrow(tabela_advs)) {
	tabela_advs$p_value[linhas] = 
		prop.test(tabela_advs[linhas,1],
			tabela_advs[linhas,3],p=0.5)$p.value
}

for (linhas in 1:nrow(tabela_advs)) {
	tabela_advs$p_value[linhas] = 
		prop.test(unlist(tabela_advs[linhas,1:2]),
			rep(tabela_advs[linhas,3],2))$p.value
}


tabela_advs


tabela_advs$SIGNIFICANCE = tabela_advs$p_value < 0.05
tabela_advs$SIGNIFICANCE = gsub("TRUE","SIM",tabela_advs$SIGNIFICANCE)
tabela_advs$SIGNIFICANCE = gsub("FALSE","NAO",tabela_advs$SIGNIFICANCE)

tabela_advs

# exportando tabela
#write.xlsx(tabela_advs,"tabela_advs2_teste_z.xlsx")

# top 5 verbos selecionados

regex_words = "improve|provide|develop|increase|adopt"

top5verbs = grep(regex_words,row.names(tabela_advs),value=T)

tabela_top5_advs = tabela_advs[row.names(tabela_advs) %in% top5verbs,]

# exportando tabela final
#write.xlsx(tabela_top5_advs,"tabela_top5_advs_teste_z.xlsx")

####################################################################