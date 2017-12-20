### SCRIPT PRA SEPARAR ARQUIVOS DE CADA ANO

## Preliminares

rm(list=ls())

getwd()
#setwd(choose.dir())
#setwd("C:/Users/Rodrigo/Desktop/Annallena")

dir()

## Criando enderecos de diretorio

# PRINCIPAL
mainDir = getwd()
#Exemplo: mainDir <- "C:/Users/Rodrigo/Desktop/Annallena"

# DOS TEXTOS
TextDir = paste(mainDir,"/","text_academic_rpe - Copia",sep="")
# Exemplo: "C:/Users/Rodrigo/Desktop/Annallena/text_academic_rpe - Copia"

## Lendo textos

# mudando para diretorio dos textos

setwd(TextDir)

# ano 1998

Texts1998 = readLines("w_acad_1998.txt")

# elimina linha vazia inicial
Texts1998 = Texts1998[-1]

str(Texts1998)

# ano 1999

Texts1999 = readLines("w_acad_1999.txt")

# elimina linha vazia inicial
Texts1999 = Texts1999[-1]

str(Texts1999)

# ano 2000

Texts2000 = readLines("w_acad_2000.txt")

# elimina linha vazia inicial
Texts2000 = Texts2000[-1]

str(Texts2000)

# ano 2001

Texts2001 = readLines("w_acad_2001.txt")

# elimina linha vazia inicial
Texts2001 = Texts2001[-1]

str(Texts2001)

# ano 2002

Texts2002 = readLines("w_acad_2002.txt")

# elimina linha vazia inicial
Texts2002 = Texts2002[-1]

str(Texts2002)

# ano 2003

Texts2003 = readLines("w_acad_2003.txt")

# elimina linha vazia inicial
Texts2003 = Texts2003[-1]

str(Texts2003)

# ano 2004

Texts2004 = readLines("w_acad_2004.txt")

# elimina linha vazia inicial
Texts2004 = Texts2004[-1]

str(Texts2004)

# ano 2005

Texts2005 = readLines("w_acad_2005.txt")

# elimina linha vazia inicial
Texts2005 = Texts2005[-1]

str(Texts2005)

# ano 2006

Texts2006 = readLines("w_acad_2006.txt")

# elimina linha vazia inicial
Texts2006 = Texts2006[-1]

str(Texts2006)

# ano 2007

Texts2007 = readLines("w_acad_2007.txt")

# elimina linha vazia inicial
Texts2007 = Texts2007[-1]

str(Texts2007)

# ano 2008

# le textos
Texts2008 = readLines("w_acad_2008.txt")

# elimina linha vazia inicial
Texts2008 = Texts2008[-1]

str(Texts2008)

# ano 2009

# le textos
Texts2009 = readLines("w_acad_2009.txt")

str(Texts2009)

# elimina linha vazia inicial
Texts2009 = Texts2009[-1]

# ano 2010

# le textos
Texts2010 = readLines("w_acad_2010.txt")

str(Texts2010)

# elimina linha vazia inicial
Texts2010 = Texts2010[-1]

# ano 2011

# le textos
Texts2011 = readLines("w_acad_2011.txt")

str(Texts2011)

# elimina linha vazia inicial
Texts2011 = Texts2011[-1]

# ano 2012

# le textos
Texts2012 = readLines("w_acad_2012.txt")

str(Texts2012)

# elimina linha vazia inicial
Texts2012 = Texts2012[-1]

## Separando textos

#restaura diretorio original
setwd(mainDir)

# importa funcao
source("funcao_salva_arq_sep.R")

# ano 1998

# ver pasta Textos1998 no diretorio

salva_txts_sep(Texts1998,"text_academic_rpe - Copia","Textos1998")

# ano 1999

# ver pasta Textos1999 no diretorio

salva_txts_sep(Texts1999,"text_academic_rpe - Copia","Textos1999")

# ano 2000

# ver pasta Textos2000 no diretorio

salva_txts_sep(Texts2000,"text_academic_rpe - Copia","Textos2000")

# ano 2001

# ver pasta Textos2001 no diretorio

salva_txts_sep(Texts2001,"text_academic_rpe - Copia","Textos2001")

# ano 2002

# ver pasta Textos2002 no diretorio

salva_txts_sep(Texts2002,"text_academic_rpe - Copia","Textos2002")

# ano 2003

# ver pasta Textos2003 no diretorio

salva_txts_sep(Texts2003,"text_academic_rpe - Copia","Textos2003")

# ano 2004

# ver pasta Textos2004 no diretorio

salva_txts_sep(Texts2004,"text_academic_rpe - Copia","Textos2004")

# ano 2005

# ver pasta Textos2005 no diretorio

salva_txts_sep(Texts2005,"text_academic_rpe - Copia","Textos2005")

# ano 2006

# ver pasta Textos2008 no diretorio

salva_txts_sep(Texts2008,"text_academic_rpe - Copia","Textos2008")

# ano 2007

# ver pasta Textos2008 no diretorio

salva_txts_sep(Texts2008,"text_academic_rpe - Copia","Textos2008")

# ano 2008

# ver pasta Textos2008 no diretorio

salva_txts_sep(Texts2008,"text_academic_rpe - Copia","Textos2008")


# ano 2009

# ver pasta Textos2009 no diretorio

salva_txts_sep(Texts2009,"text_academic_rpe - Copia","Textos2009")

# ano 2010

# ver pasta Textos2010 no diretorio

salva_txts_sep(Texts2010,"text_academic_rpe - Copia","Textos2010")

# ano 2011

# ver pasta Textos2011 no diretorio

salva_txts_sep(Texts2011,"text_academic_rpe - Copia","Textos2011")

# ano 2012

# ver pasta Textos2012 no diretorio

salva_txts_sep(Texts2012,"text_academic_rpe - Copia","Textos2012")

###################################
