class Array

  def my_uniq
    arr = []
    each do |el|
      arr << el unless arr.include?(el)
    end
    arr
  end

  def two_sum
    indices = []
    each_index do |i|
      (i + 1).upto(size- 1) do |j|
        next if i == size - 1
        indices << [i, j] if self[i] + self[j] == 0
      end
    end

    indices
  end

  def my_transpose
    transposed = []
    each_index do |i|
      transposed << []
      self[i].each_index do |j|
        transposed[i] << self[j][i]
      end
    end
    transposed
  end

  def stock_picker
    indices = nil
    biggest_profit = 0
    each_index do |i|
      (i + 1).upto(size- 1) do |j|
        next if i == size - 1
        profit = self[j] - self[i]
        if profit > biggest_profit
          indices =[i, j]
          biggest_profit = profit
        end
      end
    end

    indices
  end

end
