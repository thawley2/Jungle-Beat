class LinkedList 
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(data)
    new_node = Node.new(data)
    if @head == nil
    @head = new_node
    else @head.next_node == nil
      @head.next_node = new_node
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