# rubocop: disable Style/CaseEquality
# rubocop: disable Metrics/ModuleLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

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

  def my_all?(eval = nil)
    return_value = true

    if block_given?
      my_each do |indx|
        return_value = yield(indx)
        break unless return_value
      end
    else
      return_value = my_all? { |obj| eval === obj }
    end
    return_value
  end

  def my_any?(eval = nil)
    return_value = false

    if block_given?
      my_each do |indx|
        return_value = yield(indx)
        break if return_value
      end
    else
      return_value = my_all? { |obj| eval === obj }
    end
    return_value
  end

  def my_none?(eval = nil)
    return_value = false

    if block_given?
      my_each do |indx|
        return_value = !yield(indx)
        break if return_value
      end
    else
      return_value = my_all? { |obj| eval === obj }
    end
    return_value
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

  def my_inject(*args)
    memo = nil
    sym = nil
    is_symbol_number = lambda do |value|
      sym = value.to_sym if Symbol === value || String === value
      memo = args[0] if Numeric === args[0] && block_given?
      raise TypeError, "#{value} is not a symbol nor a string" unless Symbol === value || String === value || (Numeric === args[0] && block_given?)
    end
    do_loop = lambda do
      my_each { |indx| memo = memo.nil? ? indx : yield(memo, indx) } if block_given?
      my_each { |indx| memo = memo.nil? ? indx : memo.send(sym, indx) } unless block_given?
    end
    is_symbol_number.call(args[0]) if args.my_count == 1 && !block_given?
    is_symbol_number.call(args[1]) if args.my_count == 2
    do_loop.call
    memo
  end
end

def multiply_els(arr)
  array = Array(arr)
  array.my_inject(:*)
end

# p multiply_els([2, 4, 5])

# Same using a block and inject
p (5..10).my_inject { |sum, n| sum + n }            #=> 45
# Same using a block
p (5..10).my_inject(1) { |product, n| product * n } #=> 151200
# find the longest word
longest = %w{ cat sheep bear }.my_inject do |memo, word|
   memo.length > word.length ? memo : word
end
p longest                                        #=> "sheep"

# rubocop: enable Style/CaseEquality
# rubocop: enable Metrics/ModuleLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
