using .MathConstants:e

  function fixedpoint(a, g, error)
    x = g(a)
    while abs(x-a) > error
      a = x
      x = g(a)
    end
    return x
  end

  g(x) = exp(x) - 2
  error = 10^-8
  r = fixedpoint(1.1, g, error)
  println(r)

  # Exercício 3.3.1
  g(x) = e^x-2

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



f(x) = x^2 - 4