class Carnival
   attr_reader :duration, :rides, :revenue

   def initialize(duration)
      @duration = duration
      @rides = []
      @revenue = 0
   end
end