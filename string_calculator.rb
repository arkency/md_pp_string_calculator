class StringCalculator
  def add(input)
    regex      = %r{(//(?<delimiter>.)\n)?(?<numbers>.*)}m
    matchdata  = regex.match(input)
    delimiters = %w(, \n) + Array(matchdata[:delimiter]).map { |delimiter| Regexp.escape(delimiter) }
    matchdata[:numbers].split(/#{delimiters.join('|')}/).map(&:to_i).reduce(:+).to_i
  end
end
