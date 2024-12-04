dp(f,x,h) = (f(x+h)-f(x))/h
dr(f,x,h) = (f(x)-f(x-h))/h
dc(f,x,h) = (f(x+h)-f(x-h))/(2*h)

f(x) = sin(x) - (x^2)
r = dp(f, 2, 0.1)
println(r)

r = dp(f, 2, 0.01)
println(r)



#Exercício 8.1.1: Use os esquemas numéricos de diferença finita regressiva de ordem 1, diferença finita progressiva de ordem 1 e diferença finita central de ordem 2 para aproximar as seguintes derivadas:
#f'(x) onde f(x) = sen(x) e x = 2
#f'(x) onde f(x) = e^-x e x = 1

f1(x) = sin(x)
f2(x) = exp(-x)

# Derivadas exatas
df1_exact(x) = cos(x)
df2_exact(x) = -exp(-x)

# Esquemas de diferenças finitas
function derivada_progressiva(f, x, h)
    return (f(x + h) - f(x)) / h
end

function derivada_regressiva(f, x, h)
    return (f(x) - f(x - h)) / h
end

function derivada_central(f, x, h)
    return (f(x + h) - f(x - h)) / (2h)
end

# Valores fornecidos
h_values = [1e-2, 1e-3]
x1, x2 = 2.0, 1.0  # Pontos de avaliação

# Cálculos
for h in h_values
    println("h = $h")

    # Para f1(x) = sin(x)
    dp1 = derivada_progressiva(f1, x1, h)
    dr1 = derivada_regressiva(f1, x1, h)
    dc1 = derivada_central(f1, x1, h)
    exact1 = df1_exact(x1)

    println("f'(x) para f(x) = sin(x) e x = $x1")
    println("  Progressiva: $dp1, Erro: $(abs(dp1 - exact1))")
    println("  Regressiva: $dr1, Erro: $(abs(dr1 - exact1))")
    println("  Central: $dc1, Erro: $(abs(dc1 - exact1))")

    # Para f2(x) = exp(-x)
    dp2 = derivada_progressiva(f2, x2, h)
    dr2 = derivada_regressiva(f2, x2, h)
    dc2 = derivada_central(f2, x2, h)
    exact2 = df2_exact(x2)

    println("f'(x) para f(x) = exp(-x) e x = $x2")
    println("  Progressiva: $dp2, Erro: $(abs(dp2 - exact2))")
    println("  Regressiva: $dr2, Erro: $(abs(dr2 - exact2))")
    println("  Central: $dc2, Erro: $(abs(dc2 - exact2))")
    println()
end

#Exercício 8.1.4:

# Dados fornecidos
vi = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
vo = [0.0, 1.05, 1.83, 2.69, 3.83, 4.56, 5.49, 6.56, 6.11, 7.06, 8.29]

# Funções para diferenças finitas
function derivada_progressiva(x, y, i)
    return (y[i + 1] - y[i]) / (x[i + 1] - x[i])
end

function derivada_regressiva(x, y, i)
    return (y[i] - y[i - 1]) / (x[i] - x[i - 1])
end

function derivada_central(x, y, i)
    return (y[i + 1] - y[i - 1]) / (x[i + 1] - x[i - 1])
end

# Índices dos pontos de interesse
idx_1 = findfirst(==(1.0), vi)  # Índice para vi = 1.0
idx_45 = findfirst(==(4.5), vi) # Índice para vi = 4.5

# Cálculos para vi = 1.0
println("Derivadas para vi = 1.0:")
dp1 = derivada_progressiva(vi, vo, idx_1)
dr1 = derivada_regressiva(vi, vo, idx_1)
dc1 = derivada_central(vi, vo, idx_1)
println("  Progressiva: $dp1")
println("  Regressiva: $dr1")
println("  Central: $dc1")

# Cálculos para vi = 4.5
println("\nDerivadas para vi = 4.5:")
dp45 = derivada_progressiva(vi, vo, idx_45)
dr45 = derivada_regressiva(vi, vo, idx_45)
dc45 = derivada_central(vi, vo, idx_45)
println("  Progressiva: $dp45")
println("  Regressiva: $dr45")
println("  Central: $dc45")
