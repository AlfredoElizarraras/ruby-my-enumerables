# Each
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for indx in self do
      yield(indx)
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    counter = 0
    for indx in self do
      yield(indx, counter)
      counter += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    arr = []
    self.my_each { |indx| arr.push(indx) if yield(indx) }
    arr
  end

  def my_all?( eval = nil )
    return_value = true

    if block_given?
      self.my_each do |indx| 
        return_value = yield(indx)
        break unless return_value
      end
    else
      return_value = self.my_all? { |obj| eval === obj }
    end 
    return_value
  end

  def my_any?(eval = nil)
    return_value = false

    if block_given?
      self.my_each do |indx|
        return_value = yield(indx)
        break if return_value
      end
    else
      return_value = self.my_all? { |obj| eval === obj }
    end
    return_value
  end

  def my_none?(eval = nil)
    return_value = false

    if block_given?
      self.my_each do |indx|
        return_value = !yield(indx)
        break if return_value
      end
    else
      return_value = self.my_all? { |obj| eval === obj }
    end
    return_value
  end
end


p %w{ant bear cat}.none? { |word| word.length == 5 } #=> true
p %w{ant bear cat}.none? { |word| word.length >= 4 } #=> false
p %w{ant bear cat}.none?(/d/)                        #=> true
p [1, 3.14, 42].none?(Float)                         #=> false
p [].none?                                           #=> true
p [nil].none?                                        #=> true
p [nil, false].none?                                 #=> true
p [nil, false, true].none?                           #=> false