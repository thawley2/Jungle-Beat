class LinkedList 
  attr_accessor :head
  def initialize
    @head = nil
  end

  def append(data)
    new_node = Node.new(data)
    if @head.nil?
    @head = new_node
    else 
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
    end
    data
  end

  def count 
    count = 1 
    if @head == nil
      count = 0
    else
      current_node = @head
      while current_node.next_node != nil
        count +=1
        current_node = current_node.next_node
      end
    end
    count
  end

  def to_string
    if @head.nil?
      ""
    else current_node = @head
      string = "#{@head.data}"
      until current_node.next_node == nil
        current_node = current_node.next_node 
        string += " #{current_node.data}"
      end
    end
    string
  end
  
  def prepend(data)
    @head = Node.new(data, @head)
  end

  def insert(index, data)
    new_node = Node.new(data)
    if index == 0 || @head.nil?
      prepend(data)
    elsif index > count
      append(data)
    else 
      current_node = @head
      previous_node = nil
      index.times do
        previous_node = current_node
        current_node = current_node.next_node
      end
      new_node.next_node = current_node
      previous_node.next_node = new_node
    end
    data
  end

  def find(index, number)
    string = []
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    number.times do
      string << current_node.data
      current_node = current_node.next_node
    end
    string.join(" ")
  end

  def includes?(data)
    current_node = @head
    until current_node.data == data || current_node.next_node == nil
      current_node = current_node.next_node
    end
    current_node.data == data
  end

  def pop
    current_node = @head
    previous_node = nil
    until current_node.next_node == nil
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil
    current_node.data
  end
end