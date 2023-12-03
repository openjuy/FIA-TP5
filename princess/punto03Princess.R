# Cargar un archivo CSV en R
princess_dataframe <- read.csv("princess.csv")

# Mostrar las primeras filas del dataset
head(princess_dataframe)

# Obtener un resumen estadístico de las variables numéricas.
summary(princess_dataframe)

# Obtener los nombres de las columnas.
names(princess_dataframe)

# obtener una descripción estructural del data frame.
str(princess_dataframe)

# obtener los valores únicos en una columna
unique(princess_dataframe$nombre_de_columna)

# Histogramas y Gráficos
#hist(princess_dataframe$variable_numerica)
#plot(princess_dataframe$variable_x, princess_dataframe$variable_y)
