class JungleBeat
  attr_reader :list
  def initialize(data = nil)
    @list = LinkedList.new
    
    if !data.nil? 
      @list.head = @list.append(data)
    end
  end

  def append(data)
    split_data = data.split(" ")
    split_data.each do |data|
      @list.append(data)
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
end