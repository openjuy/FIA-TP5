# ... (cargar y preparar los datos)

# Parámetros de la red neuronal
capa_oculta <- 10
umbral_error <- 0.01
funcion_activacion <- "logistic"
learning_rate <- 0.001
max_steps <- 1e6
num_reps <- 5

# Realizar 100 iteraciones
for (i in 1:num_iteraciones) {
  # Dividir los datos en conjuntos de entrenamiento y prueba
  indices_entrenamiento <- sample(1:nrow(datos), 0.7 * nrow(datos))
  datos_entrenamiento <- datos[indices_entrenamiento, ]
  datos_prueba <- datos[-indices_entrenamiento, ]

  # Crear el modelo de red neuronal con parámetros ajustados
  modelo_nn <- neuralnet(quality ~ ., data = datos_entrenamiento, 
                         hidden = c(capa_oculta), 
                         linear.output = FALSE, 
                         act.fct = funcion_activacion,
                         learningrate = learning_rate,
                         threshold = umbral_error,
                         algorithm = "rprop+",  # Prueba otro algoritmo
                         rep = num_reps,        # Aumenta el número de repeticiones
                         stepmax = max_steps)    # Aumenta el número máximo de pasos

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
