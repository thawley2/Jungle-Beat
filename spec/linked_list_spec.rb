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
      expect(list.append("deep")).to eq("deep")
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
      
      expect(list.append("deep")).to eq("deep")
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

    it 'can return nil if list is empty' do
      
      list = LinkedList.new
      expect(list.to_string).to be nil
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

      expect(list.to_string).to eq("dop plop suu")
      expect(list.count).to eq(3)

      list.insert(1, "woo")

      expect(list.to_string).to eq("dop woo plop suu")
    end
  end

  it 'if inserting into an empty list it assigns the node to head' do
    list = LinkedList.new

    expect(list.insert(2, "wop")).to eq(list.head.data)
  end

  it 'can append a node if the insert location is less than or equal to 0' do
    list = LinkedList.new
    list.append("plop")

    expect(list.insert(0, "wop")).to eq(list.head.data)
    expect(list.insert(-1, "deep")).to eq(list.head.data)
  end

  it 'can insert node at the end of the list if the insert location exceeds the length of the list' do
    list = LinkedList.new
    list.append("plop")
    list.append("chop")
    list.append("blop")
    list.append("clop")
    list.insert(5, "wop")
    expect(list.to_string).to eq("plop chop blop clop wop")
  end

  describe '#find' do
    it 'can return an empty string if there is nothing in the list' do
      list = LinkedList.new
      expect(list.to_string).to be nil
    end

    it 'can find a list of data starting at a specific index' do
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.to_string).to eq("deep woo shi shu blop")
      expect(list.count).to eq(5)
      expect(list.find(2, 1)).to eq("shi")
      expect(list.find(1, 3)).to eq("woo shi shu")
    end

    it "can error out if the find arguments don't match a true position in the list" do
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.find(1, 5)).to eq('Error')
      expect(list.find(6, 1)).to eq('Error')
    end
  end
  
  describe '#includes?' do
    it 'can return true or false' do
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.includes?("deep")).to be(true)
      expect(list.includes?("dep")).to be(false)

    end
  end

  describe '#pop' do
    it 'can remove and return the last node in the list' do
      list = LinkedList.new
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.prepend("deep")
      list.append("blop")

      expect(list.to_string).to eq("deep woo shi shu blop")
      expect(list.count).to eq(5)
      expect(list.pop).to eq("blop")
      expect(list.pop).to eq("shu")
      expect(list.to_string).to eq("deep woo shi")
    end

    it 'can return error if pop is called on an empty list' do
      list = LinkedList.new

      expect(list.pop).to eq('Error')
    end
  end
end