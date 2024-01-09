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

   def total_revenue
      @rides.sum { |ride| ride.total_revenue }
   end

   def summary
      {
         visitor_count: count_unique_visitors,
         revenue_earned: total_revenue,
         visitors: visitors_details,
         rides: rides_details
      }
   end

   def count_unique_visitors
      @rides.flat_map { |ride| ride.rider_log.keys }.uniq.size
   end

   def visitors_details
      visitors_details = {}
      @rides.each do |ride|
         ride.rider_log.each do |visitor, rides_count|
            visitors_details[visitor.name] ||= {
               favorite_rides: [],
               total_spent: 0
            }

            visitors_details[visitor.name][:favorite_rides] << ride.name
            visitors_details[visitor.name][:total_spent] += ride.admission_fee * rides_count
         end
      end
      visitors_details
   end

   def rides_details
      rides_details = {}
      @rides.each do |ride|
         rides_details[ride.name] ||= {
            riders: ride.rider_log.keys.map(&:name),
            total_revenue: ride.total_revenue
         }
      end
      rides_details
   end
end