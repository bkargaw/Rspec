require 'stock_picker'


describe '#stock_picker' do
  subject (:stock_high_start) {[100, 20 , 30 ]}
  let (:stock_low_start) {[20, 100 , 30 ]}
  let (:stock_descending) {[100, 80, 70, 0]}
  let (:stock_even) {[20, 20, 20, 20]}

  it "can't sell stock before you buy it" do
    expect(stock_picker(stock_high_start)[1]).to_not eq(0)
  end

  it "returns an empty array when there's no profit" do
    expect(stock_picker(stock_even)).to eq([])
    expect(stock_picker(stock_descending)).to eq([])
  end

  it "returns an array of length 2" do
    expect(stock_picker(stock_high_start).length).to eq(2)
  end

  it "is the most profitable" do
    expect(stock_picker(stock_low_start)).to eq([0,1])
    expect(stock_picker(stock_high_start)).to eq([1,2])
  end
end
