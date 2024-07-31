#function series_de_potencia(x)
#  termo = 1
#  i = 0
#  exp = 0
#  while termo > 0
     termo = termo * (x/n)
#    exp += x^i/factorial(i)
#    i = i + 1
#  end
#  return exp
#end

function e(x)
  termo = 1
  soma = 1
  n = 1 
  while termo > 0
    termo = termo * (x/n)
    soma = soma + termo
    n = n + 1
  end
  return [soma n]
end

y = e(1)

println(y)

ex = series_de_potencia(2)

println(ex)