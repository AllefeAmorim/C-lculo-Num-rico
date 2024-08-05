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

#Exercicio 3.22

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