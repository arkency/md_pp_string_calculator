require 'rspec'
require './string_calculator'

describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  specify { expect(calculator).           to     respond_to(:add) }
  specify { expect(calculator.add("")).   to     eql(0)           }
  specify { expect(calculator.add("1")).  to     eql(1)           }
  specify { expect(calculator.add("1,2")).to     eql(3)           }
  specify { expect(calculator.add("1,2,3,4")).to eql(10)          }
  specify { expect(calculator.add("1\n2\n3")).to eql(6)           }
end
