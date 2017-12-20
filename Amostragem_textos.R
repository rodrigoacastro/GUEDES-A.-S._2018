#########################

# Preliminares

# limpa memoria
rm(list=ls())


# Arquivos para amostragem


# planilha com dados de textos e ano


ano_ntextos = read.csv2("ano_ntextos.csv")

ano_ntextos

# planilha com dados de textos e ano calculados pra amostra
numero_textos_ano = data.frame(ano=c(2008,2009,2010,2011,2012),
					no_textos=c(24,29,26,28,12)
					)
numero_textos_ano 


# nova planilha com os dados gerais
ano_ntextos_corp = ano_ntextos[ano_ntextos$ANO >= 2008 
						& ano_ntextos$ANO <= 2012,]
ano_ntextos_corp

# nova planilha com os dados de analise

ano_ntextos_corp_anal = cbind(ano_ntextos_corp,amostra=numero_textos_ano[,2])

ano_ntextos_corp_anal

write.csv2(ano_ntextos_corp_anal,"ano_ntextos_corp_anal.csv",row.names=F)

# Amostragem textos


# ANO 2008

set.seed(numero_textos_ano[1,2])
#110

amostra_2008 = sample(ano_ntextos_corp_anal[1,2],ano_ntextos_corp_anal[1,3])

amostra_2008

#exporta amostra
write.table(amostra_2008,"amostra_2008.txt", quote=F,row.names=F,col.names=F)


# ANO 2009
set.seed(numero_textos_ano[2,2])
#133

amostra_2009 = sample(ano_ntextos_corp_anal[2,2],ano_ntextos_corp_anal[2,3])

amostra_2009

#exporta amostra
write.table(amostra_2009,"amostra_2009.txt", quote=F,row.names=F,col.names=F)


# ANO 2010

set.seed(numero_textos_ano[3,2])
#124

amostra_2010 = sample(ano_ntextos_corp_anal[3,2],ano_ntextos_corp_anal[3,3])

amostra_2010

#exporta amostra
write.table(amostra_2010,"amostra_2010.txt", quote=F,row.names=F,col.names=F)

# ANO 2011

set.seed(numero_textos_ano[4,2])
#123

amostra_2011 = sample(ano_ntextos_corp_anal[4,2],ano_ntextos_corp_anal[4,3])

amostra_2011

#exporta amostra
write.table(amostra_2011,"amostra_2011.txt", quote=F,row.names=F,col.names=F)

# ANO 2012

set.seed(numero_textos_ano[5,2])
#94

amostra_2012 = sample(ano_ntextos_corp_anal[5,2],ano_ntextos_corp_anal[5,3])

amostra_2012 

#exporta amostra
write.table(amostra_2012,"amostra_2012.txt", quote=F,row.names=F,col.names=F)
