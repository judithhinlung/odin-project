# Sort an array of  integers by swapping elements i, j if i > j
def bubble_sort(x)
  i = 0
  while i < x.length-1 do
  j = i + 1
    while j < x.length do
      if x[i] > x[j]
        t = x[i]
               x[i] = x[j]
        x[j] = t
      end
      j += 1
    end
    i += 1
  end
  x.each { |i| puts i}
end
