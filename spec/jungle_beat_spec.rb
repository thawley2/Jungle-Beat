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
    it 'can play sounds' do
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

      expect(jb.play).to eq(36)
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

  describe 'Validating beats' do
    it 'has a list of valid beats and skips initializing invalid beats' do
      jb = JungleBeat.new("deep")

      jb.append('Mississippi')
      
      expect(jb.count).to eq(1)
    end
  end

  describe '#all' do
    it 'can display all beats in the list' do
      jb = JungleBeat.new("deep")

      jb.append('Mississippi')

      expect(jb.all).to eq("deep")

      jb.append('bop')
      
      expect(jb.all).to eq("deep bop")
    end
  end

  describe '#prepend' do
    it 'can take a list of multiple words and prepend them to the beginning of the list' do
      jb = JungleBeat.new("deep")

      jb.prepend("tee tee hee Mississippi")

      expect(jb.all).to eq("hee tee tee deep")
    end
  end

  it 'can take multiple words when initializing the class' do
    jb = JungleBeat.new("deep dop dop deep")

    expect(jb.count).to eq(4)
  end

  describe '#voice, #rate' do
    it 'voice and rate have default values' do
      jb = JungleBeat.new("deep dop dop deep")

      expect(jb.voice).to eq("Boing")
      expect(jb.rate).to eq(500)
    end
  end

  it 'can change the voice and rate' do
    jb = JungleBeat.new("deep dop dop deep")

    jb.voice = 'Daniel'
    jb.rate = 100

    expect(jb.voice).to eq('Daniel')
    expect(jb.rate).to eq(100)
  end

  describe '#reset_voice, #reset_rate' do
    it 'can return the voice and rate back to default' do
      jb = JungleBeat.new("deep dop dop deep")

      jb.voice = 'Daniel'
      jb.rate = 100

      jb.reset_voice
      jb.reset_rate

      expect(jb.voice).to eq('Boing')
      expect(jb.rate).to eq(500)
    end
  end  
end 
