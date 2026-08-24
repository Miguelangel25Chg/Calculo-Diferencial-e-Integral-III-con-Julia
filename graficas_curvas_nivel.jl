# Paragraficar 
using Plots
gr() # Backend rápido por defecto; usa plotlyjs() si quieres rotar con el mouse

f(x, y) = x^2 - y^2 # Paraboloide hiperbólico (silla de montar)

x = -2:0.1:2
y = -2:0.1:2

surface(x, y, f, 
        title="Superficie: z = x² - y²", 
        xlabel="X", ylabel="Y", zlabel="Z",
        color=:viridis)

# Curvas de nivel
# Mapa de contornos 2D con etiquetas de nivel
contour(x, y, f, 
        fill=true,            # Rellena los intervalos con color
        levels=15,            # Número de curvas de nivel
        clabels=true,         # Muestra el valor de z sobre la curva
        title="Curvas de Nivel (Mapa 2D)",
        color=:plasma)
# Para ambos
# 1. Graficamos la superficie 3D
surface(x, y, f, alpha=0.8, color=:cividis, legend=false)

# 2. Proyectamos las curvas de nivel en la base de la gráfica
contour!(x, y, f, levels=12, color=:black)
#Mas dinámico 
using Plots
plotlyjs() # Permite rotar e interactuar con la gráfica 3D

# Definir la función z = f(x,y)
f(x, y) = sin(sqrt(x^2 + y^2))

x = -5:0.2:5
y = -5:0.2:5

surface(x, y, f, title="Superficie 3D", xlabel="x", ylabel="y", zlabel="z")