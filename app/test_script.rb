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
pos = Position.new(1, 1)
robot = Robot.new(pos, 'E', world)

[
  'f', 'r', 'f', 'f', 'f', 'f', 'l'
].each do |c|
  robot.execute_sequence!(c)
  Printer.new.call(robot)
  puts ''
  puts '------------'
  puts ''
end
