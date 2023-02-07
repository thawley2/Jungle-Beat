
class JungleBeat
@@valid_inputs = ['tee', 'dee', 'deep', 'bop', 'boop', 'la', 'na', 'doo', 'ditt', 'woo', 'hoo', 'shu', 'boots', 'and', 'cats', 'dop', 'hee']
  attr_reader :list
  attr_accessor :rate, :voice
  def initialize(data = nil)
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
    
    if data != nil 
      append(data)
    end
  end

  def append(data)
    split_data = data.split(" ")
    valid = split_data.select do |data|
    @@valid_inputs.any? {|valid_input| valid_input == data}
    end
    valid.each do |data|
      @list.append(data)
      end
    data
  end

  def prepend(data)
    split_data = data.split(" ")
    split_data.reverse
    valid = split_data.select do |data|
      @@valid_inputs.any? {|valid_input| valid_input == data}
    end
    valid.each do |data|
      @list.prepend(data)
      end
    data
  end

  def count
    @list.count
  end

  def play
    `say -r #{@rate} -v #{@voice} #{@list.to_string}`
    "Thank you for playing Jungle Beat, may the sounds haunt your dreams!"
    count
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end

  def all
    @list.to_string
  end
end