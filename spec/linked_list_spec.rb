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

      expect(list.count).to eq(0)
      list.append("doop")
      
      expect(list.count).to eq(1)
    end
  end
  describe '#append multiple times' do
    it 'can append multiple elements' do

      list = LinkedList.new
      append_1 = list.append("doop")
      append_2 = list.append("deep")

      expect(list.head.next_node).to eq(append_2)
    end
  end
end