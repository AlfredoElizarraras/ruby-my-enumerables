# Each
module Enumerable

  def my_each
    return "There were no block given" unless block_given?

    for indx in self do
      yield(indx)
    end 
  end

end