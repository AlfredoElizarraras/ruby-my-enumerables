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

  def my_count(*eval)
    return_value = 0
    sum_one = -> (bool) { return_value += 1 if bool }

    if block_given?
      self.my_each { |indx| sum_one.call(yield(indx)) }
    else
      self.my_each { |indx| eval.empty? ? return_value += 1 : sum_one.call(eval[0] == indx) }
    end

    return_value
  end
end
