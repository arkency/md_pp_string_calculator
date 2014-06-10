class NegativesNotAllowed < StandardError; end

class StringCalculator
  def add(input)
    numbers   = numbers_in(input)
    negatives = numbers.select{|n| n<0}
    raise NegativesNotAllowed.new(negatives.join(", ")) unless negatives.empty?
    numbers.reduce(:+).to_i
  end

  private

  def regex
    %r{(//(?<delimiter>.)\n)?(?<numbers>.*)}m
  end

  def extract_delimiters(matchdata)
    %w(, \n) + Array(matchdata[:delimiter]).map { |delimiter| Regexp.escape(delimiter) }
  end

  def extract_numbers(matchdata, delimiters)
    matchdata[:numbers].split(/#{delimiters.join('|')}/).map(&:to_i)
  end

  def numbers_in(input)
    matchdata  = regex.match(input)
    delimiters = extract_delimiters(matchdata)
    numbers    = extract_numbers(matchdata, delimiters)
  end
end
