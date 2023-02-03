require 'rspec'
require './lib/node'
require './lib/linked_list'

RSpec.describe LinkedList do
  describe '#instance' do
    it 'is an instance of LinkedList' do

      list = LinkedList.new

      expect(list).to be_instance_of(LinkedList)
    end
  end
  describe '#head' do
    it 'returns nil if no head is present' do

      list = LinkedList.new

      expect(list.head).to be nil
    end
  end
  describe '#append' do
    it 'can add data to the list' do

      list = LinkedList.new
      list.append("doop")

      expect(list.head).to be_instance_of(Node)
      expect(list.head.data).to eq("doop")
    end
  end
  describe '#head.next_node' do
    it 'can show the next node' do

      list = LinkedList.new
      list.append("doop")

      expect(list.head.next_node).to be nil
    end
  end
  describe '#count' do
    it 'can count how many nodes have been created' do

      list = LinkedList.new
      list.append("doop")
      
      expect(list.count).to eq(1)
    end
  end
end