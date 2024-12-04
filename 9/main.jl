using LinearAlgebra
using Plots
gr() 
v(x) = [1 x[1] ;
        1 x[2] ;
        1 x[3] ;
        1 x[4] ;
        1 x[5] ]

function a(x, y)
  V = v(x)
  Vt = transpose(V)
  a = inv(Vt*V)*(Vt*y)
  return a
end

x = [0.01 ; 1.02 ; 2.04 ; 2.95 ; 3.55]
y = [1.99 ; 4.55 ; 7.20 ; 9.51 ; 10.82]

r = a(x, y)
println(r)

#Exercício 7.1.2: Sejam dados o conjunto de pontos  {(0.23 ,-0.54), (-0.30,-0.54), (0.04 , -0.57)}. Encontre a função f(x) = a1 +a2x que melhor se ajusta no sentido de mínimos quadrados aos pontos dados. Faça, então, um gráfico com os pontos e o esboço da função ajustada.


function v(x)
    return [ones(length(x)) x] 
end

function ajustar_minimos_quadrados(x, y)
    V = v(x)
    coef = (transpose(V) * V) \ (transpose(V) * y)
    return coef
end

# Pontos dados pela questão: 
pontos = [(0.23, -0.54), (-0.30, -0.54), (0.04, -0.57)]
x = [p[1] for p in pontos] 
y = [p[2] for p in pontos] 

coef = ajustar_minimos_quadrados(x, y)
a1, a2 = coef
println("Função ajustada: f(x) = $a1 + $a2*x")

x_plot = range(minimum(x) - 0.1, maximum(x) + 0.1, length=100)  
y_plot = a1 .+ a2 .* x_plot

scatter(x, y, label="Pontos Dados", color=:red, legend=:top, xlabel="x", ylabel="y")
plot!(x_plot, y_plot, label="f(x) = $a1 + $a2*x", color=:blue, linewidth=2)

# Exercício 7.2.3: a) Encontre a função tipo f(x) = a + bsen(2πx) + ccos(2πx) que melhor aproxima os valores dados
# b) Encontre a função do tipo f(x) = a + bx + cx^2 + dx^3 que melhor aproxima os valores dados



x = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
y = [31, 35, 37, 33, 28, 20, 16, 15, 18, 23, 31]


function ajuste_minimos_quadrados(V, y)
    return (transpose(V) * V) \ (transpose(V) * y)
end

V_a = [ones(length(x)) sin.(2π .* x) cos.(2π .* x)] 
coef_seno_cos = ajuste_minimos_quadrados(V_a, y)
a_seno_cos, b_seno_cos, c_seno_cos = coef_seno_cos


V_b = [ones(length(x)) x x.^2 x.^3]  
coef_pol = ajuste_minimos_quadrados(V_b, y)
a_poly, b_poly, c_poly, d_poly = coef_pol


f_a(x) = a_seno_cos + b_seno_cos*sin(2π*x) + c_seno_cos*cos(2π*x)
f_b(x) = a_poly + b_poly*x + c_poly*x^2 + d_poly*x^3

plot(x, y, seriestype=:scatter, label="Dados Originais", legend=:topleft)
plot!(x, f_a.(x), label="f(x) = a + b*sin(2πx) + c*cos(2πx)", color=:red)
plot!(x, f_b.(x), label="f(x) = a + bx + cx^2 + dx^3", color=:blue)


println("Parte (a): f(x) = $a_seno_cos + $b_seno_cos*sin(2πx) + $c_seno_cos*cos(2πx)")
println("Parte (b): f(x) = $a_poly + $b_poly*x + $c_poly*x^2 + $d_poly*x^3")


savefig("grafico.png")
