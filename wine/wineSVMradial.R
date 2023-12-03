library(e1071)

# Cargar el conjunto de datos desde el archivo CSV
datos <- read.csv("wine.csv")

# Convertir la columna "quality" a factor
datos$quality <- as.factor(datos$quality)

# Establecer la semilla aleatoria para reproducibilidad
set.seed(123)

# Número de iteraciones
num_iteraciones <- 100

# Inicializar vector para almacenar errores
errores <- numeric(num_iteraciones)

# Realizar 100 iteraciones
for (i in 1:num_iteraciones) {
  # Dividir los datos en conjuntos de entrenamiento y prueba
  indices_entrenamiento <- sample(1:nrow(datos), 0.7 * nrow(datos))
  datos_entrenamiento <- datos[indices_entrenamiento, ]
  datos_prueba <- datos[-indices_entrenamiento, ]

  # Entrenar el modelo SVM
  modelo_svm <- svm(quality ~ ., data = datos_entrenamiento, kernel = "radial", cost = 1)

  # Realizar predicciones en el conjunto de prueba
  predicciones <- predict(modelo_svm, newdata = datos_prueba)

  # Calcular el error de clasificación
  errores[i] <- sum(predicciones != datos_prueba$quality) / nrow(datos_prueba)
}

# Calcular el error medio de clasificación
error_medio <- mean(errores)

# Imprimir el error medio
print(paste("Error medio de clasificación:", error_medio))

# Resultados
# Con kernel Lineal el error medio de clasificación fue 0.2606875
# Con kernel Radial el error medio de clasificación fue 0.2375625
