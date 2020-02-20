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
    self.my_each {|indx| arr.push(indx) if yield(indx) }
    arr
  end

  def my_all?
    return_value = true
    return return_value unless block_given?

    self.my_each do |indx| 
      return_value = yield(indx)
      break unless return_value
    end
    return_value
  end
end


p %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
p %w[ant bear cat].all?(/t/)                        #=> false
p [1, 2i, 3.14].all?(Numeric)                       #=> true
p [nil, true, 99].all?                              #=> false
p [].all?  