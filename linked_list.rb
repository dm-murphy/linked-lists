class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    value = Node.new(value)
    if @head.nil?
      @head = value
    else
      @tail.next_node = value
    end
    @tail = value
    @size += 1
  end

  def prepend(value)
    value = Node.new(value)
    if @head.nil?
      @tail = value
    else
      value.next_node = @head
    end
    @head = value
    @size += 1
  end

  def to_s
    string = ''
    node = @head
    @size.times do
      string += "( #{node.value} ) -> "
      node = node.next_node
    end
    string += ' nil '
  end

  def pop
    node = @head
    (@size - 1).times do
      if node.next_node == @tail
        @tail = node
        @tail.next_node = nil
        @size -= 1
      else
        node = node.next_node
      end
    end
  end

  def at(index)
    if index.is_a?(String)
      puts 'Enter a valid number'
    elsif index >= size || index.negative?
      puts 'Not valid index'
    else
      find_node(index)
    end
  end

  def find_node(index)
    node = @head
    list_index = 0
    loop do
      break if list_index == index

      list_index += 1
      node = node.next_node
    end
    node
  end

  def contains?(value)
    node = @head
    @size.times do
      node.value == value.to_s ? (return true) : node = node.next_node
    end
    false
  end

  def find(value)
    contains?(value) ? find_index(value) : nil
  end
    
  def find_index(value)
    node = @head
    counter = 0
    index = 0
    loop do
      if node.value == value.to_s
        index = counter
        break
      else
        node = node.next_node
      end
      counter += 1
    end
    index
  end

  def insert_at(value, index)
    node = @head
    #puts node.value # for debugging
    if index.zero?
      @head = Node.new(value)
      #puts @head.value # for debugging
      @head.next_node = node
      @size += 1
    elsif index.negative? || index > @size
      puts 'Not valid index'
    else
      counter = 1
      (@size).times do # or size if given index is more than @size
        if index == counter
          temp_node = node.next_node
          node.next_node = Node.new(value)
          node.next_node.next_node = temp_node
          @size += 1
          break
        else
          node = node.next_node
          counter += 1
        end
      end
    end
  end  

end

list = LinkedList.new

list.append('7')
list.append('8')

list.prepend('4')

# puts list.to_s

# puts
# puts list.size
# puts list.head
# puts list.tail
# puts

# puts list.at(1)
# puts

# list.pop
# puts list.to_s
# puts

# list.append('8')

# puts list.contains?(4)
# puts list.contains?(8)
# puts list.contains?(18)
# puts

# puts list.find(4)
# puts list.find(19)
# puts list.find(8)

puts list.to_s
list.insert_at('17', 2)
puts list.to_s

puts
puts
puts
 puts list.at(1)
 puts




