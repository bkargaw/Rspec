

class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    raise (ArgumentError) unless self.all? {|el| el.is_a?(Fixnum)}
    result = []
    self.each_with_index do |el , i|
      j = i + 1
      while j < length
        result << [i,j] if self[i] + self[j] == 0
        j += 1
      end
    end

    result
  end

  def my_transpose
    return self if length <= 1
    ret = []
    i = 0
    while i < length
      sub_ret = []
      each do |array|
        sub_ret << array[i]
      end
      ret[i] = sub_ret
      i += 1
    end

    ret
  end

end
