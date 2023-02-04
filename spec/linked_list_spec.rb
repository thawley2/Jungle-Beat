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
    it 'can add multiple nodes to the end of a list' do

      list = LinkedList.new
      append_1 = list.append("doop")
      append_2 = list.append("deep")

      expect(list.head.next_node).to eq(append_2)
      expect(list.count).to eq(2)
    end
  end

  describe '#to_string' do
    it 'can list all data from all nodes in one string' do

      list = LinkedList.new
      append_1 = list.append("doop")
      append_2 = list.append("deep")

      expect(list.to_string).to eq("doop deep")
    end
  end

  describe '#prepend' do
    it 'can add a node to the beginning of the list' do
      list = LinkedList.new
      list.append("plop")
      list.append("suu")
      list.prepend("dop")

      expect(list.head.data).to eq("dop")
      expect(list.to_string).to eq("dop plop suu")
      expect(list.count).to eq(3)
    end
  end

  describe '#insert' do
    it 'can insert a node into a list at a specified index' do
      
      list = LinkedList.new
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
      list.insert(1, "woo")

      expect(list.to_string).to eq("dop woo plop suu")
    end
  end

  it 'can throw an error message if inserting into an empty list' do
    list = LinkedList.new

    expect(list.insert(2, "wop")).to eq("There is nothing in the list yet, so your new data was added to the head of the list, you are welcome.")
  end

  it 'can throw an error message if insert location is less than 1' do
    list = LinkedList.new
    list.append("plop")

    expect(list.insert(0, "wop")).to eq("Just use the prepend method!!")
  end

  it 'can throw a different error message if the insert location exceeds the length of the list' do
    list = LinkedList.new
    list.append("plop")
    list.append("chop")
    list.append("blop")
    list.append("clop")
    
    expect(list.insert(5, "wop")).to eq("The list is not that long, please choose a new index position that is less than 4")
  end
end