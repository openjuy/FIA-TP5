# Cargamos el conjunto de datos desde el archivo CSV
datos <- read.csv("wine.csv")

# Convertimos la variable categórica a un factor
# Convertimos la columna "quality" a factor
datos$quality <- as.factor(datos$quality)

# Preparamos los datos para obtener los mismos resultados
set.seed(123)
indices_entrenamiento <- sample(1:nrow(datos), 0.7 * nrow(datos))  # 70% para entrenamiento
datos_entrenamiento <- datos[indices_entrenamiento, ]
datos_prueba <- datos[-indices_entrenamiento, ]

library(e1071)

# Entrenamos el modelo SVM
modelo_svm <- svm(quality ~ ., data = datos_entrenamiento, kernel = "linear", cost = 1)

# Realizamos predicciones en el conjunto de prueba
predicciones <- predict(modelo_svm, newdata = datos_prueba)

# Evaluamos la precisión
precision <- sum(predicciones == datos_prueba$quality) / nrow(datos_prueba)
print(paste("Precisión del modelo SVM:", precision))

# Salida
# [1] "Precisión del modelo SVM: 0.729166666666667"
