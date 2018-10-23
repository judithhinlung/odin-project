# Iterative fibonacci
def fibs(n)
  a = []
  a[0] = 0
  a[1] = 1
  if n <= 1
    return n
  end
  i = 2
  while i  <= n
    a[i] = a[i-1] + a[i-2]
    i +=1
  end
  return a[n]
end

# Recursive Fibonacci
def fib_rec(n)
  if n == 0 
    return 0 
  elsif n == 1 
    return 1
  else 
    fib_rec(n-1) + fib_rec(n-2)
  end
end
