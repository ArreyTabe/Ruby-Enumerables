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
      expect(arr.my_each {|n| n }).to be_instance_of(Array)
      expect(range.my_each { |n| n * 2 }).not_to be_instance_of(Array)
    end
  end
  describe "#my_each_with_index" do
      it "Iterate through the elements in a collection and returns the elements with its index if block is given, otherwise it returns the Enum" do
       expect(arr.my_each_with_index).to_not be_instance_of(Array)
       expect(astring.my_each_with_index).to be_instance_of(Enumerator) 
       expect(astring.my_each_with_index { |x, y| puts x, y }).not_to eql({ "this" => 0, "is" => 1, "a" => 2, "string" => 3  })
       expect([astring, 'uchenna'].my_each_with_index(3) { |e, i| puts e, i }).to raise_error(ArgumentError)
       end
    end
end