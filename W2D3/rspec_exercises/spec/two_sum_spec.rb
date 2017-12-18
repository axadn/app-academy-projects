require 'rspec'
require 'two_sum'


describe Array do
  describe '#two_sum' do
    subject(:test_array) {[-2, 1, 3, -5, 2, 4]}
    it "returns an array of index pairs for elements that sum to zero" do
      expect(test_array.two_sum).to eq([[0,4]])
    end
  end




end
