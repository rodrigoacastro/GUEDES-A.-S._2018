## comandos preliminares

# verifica e limpa memoria
ls()
rm(list=ls())

#importa pacotes necessarios
#importa e/ou ativa pacote "stringi"
if (!require(stringi)) {install.packages("stringi");require(readr)} else {require(stringi)}

###
#define nome da pasta com os textos
PASTA_TEXTOS = "CORPUS_TXT"
###

#confere e define diretorio
getwd()
#setwd(dir=choose.dir())

# confere arquivos no diretorio
dir()

## Importa textos

#importa funcao de ler txts de um arquivo
source("read_text.r")

texts_list = read_txt("CORPUS_TXT")
texts_list = read_txt(PASTA_TEXTOS)


length(texts_list)

## Faz sorteio dos textos


set.seed(2)

ids_texts_list = seq_along(1:length(texts_list))

samp = sample(ids_texts_list),200)
sort(samp)

#ordena indices sorteados
sorted_samp = sort(samp)

#separa textos sorteados

texts_sorted = texts_list[sorted_samp]
texts_sorted

#define nomes dos textos sorteados
names_texts = dir(paste(getwd(),"/",PASTA_TEXTOS,sep=""))
names_texts_sorted = names_texts[sorted_samp]

#verifica textos sorteados
sorted_samp

###################################################
##sorteando tokens extras para completar 5000 tokens
#x[-unique(x[x%in%b])]

x = ids_texts_list
b = sorted_samp

#remove numeros sorteados do conjunto universo
unsorted_ids = x[-unique(x[x%in%b])]

#remove vars
rm(x,b)

unsorted_ids

length(unsorted_ids)
#2561

# sorteia mais textos

set.seed(2)

samp2 = sample(unsorted_ids,60)

#ordena indices sorteados
sorted_samp2 = sort(samp2)

#separa textos extras sorteados
texts_sorted2 = texts_list[sorted_samp2]
texts_sorted2

#define nomes dos textos sorteados
#names_texts = dir(paste(getwd(),"/",PASTA_TEXTOS,sep=""))
names_texts_sorted2 = names_texts[sorted_samp2]

###################################################

#limpa tags dos textos sorteados

#elimina tags entre <>
#gsub("</?[a-z]+>",texts_sorted)

texts_sorted_clean = lapply(texts_sorted,function(x) gsub("</?[a-z]+?>"," ",x))
#retira espacos extras
texts_sorted_clean = lapply(texts_sorted_clean,function(x) gsub(" +"," ",x))
#retira espacos extras iniciais
texts_sorted_clean = lapply(texts_sorted_clean,function(x) gsub("^ "," ",x))
#retira espacos extras finais
texts_sorted_clean = lapply(texts_sorted_clean,function(x) gsub(" $"," ",x))

texts_sorted_clean

##################

#limpa tags dos textos extras sorteados

#elimina tags entre <>
#gsub("</?[a-z]+>",texts_sorted2)

texts_sorted_clean2 = lapply(texts_sorted2,function(x) gsub("</?[a-z]+?/?>"," ",x))
#retira espacos extras
texts_sorted_clean2 = lapply(texts_sorted_clean2,function(x) gsub(" +"," ",x))
#retira espacos extras iniciais
texts_sorted_clean2 = lapply(texts_sorted_clean2,function(x) gsub("^ "," ",x))
#retira espacos extras finais
texts_sorted_clean2 = lapply(texts_sorted_clean2,function(x) gsub(" $"," ",x))
texts_sorted_clean2 = lapply(texts_sorted_clean2,function(x) gsub("^\\"," ",x))

texts_sorted_clean2

###################################################
#CONFERIR
#try (lapply(texts_sorted,gsub,"<(.*?)>",""))
###################################################

## Exporta textos selecionados

#Cria diretorio para exportar

#backup do diretorio atual
dir = getwd()

#novo diretorio

#usado por base codigo em:
#http://stackoverflow.com/questions/4216753/check-existence-of-directory-and-create-if-doesnt-exist

if (file.exists("Textos_sorteados")){
	stop("diretorio ja existente, favor criar outro")
} else {
	dir_new = file.path(getwd(),"Textos_sorteados")
	dir.create(dir_new)
}

#define novo diretorio
setwd(dir_new)

#exporta textos

for (textos in seq_along(texts_sorted_clean))
{
	write_lines(texts_sorted_clean[textos],names_texts_sorted[textos])
}

#restaura diretorio
setwd(dir)

###################################

## Exporta textos extra selecionados

#Cria diretorio para exportar

#backup do diretorio atual
dir = getwd()
	
#novo diretorio

#usado por base codigo em:
#http://stackoverflow.com/questions/4216753/check-existence-of-directory-and-create-if-doesnt-exist

if (file.exists("Textos_sorteados_extras")){
	stop("diretorio ja existente, favor criar outro")
} else {
	dir_new = file.path(getwd(),"Textos_sorteados_extras")
	dir.create(dir_new)
}

#define novo diretorio
setwd(dir_new)

#exporta textos

for (textos in seq_along(texts_sorted_clean2))
{
	write_lines(texts_sorted_clean2[textos],names_texts_sorted2[textos])
}

#restaura diretorio
setwd(dir)

#############################################################################