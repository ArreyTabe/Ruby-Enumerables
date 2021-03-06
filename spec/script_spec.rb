# spec/enumerable_spec.rb
require_relative '../script'
describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:hash) { { x: 'a', y: 'b' } }
  let(:range) { (1...5) }
  let(:astring) { %w[this is a string] }
  describe '#my_each' do
    it 'iterates through each item in the collection if block is given returns enum otherwise' do
      expect(arr.my_each).to be_instance_of(Enumerator)
      expect(hash.my_each).to be_instance_of(Enumerator)
      expect(arr.my_each { |n| n }).to be_instance_of(Array)
      expect(range.my_each { |n| n * 2 }).not_to be_instance_of(Array)
    end
  end
  describe '#my_each_with_index' do
    it 'Iterate the elements in a collection and returns elements with index if block, otherwise returns Enum' do
      expect(arr.my_each_with_index).to_not be_instance_of(Array)
      expect(astring.my_each_with_index).to be_instance_of(Enumerator)
      expect(astring.my_each_with_index { |x, y| puts x, y }).not_to eql({ 'this' => 0, 'is' => 1, 'a' => 2 })
    end
  end
  describe '#my_select' do
    it 'selects all elements for which given block returns true, returns enum if no block given' do
      expect(arr.my_select).to_not be_instance_of(Array)
      expect(arr.my_select).to be_instance_of(Enumerator)
      expect(arr.my_select(&:odd?)).to be_eql([1, 3])
      expect(arr.my_select(&:even?)).to_not include(1)
      expect(astring.my_select { |n| n.length >= 4 }).to include('this', 'string')
    end
  end
  describe '#my_all?' do
    it 'iterates a collection and checks the condition within a given block' do
      expect(%w[ant bear cat].all? { |word| word.length >= 3 }).not_to eq(false)
    end
    it 'checks if items in a collection are numeric' do
      expect([1i, 2, 3.14].all?(Numeric)).to eq(true)
    end
    it 'checks if the items are the same type' do
      expect([nil, 99, false]).to_not eq(Integer)
    end
  end
  describe '#my_any?' do
    it 'iterates a collection and checks the condition within a given block' do
      expect(%w[is almost done].my_any? { |n| n.length > 4 }).to eq(true)
    end
    it 'checks for any boolean type' do
      expect([true, 44, 'yes'].my_any?).to eq(true)
    end
    it 'checks if there are elements in the Array' do
      expect([].my_any?).to eq([].any?)
    end
  end

  describe '#my_none?' do
    it 'check condition inside a block' do
      expect(astring.my_none? { |word| word.length == 5 }).to eq(astring.none? { |word| word.length == 5 })
    end
    it 'check if one of the elements is equal to the specified class' do
      expect([1, 3.14, 42].my_none?(Float)).to eq([1, 3.14, 42].none?(Float))
    end
    it 'check if the array is empty' do
      expect([].my_none?).to eq([].none?)
    end
  end

  describe '#my_count' do
    it 'evalute the method' do
      expect(arr.my_count).to eq(arr.my_count)
    end
    it 'evaluate the my_count method' do
      expect(arr.my_count(2)).to eq(arr.count(2))
    end
  end

  describe '#my_map' do
    it 'loops through an array and returns new array with the mapped element' do
      expect(range.my_map { |i| i * 3 }).to eq(range.map { |i| i * 3 })
    end
    it 'returns array with new results' do
      expect(range.my_map { 'cat' }).to eq(range.map { 'cat' })
    end
  end

  describe '#my_inject' do
    it 'checks my_inject method' do
      expect((5..10).my_inject(:+)).to eq(45)
    end
    it 'runs throung a block summing it' do
      expect((5..10).my_inject { |sum, n| sum + n }).to eq(45)
    end
    it 'multiplies some numbers' do
      expect((5..10).my_inject(1, :*)).to eq(151_200)
    end
    it 'iterates over a collection of words and returns the longest word' do
      expect(%w[cat sheep bear].my_inject do |memo, word|
               memo.length > word.length ? memo : word
             end).to eq('sheep')
    end
  end

  describe '#my_count' do
    ary = [1, 2, 4, 2]
    it 'evaluates my_count method' do
      expect(ary.my_count).to eq(4)
    end
    it 'evaluates my count method' do
      expect(ary.my_count(2)).to eq(2)
    end
    it 'runs loops through a collection' do
      expect(ary.my_count(&:even?)).to eq(3)
    end
  end
  describe '#multiply_else' do
    it 'evaluates multiply else method' do
      expect(multiply_els([1, 2, 3, 4])).to eq(24)
    end
  end
end
