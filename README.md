# Robots

This is a small experiment to allow a "robot" to traverse a "world" unless it is stoped by obstacles or the limits of the world.

The world can be round in which case a robot crossing the limit will reappear on the other side of the of the world, or walled in which case the robot will crash if it hits the wall.

## Usage

A robot can be created like this

```
world = World.new(100, 100)
robot = Robot.new(Position.new(50, 50), world)

```

A robot can be controlled either by direct commands

```
robot.forward!
robot.backup!
robot.turn_left!
robot.turn_right!
```

or by sending it a sequence

```
robot.execute_sequence!('flbrf') # => robot will execute [forward!, turn_left!, backup!, turn_right!, forward!]
```