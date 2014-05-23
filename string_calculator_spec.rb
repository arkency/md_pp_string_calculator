require 'rspec'
require './string_calculator'

describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  specify { expect(calculator).to respond_to(:add) }

  specify { expect(calculator.add("")).to eql(0) }
end
