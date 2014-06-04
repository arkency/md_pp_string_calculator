class StringCalculator
  def add(numbers)
    numbers.split(",").map(&:to_i).reduce(:+).to_i
  end
end
