library(randomForest)

# ... (cargar y preparar los datos)

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

  # Entrenar el modelo Random Forest con parámetros ajustados
  modelo_rf <- randomForest(quality ~ ., data = datos_entrenamiento,
                            ntree = 1000, mtry = sqrt(ncol(datos) - 1),
                            maxdepth = 10, nodesize = 5)

  # Realizar predicciones en el conjunto de prueba
  predicciones <- predict(modelo_rf, newdata = datos_prueba)

  # Calcular el error de clasificación
  errores[i] <- sum(predicciones != datos_prueba$quality) / nrow(datos_prueba)
}

# Calcular el error medio de clasificación
error_medio <- mean(errores)

# Imprimir el error medio
print(paste("Error medio de clasificación (Random Forest):", error_medio))
# El error medio de clasificacion me dio 0.192645833333
