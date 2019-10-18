require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Thalia") }
  subject(:chocolate) { Dessert.new("chocolate",10,chef)}
 

  describe "#initialize" do
    it "sets a type" do
      expect(chocolate.type).to eq("chocolate")
    end

    it "sets a quantity" do
      expect(chocolate.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(chocolate.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("chocolate", "you", chef)}.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      # expect(chocolate.add_ingredients).to_not include("sugar")
      chocolate.add_ingredient("sugar")
      expect(chocolate.add_ingredient("sugar")).to include("sugar")

    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["cocoa", "sugar","water"]
      ingredients.each do |ing|
        chocolate.add_ingredient(ing)
      end
      expect(chocolate.ingredients).to eq(ingredients)
      chocolate.mix!
      expect(chocolate.ingredients).to_not eq(ingredients)
      expect(chocolate.ingredients.sort).to eq(ingredients.sort)
      
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      chocolate.eat(6)
      expect(chocolate.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{chocolate.eat(11)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Thalia the Great Baker")
      expect(chocolate.serve).to eq("Chef Thalia the Great Baker has made 10 chocolates!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(chocolate)
      chocolate.make_more
    end
  end
end
