using Plots
gr() # Backend estable y directo para exportar imágenes

# --------------------------------------------------
# 1. Superficie 3D (Silla de montar)
# --------------------------------------------------
f1(x, y) = x^2 - y^2
x1 = -2:0.1:2
y1 = -2:0.1:2

p1 = surface(x1, y1, f1, 
             title="Superficie: z = x² - y²", 
             xlabel="X", ylabel="Y", zlabel="Z",
             color=:viridis)

savefig(p1, "superficie_silla.png")


# --------------------------------------------------
# 2. Curvas de Nivel (Mapa 2D)
# --------------------------------------------------
p2 = contour(x1, y1, f1, 
             fill=true, 
             levels=15, 
             clabels=true, 
             title="Curvas de Nivel (Mapa 2D)",
             color=:plasma)

savefig(p2, "curvas_nivel_2d.png")


# --------------------------------------------------
# 3. Superficie con Curvas de Nivel Proyectadas
# --------------------------------------------------
p3 = surface(x1, y1, f1, alpha=0.8, color=:cividis, legend=false)
contour!(p3, x1, y1, f1, levels=12, color=:black)

savefig(p3, "superficie_con_contornos.png")


# --------------------------------------------------
# 4. Superficie 3D Ondulada
# --------------------------------------------------
f2(x, y) = sin(sqrt(x^2 + y^2))
x2 = -5:0.2:5
y2 = -5:0.2:5

p4 = surface(x2, y2, f2, 
             title="Superficie 3D Ondulada", 
             xlabel="x", ylabel="y", zlabel="z",
             color=:viridis)

# Muestra la gráfica en pantalla y guarda la imagen
display(p4)
savefig(p4, "superficie.png")
