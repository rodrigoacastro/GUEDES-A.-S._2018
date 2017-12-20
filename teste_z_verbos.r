# TESTE Z para frequencia dos verbos

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

# CorIFA

dados_corifa = read.xlsx("Tabelas_freq_verbos_CorIFA_BAWE.xls",sheetName="dados_CorIFA")

dados_corifa

# BAWE

dados_bawe = read.xlsx("Tabelas_freq_verbos_CorIFA_BAWE.xls",sheetName="dados_BAWE")

dados_bawe

# organizando dados

#arrange(dados_corifa,VIAE)
#arrange(dados_bawe,VIAE)


tabela_corifa_bawe = data.frame(arrange(dados_corifa,VIAE)[,2],
					arrange(dados_bawe,VIAE)[,2])

colnames(tabela_corifa_bawe) = c("Freq_normal_corifa","Freq_normal_bawe")
row.names(tabela_corifa_bawe) = dados_corifa[,1]

tabela_corifa_bawe$total = tabela_corifa_bawe[,1] + tabela_corifa_bawe[,2]

tabela_corifa_bawe


# tabela de proporcoes CorIFA-BAWE

for (linhas in 1:nrow(tabela_corifa_bawe)) {
	tabela_corifa_bawe_prop[linhas,] = 
		tabela_corifa_bawe[linhas,1:2]/sum(tabela_corifa_bawe[linhas,1:2])

}

tabela_corifa_bawe_prop$total =  1

tabela_corifa_bawe_prop


# loop para fazer teste Z e acrescentar resultado (p-valor) na tabela

tabela_corifa_bawe$p_value = 0

for (linhas in 1:nrow(tabela_corifa_bawe)) {
	tabela_corifa_bawe$p_value[linhas] = 
		prop.test(unlist(tabela_corifa_bawe[linhas,1:2]),
			rep(tabela_corifa_bawe[linhas,3],2))$p.value
}

prop.test(x = unlist(tabela_corifa_bawe[1,1:2]),rep(tabela_corifa_bawe[1,3],2))

tabela_corifa_bawe$SIGNIFICANCE = tabela_corifa_bawe$p_value < 0.05
tabela_corifa_bawe$SIGNIFICANCE = gsub("TRUE","SIM",tabela_corifa_bawe$SIGNIFICANCE)
tabela_corifa_bawe$SIGNIFICANCE = gsub("FALSE","NAO",tabela_corifa_bawe$SIGNIFICANCE)

tabela_corifa_bawe


# exportando tabela 
#write.xlsx(tabela_corifa_bawe,"tabela_corifa_bawe_teste_z.xlsx")


# top 5 verbos selecionados

regex_words = "improve|provide|develop|increase|adopt"

top5verbs = grep(regex_words,row.names(tabela_corifa_bawe),value=T)

tabela_top5_verbs = tabela_corifa_bawe[row.names(tabela_corifa_bawe) %in% top5verbs,]

# exportando tabela final
#write.xlsx(tabela_top5_verbs,"tabela_top5_verbs_teste_z.xlsx")




