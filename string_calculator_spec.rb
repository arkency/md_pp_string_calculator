require 'rspec'
require './string_calculator'

describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  specify do
    expect(calculator).to          respond_to(:add)
    expect(calculator.add("") ).to eql(0)
    expect(calculator.add("1")).to eql(1)
  end
end
