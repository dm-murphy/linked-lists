require_relative 'linked_list.rb'
require_relative 'node.rb'

list = LinkedList.new

puts "Let's make a list, adding 7 to the end, then 8."
list.append('7')
list.append('8')
puts list.to_s
puts
puts 'Then we can add 4 to the beginning.'
list.prepend('4')
puts list.to_s
puts
puts "The linked list size is: #{list.size}"
puts "The head node is: #{list.head}"
puts "The tail node is: #{list.tail}"
puts "The head value is: #{list.head.value}"
puts "The tail value is: #{list.tail.value}"
puts

puts "We can check the node at index of 1 here: #{list.at(1)}"
puts "And it's value: #{list.at(1).value}"
puts

puts 'We can pop the last node from the list.'
list.pop
puts list.to_s
puts

puts "But let's append that back."
list.append('8')
puts list.to_s
puts

puts 'We can check that it contains a value, like 4.'
puts list.contains?(4)
puts "We can even use strings too, '4' "
puts list.contains?('4')
puts "And make sure weird things aren't in there like 'pizza' "
puts list.contains?('pizza')
puts

puts 'We can find the index position for a value, like 7.'
puts list.find(7)
puts
puts 'We can insert new values at an index position, like 17 at index of 2.'
list.insert_at('17', 2)
puts list.to_s
puts

puts "We can remove values at index positions too, so let's take that back."
list.remove_at(2)
puts list.to_s
puts

puts 'We can even remove the head or the tail, or everything!'
list.remove_at(0)
puts list.to_s
list.remove_at(1)
puts list.to_s
list.remove_at(0)
puts list.to_s
puts
puts 'And why only use numbers?'
list.append('pizza!')
puts list.to_s
