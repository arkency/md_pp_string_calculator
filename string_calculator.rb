class NegativesNotAllowed < StandardError; end

class StringCalculator
  def add(input)
    regex      = %r{(//(?<delimiter>.)\n)?(?<numbers>.*)}m
    matchdata  = regex.match(input)
    delimiters = %w(, \n) + Array(matchdata[:delimiter]).map { |delimiter| Regexp.escape(delimiter) }
    numbers    = matchdata[:numbers].split(/#{delimiters.join('|')}/).map(&:to_i)
    negatives  = numbers.select{|n| n<0}
    raise NegativesNotAllowed.new(numbers.join(", ")) unless negatives.empty?
    numbers.reduce(:+).to_i
  end
end
