# princess_dataframe <- read.csv("princess.csv")
# Cargar el dataset desde el archivo "Diagonal.Rdata" si aún no lo has hecho
# load("Diagonal.Rdata")

# Establecer la semilla aleatoria para reproducibilidad
# set.seed(123)

# Calcular el número de filas en el dataset
n_filas <- nrow(princess_dataframe)

# Definir el tamaño del conjunto de prueba (50%)
tamano_prueba <- round(0.5 * n_filas)

# Crear un conjunto de índices aleatorios para seleccionar las filas de prueba
indices_prueba <- sample(1:n_filas, size = tamano_prueba)

# Crear el conjunto de entrenamiento y el conjunto de prueba
conjunto_entrenamiento <- princess_dataframe[-indices_prueba, ]
conjunto_prueba <- princess_dataframe[indices_prueba, ]

# Ver las dimensiones de los conjuntos resultantes
cat("Dimensiones del conjunto de entrenamiento:", dim(conjunto_entrenamiento), "\n")
cat("Dimensiones del conjunto de prueba:", dim(conjunto_prueba), "\n")

# Guardar los índices de entrenamiento en un archivo "Indices_train.Rdata"
save(indices_prueba, file = "Indices_train.Rdata")

# Crear un conjunto de índices para el conjunto de entrenamiento (complemento de los índices de prueba)
indices_entrenamiento <- setdiff(1:n_filas, indices_prueba)

# Guardar los índices de prueba en un archivo "Indices_test.Rdata"
save(indices_entrenamiento, file = "Indices_test.Rdata")

