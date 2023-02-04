class LinkedList 
  attr_reader :head, :count
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
    current_node = @head
    string = []
    until current_node == nil
      string << current_node.data
      current_node = current_node.next_node 
    end
    string.join(" ")
  end
  
  def prepend(data)
    @head = Node.new(data, @head)
  end

  def insert(index, data)
    new_node = Node.new(data)
    if index < 1
      "Just use the prepend method!!"
    elsif @head == nil
      @head = new_node
      "There is nothing in the list yet, so your new data was added to the head of the list, you are welcome."
    elsif index > count
      "The list is not that long, please choose a new index position that is less than #{count}"
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