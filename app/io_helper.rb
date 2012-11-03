module IOHelper
 def self.print_plateau(plateau)
   plateau.rovers.each do |rover|
     print_rover(rover)
   end
 end
 
 def self.print_rover(rover)
   puts "#{rover.x} #{rover.y} #{rover.direction}"
 end
end