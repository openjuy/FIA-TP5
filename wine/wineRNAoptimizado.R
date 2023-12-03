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

  # Crear el modelo de red neuronal con parámetros ajustados
  modelo_nn <- neuralnet(quality ~ ., data = datos_entrenamiento, hidden = c(10, 5),
                         linear.output = FALSE, stepmax = 1e6, rep = 5)

  # Realizar predicciones en el conjunto de prueba
  predicciones <- predict(modelo_nn, newdata = datos_prueba)
  predicciones <- ifelse(predicciones > 0.5, "good", "bad")  # Convertir a categoría

  # Calcular el error de clasificación
  errores[i] <- sum(predicciones != datos_prueba$quality) / nrow(datos_prueba)
}

# Calcular el error medio de clasificación
error_medio <- mean(errores)

# Imprimir el error medio
print(paste("Error medio de clasificación (Redes Neuronales):", error_medio))
