require 'rspec'
require './string_calculator'

describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  specify { expect(calculator).to          respond_to(:add) }
  specify { expect(calculator.add("")).to  eql(0) }
  specify { expect(calculator.add("1")).to eql(1) }
end
