require 'towers_of_hanoi'

describe "TowersOfHanoi" do
  subject(:hanoi) { TowersOfHanoi.new }

  describe '#initialize' do
    it 'initializes an instance variable towers of length three' do
      expect(hanoi.towers.length).to eq(3)
    end

    it 'expects first tower to have properly ordered disks' do
      expect(hanoi.towers[0]).to eq([3,2,1])
    end

    it 'expects the other two towers to be empty' do
      expect(hanoi.towers[1]).to be_empty
      expect(hanoi.towers[2]).to be_empty
    end

    it 'initializes the number of turns to be 0' do
      expect(hanoi.turns).to eq(0)
    end
  end

  describe '#move' do
    it 'receives two arguments with start tower and the end tower' do
      expect(hanoi).to receive(:move).with(0,1)
      hanoi.move(0,1)
    end

    it 'raises an error if you select an empty start tower' do
      expect{ hanoi.move(1, 2) }.to raise_error("Invalid start position")
    end

    it 'raises an error if you select outside of the tower indices' do
      expect{ hanoi.move(-1, 2) }.to raise_error("Invalid start position")
      expect{ hanoi.move(0, 3) }.to raise_error("Invalid end position")

    end

    it 'raises an error if you try to move bigger piece atop a smaller piece' do
      hanoi.move(0, 1)
      expect{ hanoi.move(0, 1) }.to raise_error(ArgumentError, "Invalid move")
    end

    it 'places disk in the right tower' do
      hanoi.move(0,1)
      expect(hanoi.towers[1]).to eq([1])
    end

    it 'removes the disk from the original tower' do
      hanoi.move(0,1)
      expect(hanoi.towers[0]).to eq([3, 2])
    end
  end

  describe '#won?' do
    let (:winner) {TowersOfHanoi.new}
    let (:loser) {TowersOfHanoi.new}
    before(:each) {winner.towers = [[],[],[3,2,1]]}
    before(:each) {loser.towers = [[],[1],[3,2]]}

    it 'checks first is not the winning tower' do
      expect(hanoi.won?).to be(false)
    end

    it 'returns true if a winning tower exists' do
      expect(winner.won?).to be(true)
    end

    it 'returns false if no winning tower' do
      expect(loser.won?).to be(false)
    end
  end
end
