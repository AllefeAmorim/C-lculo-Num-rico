using .MathConstants:e

function fixedpoint(a, g, error)
  x = g(a)
  while abs(x-a) > error
    a = x
    x = g(a)
  end
  return x
end

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

#Questão 1 - 
# Para economizar energia elétrica, um agricultor implantou um sistema de painel solar na fazenda para alimentar uma bomba d'água, que faz a irrigação das plantações. A placa negra utilizada fica exposta ao sol e ao vento. Dessa forma, para gerar eletricidade, a irradiação solar E (em Wm-2) sobre a placa tem que ser maior que a perda de calor por radiação e por condução, dado a temperatura atmosférica K (em Kelvin). Sabendo que para determinar a temperatura da placa para alcançar esse desequilíbrio é dado pela equação: E = 5,67.10-8 T4 + 0,4(T - K)

f(x) = 5.67*10^-8 * x^4 + 0.4*(x - K) - E

E=500.125
K=272.975
a = 273
b = 400
error = 10^-4
r = bisection(a,b,f,error)
println(r)

#Questão 2 -
#Calcule o comprimento do cabo (C) entre duas torres de transmissão (cabo catenária). A distância entre as torres é de d = 500m. A flecha máxima permitida é fmax = 50m. Flecha é a distância vertical entre uma reta que liga os dois pontos de fixação. A flecha (f) depende do comprimento do vão (d) e da tração (C) aplicada ao cabo. O seu modelo matemático pode ser: f = C[cosh(d/2C)-1]

error = 10^-4
d = 500
fmax = 50
g(x) = x*(cosh(d/2*C)-1) - fmax
r = fixedpoint(1000, g, error)
println("Exercício 3.3.1\n",r, "\n")
