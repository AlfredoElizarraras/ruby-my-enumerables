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
end
