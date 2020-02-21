
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

  def my_map
    return to_enum(:my_map) unless block_given?

    arr = []
    self.my_each { |indx| arr.push(yield(indx)) }
    arr
  end

  def my_inject(*args)
    memo = nil
    sym = nil

    is_symbol_number = -> (value) do
      if Symbol === value || String === value 
          sym = value.to_sym
      elsif Numeric === args[0] && block_given?
        memo = args[0]
      else
        raise TypeError, "#{value} is not a symbol nor a string"
      end  
    end

    do_loop = -> do
      self.my_each { |indx| memo = memo.nil? ? indx : block_given? ? yield(memo,indx) : memo.send(sym, indx) }
    end

    if args.my_count == 1 
      is_symbol_number.call(args[0]) unless block_given?
    elsif args.my_count == 2
      is_symbol_number.call(args[1])
    end
    do_loop.call

    memo
  end

end

def multiply_els(arr)
  array = Array(arr) rescue []
  x = array.my_inject(:*)
end

p multiply_els([2,4,5])
