require 'rspec'
require './string_calculator'

describe StringCalculator do
  let(:calculator) { StringCalculator.new }
  CUSTOM_DELIMITERS = ((33..46).to_a + (58..63).to_a).map(&:chr)

  specify { expect(calculator).           to     respond_to(:add) }
  specify { expect(calculator.add("")).   to     eql(0)           }
  specify { expect(calculator.add("1")).  to     eql(1)           }
  specify { expect(calculator.add("1,2")).to     eql(3)           }
  specify { expect(calculator.add("1,2,3,4")).to eql(10)          }
  specify { expect(calculator.add("1\n2\n3")).to eql(6)           }

  CUSTOM_DELIMITERS.sample.tap do |custom_delimiter|
    specify "adding with a custom #{custom_delimiter} delimiter" do
      expect(calculator.add("//#{custom_delimiter} 3#{custom_delimiter}5")).to eql(8)
    end
  end
end
