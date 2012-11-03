require 'test/unit'

Dir.glob('./app/*.rb').collect{|i| require i }
class InstructorTest < Test::Unit::TestCase
  def setup
    @plateau = Plateau.new([5, 5])
    @instructor = Instructor.new(@plateau)

  # @positions_instructions = [
  # ['1 3 L', 'LRM']
  # ]

  end

  def test_setups
    assert_equal [5,5], @plateau.upper_ordinate
    assert @plateau.rovers.empty?
    assert_not_nil @instructor.plateau
  end

  def test_deploy_rover
    rover = @instructor.deploy_rover(1, 3, Direction::North)
    assert_equal rover, @plateau.rovers.first

    assert_equal [1,3], [rover.x, rover.y]
    assert_equal Direction::North, rover.direction
  end

  def test_pass_instruction_for_left
    rover = Rover.new(1, 3, Direction::North)
    @instructor.pass_instruction(rover, Instruction::Left)
    assert_equal Direction::West, rover.direction

    rover = Rover.new(1, 3, Direction::East)
    @instructor.pass_instruction(rover, Instruction::Left)
    assert_equal Direction::North, rover.direction

    rover = Rover.new(1, 3, Direction::South)
    @instructor.pass_instruction(rover, Instruction::Left)
    assert_equal Direction::East, rover.direction

    rover = Rover.new(1, 3, Direction::West)
    @instructor.pass_instruction(rover, Instruction::Left)
    assert_equal Direction::South, rover.direction
  end

  def test_pass_instruction_for_right
    rover = Rover.new(1, 3, Direction::West)
    @instructor.pass_instruction(rover, Instruction::Right)
    assert_equal Direction::North, rover.direction

    rover = Rover.new(1, 3, Direction::North)
    @instructor.pass_instruction(rover, Instruction::Right)
    assert_equal Direction::East, rover.direction

    rover = Rover.new(1, 3, Direction::East)
    @instructor.pass_instruction(rover, Instruction::Right)
    assert_equal Direction::South, rover.direction

    rover = Rover.new(1, 3, Direction::South)
    @instructor.pass_instruction(rover, Instruction::Right)
    assert_equal Direction::West, rover.direction
  end

  def test_pass_instruction_for_move
    rover = Rover.new(1, 3, Direction::North)
    @instructor.pass_instruction(rover, Instruction::Move)
    assert_equal [1,4], [rover.x, rover.y]

    rover = Rover.new(1, 3, Direction::East)
    @instructor.pass_instruction(rover, Instruction::Move)
    assert_equal [2,3], [rover.x, rover.y]

    rover = Rover.new(1, 3, Direction::South)
    @instructor.pass_instruction(rover, Instruction::Move)
    assert_equal [1,2], [rover.x, rover.y]

    rover = Rover.new(1, 3, Direction::West)
    @instructor.pass_instruction(rover, Instruction::Move)
    assert_equal [0, 3], [rover.x, rover.y]
  end

end