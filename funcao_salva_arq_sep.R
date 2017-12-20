#### FUNCAO PARA LER ARQUIVOS TXT RETIRADOS DO COCA 
#### PARA SEPARAR EM ARQUIVOS SEPARADOS

salva_txts_sep = function(texto,pasta_textos,pasta_saida) {

# funcao para transformar nome do objeto em string

# teste do argumento texto
if (!is.character(texto)) {
	stop("O nome do texto deve ser um vetor de caracteres")
}

# teste do argumento pasta_textos
if (!is.character(pasta_textos)) {
	stop("O nome do texto deve ser um vetor de caracteres")
}

# teste do argumento pasta_saida
if (!is.character(pasta_saida)) {
	stop("O nome do texto deve ser um vetor de caracteres")
}

# acerta diretorios

# geral
mainDir = getwd()

# do output
OutputDir = file.path(mainDir,pasta_saida)

# da pasta contendo os textos
TextDir = paste(mainDir,"/",pasta_textos,sep="")

# cria pasta
dir.create(OutputDir, showWarnings = FALSE)

# define diretorio
setwd(OutputDir)

# criando todos os nomes de os arquivos
filenames = paste(rep("Text_",length(texto)),1:length(texto),sep="")

# colocando extensao
filenames_ext = paste(filenames,".txt",sep="")

# loop para salvar arquivos
for (i in seq_along(1:length(filenames_ext))) {

# arquivo temporario
temp = texto[i]

# exporta em txt cada arquivo em codificacao ANSI
write.table(temp,filenames_ext[i],col.names=F,row.names=F,quote=F)

} # fim do loop

# restaura o diretorio de trabalho usual
setwd(mainDir)

}