class LinkedList 
  attr_reader :head
  def initialize
    @head = nil
  end
  def append(data)
    if @head == nil
    @head = Node.new(data)
    else
      @head.next_node = Node.new(data)
    end
  end
  def count
    count = 1 
    if @head == nil
      count = 0
    elsif
      until @head.next_node == nil
        count += 1
      end
    end
    count
  end
end