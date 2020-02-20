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

  def my_all?
    return_value = true
    return return_value unless block_given?

    self.my_each do |indx|
      return_value = yield(indx)
      break unless return_value
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
end
