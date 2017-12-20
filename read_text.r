read_txt = function(pasta)
{

#testa argumento
if(!is.character(pasta)) 
{
	stop("o nome da pasta deve ser um vetor de caracteres")
}

#importa e/ou ativa pacote "readr"
if (!require(readr)) {install.packages("readr");require(readr)} else {require(readr)}

#copia diretorio atual e cria um novo indicando a pasta de textos
dir = getwd()
new_dir = paste(dir,"/",pasta,sep="")

#ativa o novo diretorio
setwd(new_dir)

#lista arquivos da pasta
files_list = dir()

##faz a leitura dos arquivos e salva eles
#text_path = paste(new_dir,"/",list_files[1],sep="")
#mystring <- read_file(text_path)


texts_list = lapply(files_list,read_file)
#mystring <- read_file(text_path)


#Funciona
#paste(scan(list_files[1], what="character", sep=" "),collapse=" ")

#restaura diretorio
setwd(dir)

return(texts_list)
}
