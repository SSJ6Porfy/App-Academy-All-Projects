require 'rspec'
require 'first_TDD'

describe Array do
  let(:dups_array) {[1, 2, 1, 4, 4]}
  let(:pairs_arr) {[1, 0 , -1, 0, 2]}
  let(:matrix) {
    [[1, 2, 3],
     [4, 5, 6],
     [7, 8, 9]]
  }

  let(:stock_prices) { [1.5, 3.7, 5.5, 2.6, 1.5, 5.5] }

  describe "#my_uniq" do
    it "removes duplicates elements and returns array" do
      expect(dups_array.my_uniq).to eq([1, 2, 4])
    end

    it "cannot receive Array#uniq method" do
      expect(dups_array).not_to receive(:uniq)
    end
  end

  describe "#two_sum" do
    it "finds all pairs that sum to zero" do
      expect(pairs_arr.two_sum).to eq([[0, 2], [1, 3]])
    end

    it "sorts the nested indices dictionary_wise" do
      expect(pairs_arr.two_sum).not_to eq([[1, 3], [0, 2]])
    end
  end

  describe "#my_transpose" do
    it "converts the orientation of the array" do
      expect(matrix.my_transpose).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    end

  end

  describe "#stock_picker" do
    it "returns an array of days with biggest profits" do
      expect(stock_prices.stock_picker).to eq([0, 2])
    end

    it "returns the first day with the largest profit" do
      expect(stock_prices.stock_picker).not_to eq([4, 5])
    end
  end

end
