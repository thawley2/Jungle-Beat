class JungleBeat
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def append(data)
    split_data = data.split(" ")
    split_data.each do |data|
      @list.append(data)
    end
    data
  end
end