# rubocop: disable Style/CaseEquality, Style/For
# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

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
    my_each { |indx| arr.push(indx) if yield(indx) }
    arr
  end

  def my_all?(*eval)
    my_each_with_index do |obj, indx|
      if block_given?
        return false unless yield(obj)
      elsif eval.length == 1
        return false unless eval[0] === obj
      elsif false === obj || nil === obj
        return false
      end
      return true if indx == length - 1
    end
    true if length.zero?
  end

  def my_any?(*eval)
    my_each_with_index do |obj, indx|
      if block_given?
        return true if yield(obj)
      elsif eval.length == 1
        return true if eval[0] === obj
      elsif true === obj
        return true
      end
      return false if indx == length - 1
    end
    false if length.zero?
  end

  def my_none?(*eval)
    my_each_with_index do |obj, indx|
      if block_given?
        return false if yield(obj)
      elsif eval.length == 1
        return false if eval[0] === obj
      elsif true === obj
        return false
      end
      return true if indx == length - 1
    end
    true if length.zero?
  end

  def my_count(*eval)
    return_value = 0
    sum_one = ->(bool) { return_value += 1 if bool }

    if block_given?
      my_each { |indx| sum_one.call(yield(indx)) }
    else
      my_each { |indx| eval.empty? ? return_value += 1 : sum_one.call(eval[0] == indx) }
    end

    return_value
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    arr = []
    my_each { |indx| arr.push(yield(indx)) }
    arr
  end

  def my_inject(*values)
    memo = nil
    sym = nil
    is_symbol_number = lambda do |value|
      sym = value.to_sym if Symbol === value || String === value
      memo = values[0] if Numeric === values[0]
      unless Symbol === value || String === value || (Numeric === values[0] && block_given?)
        raise TypeError, "#{value} is not a symbol nor a string"
      end
    end
    do_loop = lambda do
      my_each { |indx| memo = memo.nil? ? indx : yield(memo, indx) } if block_given?
      my_each { |indx| memo = memo.nil? ? indx : memo.send(sym, indx) } unless block_given?
    end
    is_symbol_number.call(values[0]) if values.my_count == 1 && !block_given?
    is_symbol_number.call(values[1]) if values.my_count == 2
    do_loop.call
    memo
  end
end

def multiply_els(arr)
  array = Array(arr)
  array.my_inject(:*)
end

p multiply_els([2, 4, 5])
# rubocop:enable Style/CaseEquality, Style/For
# rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
