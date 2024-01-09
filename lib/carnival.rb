class Carnival
   attr_reader :duration, :rides, :revenue

   def initialize(duration)
      @duration = duration
      @rides = []
      @revenue = 0
   end

   def add_ride(ride)
      @rides << ride
   end

   def most_popular_ride
      @rides.max_by { |ride| (ride.rider_log.values.sum) }
   end

   def most_profitable_ride
      @rides.max_by { |ride| ride.total_revenue } 
   end
end