using .MathConstants:e

function bisection(a,b,f,error)
  x = (a+b)/2
  while abs(f(x)) > error
    if f(a)*f(x) > 0
      a = x
    else
      b = x
    end
    x = (a+b)/2
  end
  return x
end

f(x) = sqrt(x) - cos(x)
error = 10^-4
r = bisection(0,1,f,error)
println(r)

#Exercicio 3.2.2

g(x) = 5*sin(x^2) - exp(x/10)
error = 10^-5

y = bisection(0.4,0.5,g,error)
z = round(y, digits=4)
println(z)

y = bisection(1.7,1.8,g,error)
z = round(y, digits=4)
println(z)

y = bisection(2.5,2.6,g,error)
z = round(y, digits=4)
println(z)

#Exercicio 3.2.8

Ir = 10^-12
T = 300
k = 1.38*10^-23
q = 1.602*10^-19
I(x) = Ir*(exp((x*q) / (k*T)) - 1)
g(x,V,R) = R*I(x) + x - V
error = 10^-3


#Exercicio 3.2.8
#a)
Vt = ((1.38*10^-23)*(300))/(1.60*10^-19)
println(Vt)

R = 1000
V = 30
f(x) = R*(Ir*(exp(x/Vt) - 1)) + x - V
error = 10^-5
a = 0.3
b = 0.9
println(bisection(a, b, f, error))
#b)

R = 1000
V = 3
println(bisection(a, b, f, error))

#c)

R = 10000
V = 3
println(bisection(a, b, f, error))

#d)

R = 10000
V = 0.3
a = 0.2
b = 0.8
println(bisection(a, b, f, error))

#e)
R = 1000
V = -0.3
a = -0.2
b = -0.8
println(bisection(a, b, f, error))

#f)
R = 1000
V = -30
a = -20
b = -70
println(bisection(a, b, f, error))

#g)
R = 10000
V = -30
println(bisection(a, b, f, error))