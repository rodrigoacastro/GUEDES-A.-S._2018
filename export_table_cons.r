write.table(data.frame(ID_text=1:200,names_texts=names_texts[sorted_samp]),"texts_sorted.txt",quote=F,row.names=F)

#textos selecionados
write.table(data.frame(ID_text=1:200,text_number=sorted_samp,names_texts=names_texts[sorted_samp]),"texts_sorted.txt",quote=F,row.names=F)

#textos extras
write.table(data.frame(ID_text=1:60,text_number=sorted_samp2,names_texts=names_texts[sorted_samp2]),"texts_sorted_extras.txt",quote=F,row.names=F)


teste = strsplit(as.character(texts_sorted_clean[1]),split=" ")
length(teste[[1]])