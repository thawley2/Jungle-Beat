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
    #Need to add the head node as next node to the prepended node 
    #and set all that to @head
    @head = Node.new(data, @head)
  end

  #need to iterate through list to find the "index" position
  #add inserted node to previous node's 'next_node'
  #add the inserted nodes 'next_node' equal to the node at that 'index' location
  def insert(local, data)
    if @head == nil
      @head = Node.new(data)
      "There is nothing in the list yet, so your new data was added to the head of the list, you are welcome."
    elsif local > count
      "The list is not that long, please choose a new index position that is less than #{count}"
    else 
      current_node = @head
      local.times do
        current_node = current_node.next_node
      end

    end
  end
end