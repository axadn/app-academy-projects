require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Chef chef the Great Baker")}
  subject {Dessert.new("cookie",1, chef)}
  describe "#initialize" do
    it "sets a type" do
      expect { subject.type}.to_not raise_error
    end

    it "sets a quantity" do
      expect { subject.quantity}.to_not raise_error
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cookie","one", chef)}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      subject.add_ingredient("milk")
      expect(subject.ingredients).not_to be_empty
    end

  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(subject.ingredients).to receive(:shuffle!)
      subject.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      subject.eat(1)
      expect(subject.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ subject.eat(2)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(subject.serve).to match(/#{chef.titleize}/)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake)
      subject.make_more
    end
  end
end
