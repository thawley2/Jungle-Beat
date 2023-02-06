
class JungleBeat
@@valid_inputs = ['tee', 'dee', 'deep', 'bop', 'boop', 'la', 'na', 'doo', 'ditt', 'woo', 'hoo', 'shu', 'boots', 'and', 'cats']
  attr_reader :list
  def initialize(data = nil)
    @list = LinkedList.new
    
    if !data.nil? 
      @list.head = @list.append(data)
    end
  end

  def append(data)
    split_data = data.split(" ")
    valid = split_data.select do |data|
      if @@valid_inputs.any? {|valid_input| valid_input == data}
        data
      end
    end
    valid.each do |data|
      @list.append(data)
      end
    data
  end

  def prepend(data)
    split_data = data.split(" ")
    valid = split_data.select do |data|
      if @@valid_inputs.any? {|valid_input| valid_input == data}
        data
      end
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
    `say -r 250 -v Daniel #{@list.to_string}`
    "Thank you for playing Jungle Beat, may the sounds haunt your dreams!"
  end

  def all
    @list.to_string
  end
end