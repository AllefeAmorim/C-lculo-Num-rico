using LinearAlgebra
using Plots

P(x) = [1 x[1] x[1]^2 x[1]^3 ;
  1 x[2] x[2]^2 x[2]^3 ;
  1 x[3] x[3]^2 x[3]^3 ;
  1 x[4] x[4]^2 x[4]^3 ]

p(x, y) = P(x) \ y

x = [0; 1; 2; 3]
y = [1; 6; 5; -8]

a = p(x, y)
println("Coeficientes do polinômio: ", a)

f(x) = a[1] + a[2]*x + a[3]*x^2 + a[4]*x^3

r = f(0)
println(r,"\n")

#Exercício 6.1.1: Encontre o polinômio interpolador para o conjunto de pontos [(-2 , 47) , (0, -3) , (1 , 4) , (2, 41)] Então, faça um gráfico com os pontos e o polinômio interpolador encontrado.
println("Exercício 6.1.1\n")
q(x , y) = P(x) \ y

x = [-2; 0; 1; 2]
y = [47; -3; 4; 41]

a = q(x , y)
println(a)

r = f(0)
println(r,"\n")

#Exercício 6.1.2: Encontre o polinômio interpolador para o conjunto de pontos [(-1,1.25),(0.5,0.5),(1.1.25),(1.25,1.8125)]

println("Exercício 6.1.2\n")

x = [-1 ; 0.5 ; 1 ; 1.25]
y = [1.25 ; 0.5 ; 1.25 ; 1.8125]

a = p(x, y)
println(a)
