# spec/enumerable_spec.rb
# rubocop:disable Layout/LineLength
require_relative '../main'
describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:hash) { { x: a, y: b } }
  let(:range) { (1...5) }
  let(:astring) { %w[this is a string] }
  describe '#my_each' do
    context 'it runs to the end of
    my_each if arguments
     are passed returns enum otherwise' do
      it { expect(arr.my_each).to be_instance_of(Enumerator) }
      it { expect(hash.my_each).to be_instance_of(Enumerator) }
      it { expect(arr.my_each { |x| puts x * 2 }).not_to eql([2, 4, 6]) }
      it { expect(arr.my_each { |x| puts x * 2 }).to be_instance_of(Array) }
      it { expect(range.my_each { |x| puts x * 2 }).not_to be_instance_of(Array) }
      it { expect(hash.my_each { |x| puts x * 2 }).not_to be_instance_of(Array) }
      it { expect { arr.my_each(1) { |x| puts x } }.to raise_error(ArgumentError) }
      it { expect { arr.my } }
      it { expect { |x| arr.my_each(&x) }.to yield_control }
      specify { expect { print(arr.my_each) }.to output.to_stdout }
    end
  end

  describe '#my_each_with_index' do
    context 'it goes through the array and processes the elements and indices' do
      it { expect(astring.my_each_with_index).to be_instance_of(Enumerator) }
      it { expect(astring.my_each_with_index { |x, y| puts x, y }).not_to eql({ 'cat' => 0, 'dog' => 1, 'wombat' => 2 }) }
      it { expect { [astring, 'another'].my_each_with_index(3) { |e, i| puts e, i } }.to raise_error(ArgumentError) }
    end
  end

  describe '#my_select' do
    context 'select elements with given condition' do
      it { expect(arr.my_select).to be_instance_of(Enumerator) }
      it { expect(arr.my_select(&:odd?)).to be_eql([1, 3]) }
      it { expect(arr.my_select(&:even?)).to contain_exactly(2) }

      it { expect(hash.my_select { |e| e == 'x' }).not_to be_instance_of(Hash) }
      it { expect { arr.my_select(4) }.to raise_error(ArgumentError) }
      it { expect((1..10).my_select(&:even?)).to contain_exactly(2, 4, 6, 8, 10) }
      it { expect(%i[foo bar].my_select { |x| x == :foo }).to contain_exactly(:foo) }
    end
  end

  describe '#my_all' do
    it 'check condition inside a block' do
      expect(%w[ant bear cat].my_all?(/t/)).to eq(%w[ant bear cat].my_all?(/t/))
    end
    it 'check if the items are numbers' do
      expect([1, 2i, 3.14].my_all?(Numeric)).to eq([1, 2i, 3.14].my_all?(Numeric))
    end
    it 'check if the items are the same type' do
      expect([nil, true, 99].my_all?).to eq([nil, true, 99].all?)
    end
  end

  describe '#my_any' do
    it 'check condition inside a block' do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eq(%w[ant bear cat].any? { |word| word.length >= 3 })
    end
    it 'check if any of the items are integers' do
      expect([nil, true, 99].my_any?(Integer)).to eq([nil, true, 99].any?(Integer))
    end
    it 'check if there are elements on the Array' do
      expect([].my_any?).to eq([].any?)
    end
  end

  describe '#my_none' do
    it 'check condition inside a block' do
      expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to eq(%w[ant bear cat].none? { |word| word.length == 5 })
    end
    it 'check if one of the elements is equal to the specified class' do
      expect([1, 3.14, 42].my_none?(Float)).to eq([1, 3.14, 42].none?(Float))
    end
    it 'check if the array is empty' do
      expect([].my_none?).to eq([].none?)
    end
  end

  describe '#my_inject' do
    context 'Checks my_inject method and its return' do
      it { expect((5..10).my_inject(:+)).to be_equal((5..10).inject(:+)) }
      it {
        expect(%w[cat sheep bear biggest].my_inject do |memo, word|
          memo.length > word.length ? memo : word
        end)
      }
      it { expect((1..10).my_inject(1, :*)).to be_equal((1..10).inject(1, :*)) }
    end
  end

  describe '#my_map' do
    it 'returns array with new results' do
      expect((1..4).my_map { |i| i * 3 }).to eq((1..4).map { |i| i * 3 })
    end
    it 'returns array with new results' do
      expect((1..4).my_map { 'cat' }).to eq((1..4).map { 'cat' })
    end
  end

  describe '#my_count' do
    ary = [1, 2, 4, 2]
    it 'evaluates my count method' do
      expect(ary.my_count).to eq(ary.my_count)
    end
    it 'evaluates my count method' do
      expect(ary.my_count(2)).to eq(ary.count(2))
    end
  end

  describe '#multiply_else' do
    it 'evaluates multiply else method' do
      expect(multiply_els([1, 2, 3, 4])).to eq(24)
    end
  end
end
# rubocop:enable Layout/LineLength
