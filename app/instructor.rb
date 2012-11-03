class Instructor

  attr_accessor :plateau
  def initialize(plateau)
    self.plateau = plateau
  end

  def deploy_rover(x, y, direction)
    rover = Rover.new(x.to_i, y.to_i, direction)
    self.plateau.rovers << rover
    rover
  end

  def instruct_rover(rover, instructions)
    instructions.each do |instruction|
      pass_instruction(rover, instruction)
    end
  end

  def pass_instruction(rover, instruction)
    if instruction == Instruction::Left
    rover.left
    elsif instruction == Instruction::Right
    rover.right
    elsif instruction == Instruction::Move
    rover.move
    else
      raise "Unknown instruction: '#{instruction}'"
    end
    
    # puts "#{rover.x} #{rover.y} #{rover.direction}"
    
  end

end