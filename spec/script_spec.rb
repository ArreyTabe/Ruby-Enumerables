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
      expect(range.my_each { |n| n * 2 }).not_to be_instance_of(Array)
    end
  end
end
