# frozen_string_literal: true

# Linear collection of nodes that operates similar to an array
class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
    @size += 1
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @tail = node
    else
      node.next_node = @head
    end
    @head = node
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
    if index.negative? || index > @size
      puts 'Not valid index'
    elsif index.zero?
      insert_at_head(value)
    else
      insert_at_index(value, index)
    end
  end

  def insert_at_head(value)
    node = @head
    @head = Node.new(value)
    @head.next_node = node
    @size += 1
  end

  def insert_at_index(value, index)
    node = @head
    counter = 1
    @size.times do
      if index == counter
        insert_node(node, value)
        break
      else
        node = node.next_node
        counter += 1
      end
    end
  end

  def insert_node(node, value)
    temp_node = node.next_node
    node.next_node = Node.new(value)
    node.next_node.next_node = temp_node
    @size += 1
  end

  def remove_at(index)
    if index.negative? || index >= @size
      puts 'Not valid index'
    elsif index.zero?
      remove_head(index)
    elsif index == @size - 1
      remove_tail(index)
    else
      remove_node(index)
    end
    check_nil
  end

  def remove_head(index)
    @head = find_node(index + 1)
    @size -= 1
  end

  def remove_tail(index)
    @tail = find_node(index - 1)
    @size -= 1
  end

  def remove_node(index)
    node_before = find_node(index - 1)
    node_after = find_node(index + 1)
    node_before.next_node = node_after
    @size -= 1
  end

  def check_nil
    if @size.zero?
      @head = nil
      @tail = nil
    end
  end
end
