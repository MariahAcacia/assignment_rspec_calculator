require 'calculator'

describe Calculator do

  let(:calc){Calculator.new}

  describe "#add" do

    it "should return the sum of values given" do
      expect(calc.add(1,2)).to eq(3)
    end

    it "should return the sum of negative values given" do
      expect(calc.add(1,-2)).to eq(-1)
    end

    it "should return the sum of float values given" do
      expect(calc.add(3.5, 3.4)).to eq(6.9)
    end

  end

  describe "#subtract" do

    it "should return the value of the second value given subtracted from the first value" do
      expect(calc.subtract(1,2)).to eq(-1)
    end

    it "should properly subtract negative numbers" do
      expect(calc.subtract(-4, -2)).to eq(-2)
    end

    it "should return a float value when supplied a float value" do
      expect(calc.subtract(2.5, 1)).to eq(1.5)
    end

  end

  describe  "#mulitply" do

    it "return product of arguments" do
      expect(calc.multiply(3,5)).to eq(15)
    end

    it "returns product of negative arguments" do
      expect(calc.multiply(-3, 4)).to eq(-12)
    end

    it "returns product of float values" do
      expect(calc.multiply(3.4, 3)).to eq(10.2)
    end

  end

  describe "#divide" do

    it "returns value of first arg divided by second" do
      expect(calc.divide(15, 3)).to eq(5)
    end

    it "raises error if second argument is zero" do
      expect{calc.divide(5, 0)}.to raise_error(ArgumentError)
    end

    it "returns a float if there is a remainder" do
      expect(calc.divide(5,3)).to be_within(0.5).of(1.667)
    end

    it "properly divides negative numbers" do
      expect(calc.divide(-15, 3)).to eq(-5)
    end

  end

  describe "#pow" do

    it "raises first value to the power of the second value" do
      expect(calc.pow(3,3)).to eq(27.0)
    end

    it "raises first value to power of second for decimal values" do
      expect(calc.pow(27, 1/3.0)).to eq(3.0)
    end

    it "raises first value to the power of the second for negative values" do
      expect(calc.pow(5, -3)).to be_within(0.005).of(0.008)
    end

    it "raises first value to the power of the second for negative values" do
      expect(calc.pow(-5, 3)).to eq(-125)
    end

  end

  describe "#sqrt" do

    it "returns the squareroot for positive numbers" do
      expect(calc.sqrt(25)).to eq(5)
    end

    it "should raise error for negative numbers" do
      expect{calc.sqrt(-25)}.to raise_error
    end

    it "should return 2-digit decimals for non-round roots" do
      expect(calc.sqrt(8)).to be_within(0.05).of(2.83)
    end

  end

  describe "#memory=" do

    it "should store object in memory overwriting previous values " do
      expect(calc.memory=(8)).to eq(8)
    end

  end

  describe "#memory" do

    it "should equal nil to start" do
      expect(calc.memory).to be_nil
    end

    it "should return object stored in memory" do
      expect(calc.memory).to eq(calc.memory)
    end

    it "should clear memory after stored object has been returned" do
      calc.memory
      expect(calc.memory).to be_nil
    end

  end

  describe "#stringify" do

    let(:c) { Calculator.new(true) }

    it "returns string of computational functions output" do
      expect(c.add(1,2)).to eq("3")
    end

    it "returns string of computational functions output" do
      expect(c.divide(-15, 3)).to eq("-5")
    end

  end

end
