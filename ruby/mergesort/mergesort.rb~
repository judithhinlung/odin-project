# ImplementsMergesort

def mergesort(a, b, left, right)
  if right <= left + 1
    return a
  end
  ave = (left + right) / 2
  mergesort(a, b, left, ave)
  mergesort(a, b, ave, right)
  merge(a, b, left, ave, right)
end

def merge(a, b, left, ave, right)
  leftIndex = left
  leftEnd = ave - 1
  rightIndex = ave
  rightEnd = right - 1
  index = left
  while (leftIndex <= leftEnd && rightIndex <= rightEnd)
    if a[rightIndex] < a[leftIndex]
      b[index] = a[rightIndex]
      index += 1
      rightIndex += 1
    else
      b[index] = a[leftIndex]
      leftIndex += 1
      index += 1
    end
  end
  while leftIndex <= leftEnd
    b[index] = a[leftIndex]
    leftIndex += 1
    index += 1
  end
  while rightIndex <= rightEnd
    b[index] = a[rightIndex]
    index += 1
    rightIndex += 1
  end
  i = 0
  while i < a.length
    a[i] = b[i]
    i += 1
  end
end




def sort(a)
  b = []
  i = 0
  while i < a.length
    b[i] = a[i]
    i += 1
  end
  mergesort(a, b, 0, a.length)
end
