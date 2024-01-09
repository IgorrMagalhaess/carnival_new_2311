class Ride
   attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log

   def initialize(ride_data)
      @name = ride_data[:name]
      @min_height = ride_data[:min_height]
      @admission_fee = ride_data[:admission_fee]
      @excitement = ride_data[:excitement]
      @total_revenue = 0
      @rider_log = {}
   end

   def board_rider(visitor)
      if visitor.spending_money >= @admission_fee && visitor.preferences.include?(@excitement) && visitor.height >= @min_height
         visitor.charge_visitor(@admission_fee)
         @total_revenue += @admission_fee
         @rider_log[visitor] ||= 0
         @rider_log[visitor] += 1
      end
   end
end