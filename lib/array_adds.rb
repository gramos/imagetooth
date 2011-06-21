class Array
  def sequence(i = 0, *a)
    return [a] if i == size
    self[i].map {|x|
      sequence(i+1, *(a + [x]))
    }.inject([]) {|m, x| m + x}
  end

  def permut(n)
    arr = Array.new
    1.upto(n){ arr.push(self) }
    arr.sequence
  end

end
