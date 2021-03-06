require 'rspec'
require './string_calculator'

describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  specify { expect(calculator).           to     respond_to(:add) }
  specify { expect(calculator.add("")).   to     eql(0)           }
  specify { expect(calculator.add("1")).  to     eql(1)           }
  specify { expect(calculator.add("1,2")).to     eql(3)           }
  specify { expect(calculator.add("1,2,3,4")).to eql(10)          }
  specify { expect(calculator.add("1\n2,3")).to  eql(6)           }

  custom_delimiters = ((33..46).to_a + (58..63).to_a).map(&:chr)
  custom_delimiters.map do |delimiter|
    specify { expect(calculator.add("//#{delimiter}\n3#{delimiter}5")).to eql(8) }
  end

  specify { expect{calculator.add("-1,-2")}.to   raise_error(NegativesNotAllowed, "-1, -2")}
  specify { expect(calculator.add("2,1001")).to  eql(2) }
end
