class Rover

  ChangeRightDirectionMap = {
    Direction::North => Direction::East,
    Direction::East => Direction::South,
    Direction::South => Direction::West,
    Direction::West => Direction::North
  }

  ChangeLeftDirectionMap = ChangeRightDirectionMap.invert

  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    self.x = x
    self.y = y
    self.direction = direction
  end

  def move
    if self.direction == Direction::North
    self.y = self.y + 1
    elsif self.direction == Direction::East
    self.x = self.x + 1
    elsif self.direction == Direction::South
    self.y = self.y - 1
    elsif self.direction == Direction::West
    self.x = self.x - 1
    else
      raise "Unknown direction '#{self.direction}'"
    end
  end

  def left
    self.direction = ChangeLeftDirectionMap[self.direction]
  end

  def right
    self.direction = ChangeRightDirectionMap[self.direction]
  end

end