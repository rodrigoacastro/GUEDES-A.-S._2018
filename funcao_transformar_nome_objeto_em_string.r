# funcao para transformar nome do objeto em string
obj_into_string <- function(v1) {
  deparse(substitute(v1))
}

# teste

xxx = 22

obj_into_string(xxx)
#xxx