using .MathConstants:e

  function fixedpoint(a, g, error)
    x = g(a)
    while abs(x-a) > error
      a = x
      x = g(a)
    end
    return x
  end

  function secant(a, b, f, error)
    g(a, b) = (a*f(b)-b*f(a))/(f(b)-f(a))
    x = g(a, b)
    while abs(x-b) > error
      a = b
      b = x
      x = g(a, b)
    end
    return x
  end

  function newton(a, f, f_derivado, error)
    x = a - f(a)/f_derivado(a)
    while abs(x-a) > error
      a = x
      x = a - f(a)/f_derivado(a)
    end
    return x
  end

# Exercício 3.3.1
g(x) = exp(x) - 2
error = 10^-8
r = fixedpoint(1.1, g, error)
println("Exercício 3.3.1\n",r, "\n")

# Exercício 3.4.1

g(x) = cos(x) - x^2
g_derivada(x) = -sin(x) - 2*x
error = 10^-5
s = newton(1, g, g_derivada,  error)
println("Exercício 3.4.1\n",s, "\n")

# Exercício 3.6.3

g(x) = exp(-x^2) - 2x
error = 10^-5
t = secant(0.4, 0.5, g,  error)
println("Exercício 3.6.3\n",t, "\n")

# Exercicio 3.6.4

Ir = 10^-12
T = 300
k = 1.38*10^-23
q = 1.602*10^-19
I(x) = Ir*(exp((x*q) / (k*T)) - 1)
g(x,V,R) = R*I(x) + x - V
error = 10^-5

Vt = ((1.38*10^-23)*(300))/(1.60*10^-19)

f(x) = R*(Ir*(exp(x/Vt) - 1)) + x - V
f_derivada(x) = (R*Ir*exp(x/Vt) / Vt)

#a)
R = 1000
V = 30
error = 10^-5
println("Exercicio 3.6.4\na) - Newton\n",newton(1, f, f_derivada, error))
println("a) - Secante\n",secant(0.3,0.9, f, error), "\n")

#b)
R = 1000
V = 3
println("b) - Newton\n",newton(1, f, f_derivada, error))
println("b) - Secante\n",secant(0.6,0.7, f, error), "\n")

#c)
R = 10000
V = 3
println("c) - Newton\n",newton(1, f, f_derivada, error))
println("c) - Secante\n",secant(0.5,0.6, f, error), "\n")

#d)
R = 10000
V = 0.3
println("d) - Newton\n",newton(0.4, f, f_derivada, error))
println("d) - Secante\n",secant(0.2,0.8, f, error), "\n")

#e)
R = 1000
V = -0.3
println("e) - Newton\n",newton(-0.35, f, f_derivada, error))
println("e) - Secante\n",secant(-0.2,-0.8, f, error), "\n")

#f)
R = 1000
V = -30
println("f) - Newton\n",newton(-30, f, f_derivada, error))
println("f) - Secante\n",secant(-20,-70, f, error), "\n")

#g)
R = 10000
V = -30
println("f) - Newton\n",newton(-30, f, f_derivada, error))
println("f) - Secante\n",secant(-20,-70, f, error), "\n")