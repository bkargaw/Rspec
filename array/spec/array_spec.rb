require 'array'

describe Array do

  context 'monkey-patched array class methods' do
    describe '#my_uniq' do
      subject(:my_non_uniq) { [1, 2, 1, 3, 4, 3] }
      let(:mixed_bag) { [1, 2, 1, "hi", 4, "hi", "hello",{},{}] }

      it 'works for all integers' do
        expect(my_non_uniq.my_uniq).to eq([1, 2, 3, 4])
      end

      it "works for mixed data types" do
        expect(mixed_bag.my_uniq).to eq([1,2,"hi", 4,"hello", {}])
      end

    end

    describe "#two_sum" do
      subject(:nums) {[-5, 0, 5, 3, 0]}
      let(:defective_nums) { [-5, 0, 5, 3, 0, 'haha'] }

      it "returns an argument error if all array values are not Fixnum" do
        expect { defective_nums.two_sum }.to raise_error(ArgumentError)
      end

      it "returns an array of arrays with length of two" do
        expect( nums.two_sum[0].length ).to eq(2)
        expect( nums.two_sum.select { |el| el.length != 2 } ).to be_empty
      end

      it "return indices and not values" do
        expect( nums.two_sum ).to_not eq([[-5,5], [0,0]])
      end

      it "returns an array with first seen elements dictating order" do
        expect( nums.two_sum ).to eq([[0,2], [1,4]])
        expect( nums.two_sum ).to_not eq([[1,4], [0,2]])
      end
    end

    describe "#my_transpose" do
      subject(:three_D_array) { [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]}
      let(:two_D_array) { [
        [1, 2],
        [3, 4]
      ]}
      let(:one_D_array) { [1, 2, 3, 4]}

      it "returns an empty array when passed an empty array" do
        expect([].my_transpose).to be_empty
      end

      it "returns an array with same value if given an array of length 1" do
        expect(["D"].my_transpose).to eq(["D"])
      end

      it "transposes one-dimensional array" do
        expect(two_D_array.my_transpose).to eq([[1,3], [2,4]])
      end

      it "transposes two by two array" do
        expect(two_D_array.my_transpose).to eq([[1,3], [2,4]])
      end

      it "transposes three by three array" do
        expect(three_D_array.my_transpose).to eq([[0,3,6], [1,4,7], [2,5,8]])
      end

      it "does not call built-in Array#transpose method" do
        expect(two_D_array).to_not receive(:transpose)
        two_D_array.my_transpose
      end
    end

  end

  
end
