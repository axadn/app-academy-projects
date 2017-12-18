require 'rspec'
require "stock_picker"

describe "stock_picker" do
  subject(:arr) {[1, 2, 4, 8, 5 ,3, 5, 6]}
  it "picks the most profitable pair of stocks(greatest difference in price) and returns indexes" do
    expect(stock_picker(arr)).to eq([0, 3])
  end
end
