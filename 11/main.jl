
#Exercício 9.1.1: Calcule numericamente as seguintes integrais: 
#usando os métodos simples do ponto médio, Trapézio e Simpson. Calcule, também, o valor analítico destas integrais e o erro nas aproximações dadas pelas quadraturas numéricas.

f1(x) = exp(-x)
f2(x) = x^2
f3(x) = x^3
f4(x) = x * exp(-x^2)
f5(x) = 1 / (x^2 + 1)
f6(x) = x / (x^2 + 1)

# Métodos numéricos
function ponto_medio(f, a, b, n)
    h = (b - a) / n
    soma = 0.0
    for i in 0:(n-1)
        soma += f(a + (i + 0.5) * h)
    end
    return h * soma
end

function trapezio(f, a, b, n)
    h = (b - a) / n
    soma = (f(a) + f(b)) / 2
    for i in 1:(n-1)
        soma += f(a + i * h)
    end
    return h * soma
end

function simpson(f, a, b, n)
    if n % 2 != 0
        error("O número de subintervalos n deve ser par para o método de Simpson.")
    end
    h = (b - a) / n
    soma = f(a) + f(b)
    for i in 1:2:(n-1)
        soma += 4 * f(a + i * h)
    end
    for i in 2:2:(n-2)
        soma += 2 * f(a + i * h)
    end
    return h * soma / 3
end

#Exercício 9.2.3: Calcule numericamente o valor de usando os métodos compostos do ponto médio, trapézio e Simpson. Obtenha os resultados utilizando, em cada quadratura, o número de pontos indicado.

a, b = 0.0, 1.0
n = 1000 

# Cálculos para cada função
for (i, f) in enumerate([f1, f2, f3, f4, f5, f6])
    println("Integral $i:")
    pm = ponto_medio(f, a, b, n)
    tr = trapezio(f, a, b, n)
    sp = simpson(f, a, b, n)
    println("  Ponto Médio: $pm")
    println("  Trapézio: $tr")
    println("  Simpson: $sp")
    println()
end

# Função a ser integrada
f(x) = exp(4 - x^2)

# Métodos numéricos compostos
function ponto_medio_composto(f, a, b, n)
    h = (b - a) / n
    soma = 0.0
    for i in 0:(n-1)
        soma += f(a + (i + 0.5) * h)
    end
    return h * soma
end

function trapezio_composto(f, a, b, n)
    h = (b - a) / n
    soma = (f(a) + f(b)) / 2
    for i in 1:(n-1)
        soma += f(a + i * h)
    end
    return h * soma
end

function simpson_composto(f, a, b, n)
    if n % 2 != 0
        error("O número de subintervalos n deve ser par para o método de Simpson.")
    end
    h = (b - a) / n
    soma = f(a) + f(b)
    for i in 1:2:(n-1)
        soma += 4 * f(a + i * h)
    end
    for i in 2:2:(n-2)
        soma += 2 * f(a + i * h)
    end
    return h * soma / 3
end

# Intervalo de integração
a, b = 2.0, 5.0
ns = [3, 5, 7, 9]  # Valores de n (subintervalos)

# Cálculos
for n in ns
    println("n = $n")
    pm = ponto_medio_composto(f, a, b, n)
    tr = trapezio_composto(f, a, b, n)
    if n % 2 == 0
        sp = simpson_composto(f, a, b, n)
    else
        sp = "Não aplicável (n ímpar)"
    end
    println("  Ponto Médio: $pm")
    println("  Trapézio: $tr")
    println("  Simpson: $sp")
    println()
end
