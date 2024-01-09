require 'spec_helper'

RSpec.describe Carnival do
   describe '#initialize' do
      it 'exists' do
         carnival = Carnival.new(30)

         expect(carnival).to be_a Carnival
      end

      it 'has a duration' do
         carnival = Carnival.new(30)

         expect(carnival.duration).to eq(30)
      end

      it 'starts with no rides' do
         carnival = Carnival.new(30)

         expect(carnival.rides).to eq([])
      end

      it 'starts with no revenue' do
         carnival = Carnival.new(30)

         expect(carnival.revenue).to eq(0)
      end
   end

   describe '#add_ride' do
      it 'adds rides to the Carnival' do
         carnival = Carnival.new(30)
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

         expect(carnival.add_ride(ride1)).to eq([ride1])
      end

      it 'adds the ride to the Carnival rides' do
         carnival = Carnival.new(30)
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })

         carnival.add_ride(ride1)
         carnival.add_ride(ride2)

         expect(carnival.rides).to eq([ride1, ride2])
      end
   end

   describe '#most_popular_ride' do
      it 'tell us the most popular ride' do
         carnival = Carnival.new(30)
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
         ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
         visitor1 = Visitor.new('Bruce', 54, '$10')
         visitor2 = Visitor.new('Tucker', 54, '$5')
         visitor3 = Visitor.new('Penny', 64, '$15')
         carnival.add_ride(ride1)
         carnival.add_ride(ride2)
         carnival.add_ride(ride3)

         visitor1.add_preference(:gentle)
         visitor2.add_preference(:gentle)
         visitor2.add_preference(:thrilling)
         visitor3.add_preference(:thrilling)

         ride1.board_rider(visitor1)
         ride1.board_rider(visitor2)
         ride1.board_rider(visitor1)

         ride2.board_rider(visitor1)

         ride3.board_rider(visitor3)
         ride3.board_rider(visitor3)
         ride3.board_rider(visitor2)
         ride3.board_rider(visitor2)

         expect(carnival.most_popular_ride).to eq(ride3)
      end
   end

   describe '#most_profitable_ride' do
      it 'returns the ride with largest profit' do
         carnival = Carnival.new(30)
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
         ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
         visitor1 = Visitor.new('Bruce', 54, '$20')
         visitor2 = Visitor.new('Tucker', 54, '$20')
         visitor3 = Visitor.new('Penny', 64, '$20')
         carnival.add_ride(ride1)
         carnival.add_ride(ride2)
         carnival.add_ride(ride3)

         visitor1.add_preference(:gentle)
         visitor2.add_preference(:gentle)
         visitor2.add_preference(:thrilling)
         visitor3.add_preference(:thrilling)

         ride1.board_rider(visitor1)
         ride1.board_rider(visitor2)
         ride1.board_rider(visitor1)

         ride2.board_rider(visitor1)
         ride2.board_rider(visitor1)

         ride3.board_rider(visitor3)
         ride3.board_rider(visitor3)
         ride3.board_rider(visitor2)
         ride3.board_rider(visitor2)

         expect(carnival.most_profitable_ride).to eq(ride2)
      end
   end

   describe '#total_revenue' do
      it 'sums profit from all the rides' do
         carnival = Carnival.new(30)
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
         ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
         visitor1 = Visitor.new('Bruce', 54, '$20')
         visitor2 = Visitor.new('Tucker', 54, '$20')
         visitor3 = Visitor.new('Penny', 64, '$20')
         carnival.add_ride(ride1)
         carnival.add_ride(ride2)
         carnival.add_ride(ride3)

         visitor1.add_preference(:gentle)
         visitor2.add_preference(:gentle)
         visitor2.add_preference(:thrilling)
         visitor3.add_preference(:thrilling)

         ride1.board_rider(visitor1)
         ride1.board_rider(visitor2)
         ride1.board_rider(visitor1)

         ride2.board_rider(visitor1)
         ride2.board_rider(visitor1)

         ride3.board_rider(visitor3)
         ride3.board_rider(visitor3)
         ride3.board_rider(visitor2)
         ride3.board_rider(visitor2)

         expect(carnival.total_revenue).to eq(21)
      end
   end

   describe '#summary' do
      it 'has a visitor_count' do
         carnival = Carnival.new(30)
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
         ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
         visitor1 = Visitor.new('Bruce', 54, '$20')
         visitor2 = Visitor.new('Tucker', 54, '$20')
         visitor3 = Visitor.new('Penny', 64, '$20')
         visitor4 = Visitor.new('Joseph', 60, '$20')
         visitor5 = Visitor.new('Carl', 61, '$20')

         carnival.add_ride(ride1)
         carnival.add_ride(ride2)
         carnival.add_ride(ride3)

         visitor1.add_preference(:gentle)
         visitor2.add_preference(:gentle)
         visitor2.add_preference(:thrilling)
         visitor3.add_preference(:thrilling)
         visitor3.add_preference(:gentle)
         visitor4.add_preference(:thrilling)
         visitor4.add_preference(:gentle)
         visitor5.add_preference(:thrilling)
         visitor5.add_preference(:gentle)

         ride1.board_rider(visitor1)
         ride1.board_rider(visitor2)
         ride1.board_rider(visitor3)


         ride2.board_rider(visitor1)
         ride2.board_rider(visitor5)

         ride3.board_rider(visitor3)
         ride3.board_rider(visitor4)
         ride3.board_rider(visitor2)
         ride3.board_rider(visitor5)

         expect(carnival.summary[:visitor_count]).to eq(5)
      end
   end
end