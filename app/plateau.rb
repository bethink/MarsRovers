class Plateau
  
  attr_accessor :upper_ordinate, :rovers
  
  def initialize(ordinate)
    self.upper_ordinate = ordinate
    self.rovers = []
  end
  
end