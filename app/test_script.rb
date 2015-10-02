require "./app/position"
require "./app/printer"
require "./app/world"
require "./app/robot"

obstacles = [
  Position.new(3, 3),
  Position.new(4, 3),
  Position.new(5, 3)
]
world = World.new(10, 10, obstacles)
pos = Position.new(5, 5)
robot = Robot.new(pos, 'E', world)

options = ['f', 'b', 'r', 'l']
puts ''
puts '---START---'
puts ''
no_crash = true
while(no_crash) do
  c = options.sample
  puts ''
  puts "-----#{c}-----"
  puts ''
  no_crash = robot.execute_sequence!(c)
  Printer.new.call(robot)
end

puts '---STOP---'