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
    end
  end
end