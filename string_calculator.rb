class StringCalculator
  def add(numbers)
    numbers.split(/,|\n/).map(&:to_i).reduce(:+).to_i
  end
end
