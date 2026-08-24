using GLMakie

# 1. Definir la figura y los paneles
fig = Figure(size = (1000, 600))
ax3d = Axis3(fig[1, 1], title = "Superficie 3D", xlabel = "X", ylabel = "Y", zlabel = "Z")
ax2d = Axis(fig[1, 2], title = "Curvas de Nivel (Plano XY)", xlabel = "X", ylabel = "Y")

# 2. Sliders
lsgrid = SliderGrid(
    fig[2, 1:2],
    (label = "Amplitud (A)", range = 0.1:0.1:3.0, startvalue = 1.0),
    (label = "Frecuencia (ω)", range = 0.5:0.1:4.0, startvalue = 1.5)
)

amplitud = lsgrid.sliders[1].value
frecuencia = lsgrid.sliders[2].value

# 3. Definir dominios
xs = range(-5.0, 5.0, length=100)
ys = range(-5.0, 5.0, length=100)

# 4. Matriz de datos reactiva z
z = lift(amplitud, frecuencia) do A, w
    [A * sin(w * sqrt(x^2 + y^2)) for x in xs, y in ys]
end

# 5. Dibujar los gráficos
GLMakie.surface!(ax3d, xs, ys, z, colormap = :viridis)
GLMakie.contour!(ax2d, xs, ys, z, levels = 15, colormap = :viridis, linewidth = 2)

# 6. Fijar los límites visuales
limits!(ax3d, -5, 5, -5, 5, -3, 3)
limits!(ax2d, -5, 5, -5, 5)

display(fig)