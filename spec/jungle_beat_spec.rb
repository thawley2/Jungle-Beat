require 'rspec'
require './lib/node'
require './lib/linked_list'
require './lib/jungle_beat'

RSpec.describe JungleBeat do
  describe '#instanct' do
    it 'is an instance of' do
      jb = JungleBeat.new

      expect(jb).to be_instance_of(JungleBeat)
    end
  end
  
  describe '#list' do
    it 'has a list that stores an instance of LinkedList' do
      jb = JungleBeat.new

      expect(jb.list).to be_instance_of(LinkedList)
      expect(jb.list.head).to be nil
    end
  end

  describe '#append' do
    it 'can take a string with multiple words and create nodes' do
      jb = JungleBeat.new

      jb.append("deep doo ditt")
      
      expect(jb.list.head.data).to eq("deep")
      expect(jb.list.head.next_node.data).to eq("doo")
    end
  end

  describe '#count' do
    it 'can count all the nodes in a list' do
      jb = JungleBeat.new

      jb.append("deep doo ditt")
      jb.append("woo hoo shu")

      expect(jb.count).to eq(6)
    end
  end

  describe '#play' do
    xit 'can play sounds' do
      jb = JungleBeat.new

      jb.append("boots and cats and")
      jb.append("boots and cats and")
      jb.append("boots and cats and")
      jb.append("boots and cats and")
      jb.append("boots and cats and")
      jb.append("boots and cats and")
      jb.append("boots and cats and")
      jb.append("boots and cats and")
      jb.append("boots and cats and")

      expect(jb.play).to eq("Thank you for playing Jungle Beat!")
      #You should also be hearing sound, if you don't, your speakers are not on, 
      #it's most definitely not my code. :)
    end
  end

  describe '#argument when initializing class' do
    it 'can take an argument during class initialization' do
      jb = JungleBeat.new("deep")

      expect(jb.count).to eq(1)
    end
  end
end