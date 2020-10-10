# # frozen_string_literal: true

# Operates nodes and pointer method for the LinkedList class
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end
